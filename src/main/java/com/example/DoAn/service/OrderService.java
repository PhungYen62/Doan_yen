package com.example.DoAn.service;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.DoAn.domain.Order;
import com.example.DoAn.domain.OrderDetail;
import com.example.DoAn.domain.User;
import com.example.DoAn.domain.dto.RevenuePerDayDTO;
import com.example.DoAn.domain.dto.TopCustomerDTO;
import com.example.DoAn.repository.OrderDetailRepository;
import com.example.DoAn.repository.OrderRepository;
import com.example.DoAn.repository.ProductRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ProductRepository productRepository;
    private final ProductService productService;

    public OrderService(
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository, ProductRepository productRepository,
            ProductService productService) {
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
        this.productService = productService;
    }

    public Page<Order> fetchAllOrders(Pageable page) {
        return this.orderRepository.findAll(page);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public List<Order> fetchOrdersByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    @Transactional
    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            boolean stockShouldBeDeducted = isStockDeductingStatus(order.getStatus())
                    && !isStockDeductingStatus(currentOrder.getStatus());
            boolean stockShouldBeRestored = !isStockDeductingStatus(order.getStatus())
                    && isStockDeductingStatus(currentOrder.getStatus());

            if (stockShouldBeDeducted) {
                List<OrderDetail> orderDetails = currentOrder.getOrderDetails();
                for (OrderDetail orderDetail : orderDetails) {
                    this.productRepository.findById(orderDetail.getProduct().getId()).ifPresent(product -> {
                        product.setQuantity(product.getQuantity() - orderDetail.getQuantity());
                        this.productService.handleSaveProduct(product);
                    });
                }
            } else if (stockShouldBeRestored) {
                List<OrderDetail> orderDetails = currentOrder.getOrderDetails();
                for (OrderDetail orderDetail : orderDetails) {
                    this.productRepository.findById(orderDetail.getProduct().getId()).ifPresent(product -> {
                        product.setQuantity(product.getQuantity() + orderDetail.getQuantity());
                        this.productService.handleSaveProduct(product);
                    });
                }
            }
            currentOrder.setStatus(order.getStatus());
            if ("COMPLETE".equals(order.getStatus())) {
                currentOrder.setPaymentStatus(1);
            }
            this.orderRepository.save(currentOrder);
        }
    }

    private boolean isStockDeductingStatus(String status) {
        return "SHIPPING".equals(status) || "COMPLETE".equals(status);
    }

    public void deleteOrderById(long id) {
        // delete order detail
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }

        this.orderRepository.deleteById(id);
    }

    // Lấy doanh thu theo số ngày
    public List<RevenuePerDayDTO> getDailyRevenue(int days) {
        List<Object[]> result = orderRepository.getDailyRevenueNative(days);

        return result.stream()
                .map(row -> {
                    java.sql.Date sqlDate = (java.sql.Date) row[0];

                    Object totalObj = row[1];
                    BigDecimal total;
                    if (totalObj instanceof Double) {
                        total = BigDecimal.valueOf((Double) totalObj);
                    } else if (totalObj instanceof BigDecimal) {
                        total = (BigDecimal) totalObj;
                    } else {
                        total = BigDecimal.ZERO;
                    }

                    return new RevenuePerDayDTO(sqlDate.toLocalDate(), total);
                })
                .collect(Collectors.toList());
    }

    // Lây top 5 khách hàng
    public List<TopCustomerDTO> getTopCustomers(int days) {
        List<Object[]> result = orderRepository.getTopCustomersRaw(days);

        return result.stream()
                .map(row -> {
                    Long userId = ((Number) row[0]).longValue();
                    String userName = (String) row[1];
                    String userPhone = (String) row[2];
                    Long totalOrders = ((Number) row[3]).longValue();
                    Double totalSpent = (Double) row[4];

                    return new TopCustomerDTO(userId, userName, userPhone, totalOrders, totalSpent);
                })
                .collect(Collectors.toList());
    }

    public Double getTotalRevenue(int days) {
        return this.orderRepository.getTotalRevenue(days);
    }

    // Lấy tổng số đơn hàng đã hoàn thành và thanh toán trong khoảng thời gian
    public Long countCompletedOrders(int days) {
        return this.orderRepository.countAllCompletedOrdersWithinDays(days);
    }

    // Lấy tổng số đơn hàng tổng quát
    public Long countAllOrders() {
        return this.orderRepository.count();
    }

    // Lấy tổng số đơn hàng theo trạng thái
    public Long countOrdersByStatus(String status) {
        return (long) this.orderRepository.findByStatus(status).size();
    }
}
