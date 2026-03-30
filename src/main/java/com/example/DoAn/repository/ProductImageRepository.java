package com.example.DoAn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {
    List<ProductImage> findByProduct(Product product);

}
