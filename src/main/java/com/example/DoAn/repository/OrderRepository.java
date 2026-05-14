package com.example.DoAn.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.Order;
import com.example.DoAn.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

    List<Order> findByUserAndStatus(User user, String status);

    Page<Order> findAll(Pageable page);

    List<Order> findByStatus(String status);

    @Query(value = """
            SELECT DATE(created_at) AS day, SUM(total_price) AS total
            FROM orders
            WHERE status = 'COMPLETE' AND payment_status = 1 AND created_at >= CURDATE() - INTERVAL :days DAY
            GROUP BY DATE(created_at)
            ORDER BY DATE(created_at)
            """, nativeQuery = true)
    List<Object[]> getDailyRevenueNative(@Param("days") int days);

    @Query(value = """
                SELECT
                    u.id AS userId,
                    u.full_name AS userName,
                    u.phone AS userPhone,
                    COUNT(o.id) AS totalOrders,
                    SUM(o.total_price) AS totalSpent
                FROM orders o
                JOIN users u ON o.user_id = u.id
                WHERE o.status = 'COMPLETE' AND o.payment_status = 1 AND o.created_at >= CURDATE() - INTERVAL :days DAY
                GROUP BY u.id, u.full_name, u.phone
                ORDER BY totalSpent DESC
                LIMIT 5
            """, nativeQuery = true)
    List<Object[]> getTopCustomersRaw(@Param("days") int days);

    @Query("SELECT SUM(o.totalPrice) FROM Order o WHERE o.status = 'COMPLETE' AND o.paymentStatus = 1 AND o.createdAt >= current_date() - :days day")
    Double getTotalRevenue(@Param("days") int days);

    @Query("SELECT COUNT(o.id) FROM Order o WHERE o.status = 'COMPLETE' AND o.paymentStatus = 1 AND o.createdAt >= current_date() - :days day")
    Long countAllCompletedOrdersWithinDays(@Param("days") int days);

}
