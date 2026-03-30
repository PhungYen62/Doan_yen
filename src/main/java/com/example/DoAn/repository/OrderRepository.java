package com.example.DoAn.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.Order;
import com.example.DoAn.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

    Page<Order> findAll(Pageable page);

    List<Order> findByStatus(String status);

    @Query(value = """
            SELECT DATE(created_at) AS day, SUM(total_price) AS total
            FROM orders
            WHERE status = 'COMPLETE' AND created_at >= CURDATE() - INTERVAL 6 DAY
            GROUP BY DATE(created_at)
            ORDER BY DATE(created_at)
            """, nativeQuery = true)
    List<Object[]> getDailyRevenueLast7DaysNative();

    @Query(value = """
                SELECT
                    u.id AS userId,
                    u.full_name AS userName,
                    u.phone AS userPhone,
                    COUNT(o.id) AS totalOrders,
                    SUM(o.total_price) AS totalSpent
                FROM orders o
                JOIN users u ON o.user_id = u.id
                WHERE o.status = 'COMPLETE'
                GROUP BY u.id, u.full_name, u.phone
                ORDER BY totalSpent DESC
                LIMIT 5
            """, nativeQuery = true)
    List<Object[]> getTopCustomersRaw();

    @Query("SELECT SUM(o.totalPrice) FROM Order o WHERE o.status = 'COMPLETE'")
    Double getTotalRevenue();

}
