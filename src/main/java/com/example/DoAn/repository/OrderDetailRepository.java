package com.example.DoAn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    // Custom query methods can be defined here if needed
    // For example, you can add methods to find order details by order, product,
    // etc.

}
