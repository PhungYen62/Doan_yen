package com.example.DoAn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.Province;
import com.example.DoAn.repository.ProductRepository;
import com.example.DoAn.repository.ProvinceRepository;

@Service
public class ProvinceService {
    private final ProvinceRepository provinceRepository;
    private final ProductRepository productRepository;

    public ProvinceService(ProvinceRepository provinceRepository, ProductRepository productRepository) {
        this.provinceRepository = provinceRepository;
        this.productRepository = productRepository;
    }

    public Page<Province> getAllProvinces(Pageable pageable) {
        return this.provinceRepository.findAll(pageable);
    }

    public List<Province> getAllProvinces() {
        return this.provinceRepository.findAllByOrderByNameAsc();
    }

    public Optional<Province> getProvinceById(Long id) {
        if (id == null) {
            return Optional.empty();
        }
        return this.provinceRepository.findById(id);
    }

    public Optional<Province> getProvinceByCode(String code) {
        if (code == null || code.isBlank()) {
            return Optional.empty();
        }
        return this.provinceRepository.findByCode(code);
    }

    public Optional<Province> getProvinceByName(String name) {
        if (name == null || name.isBlank()) {
            return Optional.empty();
        }
        return this.provinceRepository.findByNameIgnoreCase(name.trim());
    }

    public Province saveProvince(Province province) {
        return this.provinceRepository.save(province);
    }

    public void deleteProvinceById(Long provinceId) {
        if (provinceId == null) {
            return;
        }

        List<Product> linkedProducts = this.productRepository.findByProvince_Id(provinceId);
        if (!linkedProducts.isEmpty()) {
            for (Product product : linkedProducts) {
                product.setProvince(null);
            }
            this.productRepository.saveAll(linkedProducts);
        }

        this.provinceRepository.deleteById(provinceId);
    }

    public List<Product> getProductsByProvinceId(Long provinceId) {
        if (provinceId == null) {
            return List.of();
        }
        return this.productRepository.findByProvince_IdAndIsDeletedFalse(provinceId);
    }
}
