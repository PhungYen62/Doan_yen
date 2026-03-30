package com.example.DoAn.service;

import java.util.HashSet;
import java.util.List;
import java.util.Locale.Category;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.DoAn.domain.Categories;
import com.example.DoAn.domain.Product;
import com.example.DoAn.repository.CategoriesRepository;
import com.example.DoAn.repository.ProductRepository;

@Service
public class CategoriesService {
    private final CategoriesRepository categoriesRepository;
    private final ProductRepository productRepository;

    public CategoriesService(CategoriesRepository categoriesRepository, ProductRepository productRepository) {
        this.categoriesRepository = categoriesRepository;
        this.productRepository = productRepository;
    }

    public Page<Categories> getAllCate(Pageable page) {
        return this.categoriesRepository.findAll(page);
    }

    public List<Categories> getAll() {
        return this.categoriesRepository.findAll();
    }

    public Categories handleSaveCategories(Categories categories) {
        Categories categories2 = this.categoriesRepository.save(categories);
        return categories2;
    }

    public Categories getCategoriesByName(String name) {
        return this.categoriesRepository.findByName(name);
    }

    public Categories getCategoriesById(long id) {
        return this.categoriesRepository.findById(id);
    }

    public void deleteCategories(long id) {
        // Tìm danh mục theo ID
        Categories category = categoriesRepository.findById(id);

        // Gỡ liên kết với tất cả sản phẩm trước
        for (Product product : category.getProducts()) {
            product.getCategories().remove(category);
        }

        // Cập nhật lại sản phẩm sau khi xoá liên kết
        productRepository.saveAll(category.getProducts());

        // Xóa danh mục
        categoriesRepository.delete(category);
    }

    // Hàm lấy danh sách danh mục theo ID
    public List<Categories> getCategoriesByIds(List<Long> categoryIds) {

        return this.categoriesRepository.findAllById(categoryIds);
    }

}
