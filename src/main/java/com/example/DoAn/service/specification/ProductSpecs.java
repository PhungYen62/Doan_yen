package com.example.DoAn.service.specification;

import jakarta.persistence.criteria.Join;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.Product_;

import jakarta.persistence.criteria.Expression;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
        };
    }

    // public static Specification<Product> priceBetween(Double minPrice, Double
    // maxPrice) {
    // return (root, query, criteriaBuilder) -> {
    // return criteriaBuilder.between(root.get(Product_.PRICE), minPrice, maxPrice);
    // };
    // }

    public static Specification<Product> priceBetween(Double minPrice, Double maxPrice) {
        return (root, query, cb) -> {
            Expression<Double> effectivePrice = cb.<Double>selectCase()
                    .when(cb.isNotNull(root.get("salePrice")), root.get("price"))
                    .otherwise(root.get("price"));

            return cb.between(effectivePrice, minPrice, maxPrice);
        };
    }

    public static Specification<Product> hasCategories(List<Long> categoryIds) {
        if (categoryIds == null || categoryIds.isEmpty())
            return null;

        return (root, query, cb) -> {
            // Join từ Product -> categories
            Join<Object, Object> join = root.join("categories");
            return join.get("id").in(categoryIds);
        };
    }

    public static Specification<Product> isNotDeleted() {
        return (root, query, cb) -> cb.isFalse(root.get("isDeleted"));
    }

}
