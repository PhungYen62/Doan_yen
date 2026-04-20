package com.example.DoAn.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {

    Page<Product> findByIsDeletedFalse(Pageable page);

    Page<Product> findAll(Specification<Product> speci, Pageable page);

    Product save(Product product);

    Product findByName(String name);

    List<Product> findByIsDeletedFalse();

    List<Product> findByProvince_Id(Long provinceId);

    List<Product> findByProvince_IdAndIsDeletedFalse(Long provinceId);

    Page<Product> findByProvince_IdAndIsDeletedFalse(Long provinceId, Pageable pageable);

    Page<Product> findByCategories_IdInAndIdNotAndIsDeletedFalse(List<Long> categoryIds, Long excludedProductId,
            Pageable pageable);

    @Query("SELECT COUNT(p) FROM Product p WHERE p.isDeleted = false")
    Long countAllProducts();

    // Lấy ra danh sách sản phẩm sắp hết hàng
    @Query("SELECT p FROM Product p WHERE p.quantity < 20 AND p.isDeleted = false")
    List<Product> findProductsLowStock();

}
