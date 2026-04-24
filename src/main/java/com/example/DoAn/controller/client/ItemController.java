package com.example.DoAn.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DoAn.domain.Categories;
import com.example.DoAn.domain.Product;
import com.example.DoAn.service.CategoriesService;
import com.example.DoAn.service.ProductService;

@Controller
public class ItemController {
    private final CategoriesService categoriesService;
    private final ProductService productService;

    public ItemController(CategoriesService categoriesService, ProductService productService) {
        this.categoriesService = categoriesService;
        this.productService = productService;
    }

    @GetMapping("/product")
    public String getShopPage(Model model,
            @RequestParam("page") Optional<String> pageOptional,
            @RequestParam("name") Optional<String> nameOptional,
            @RequestParam("category") Optional<String> categoryStrOptional,
            @RequestParam("minPrice") Optional<String> minPriceOptional,
            @RequestParam("maxPrice") Optional<String> maxPriceOptional,
            @RequestParam("province") Optional<String> provinceOptional,
            @RequestParam("sort") Optional<String> sortOptional,
            @RequestParam(name = "partial", defaultValue = "false") boolean partial) {
        List<Categories> categories = this.categoriesService.getAll();
        model.addAttribute("categories", categories);
        int page = 1;

        try {
            if (pageOptional.isPresent()) {
                // convert from String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
        } catch (Exception e) {

        }

        List<Long> categoryIds = new ArrayList<>();

        if (categoryStrOptional.isPresent()) {
            String categoryStr = categoryStrOptional.get();
            categoryIds = Arrays.stream(categoryStr.split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .map(Long::parseLong)
                    .collect(Collectors.toList());
        }

        // Sort
        String sort = sortOptional.orElse(null);
        Sort sortOrder = Sort.by(Sort.Order.desc("createdAt"));
        if ("gia-tang-dan".equals(sort)) {
            sortOrder = Sort.by(
                    Sort.Order.asc("salePrice"),
                    Sort.Order.asc("price"),
                    Sort.Order.desc("createdAt"));
        } else if ("gia-giam-dan".equals(sort)) {
            sortOrder = Sort.by(
                    Sort.Order.desc("salePrice"),
                    Sort.Order.desc("price"),
                    Sort.Order.desc("createdAt"));
        }

        Double minPrice = minPriceOptional.map(Double::parseDouble).orElse(0.0);
        Double maxPrice = null;
        if (maxPriceOptional.isPresent() && !maxPriceOptional.get().isBlank()) {
            maxPrice = Double.parseDouble(maxPriceOptional.get());
        }
        if (maxPrice != null && maxPrice == 0) {
            maxPrice = null;
        }

        String name = nameOptional.isPresent() ? nameOptional.get() : "";
        Long provinceId = null;
        if (provinceOptional.isPresent() && !provinceOptional.get().isBlank()) {
            provinceId = Long.parseLong(provinceOptional.get());
        }

        Pageable pageable = PageRequest.of(page - 1, 9, sortOrder);
        Page<Product> ProductPage = this.productService.getAllProductsWithSpec(pageable, name, minPrice, maxPrice,
                categoryIds, provinceId);
        List<Product> products = ProductPage.getContent();
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ProductPage.getTotalPages());
        model.addAttribute("selectedCategory", categoryStrOptional.orElse(""));
        model.addAttribute("selectedProvinceId", provinceId);
        model.addAttribute("selectedSort", sortOptional.orElse(""));
        model.addAttribute("selectedName", name);
        model.addAttribute("selectedMinPrice", minPriceOptional.orElse(""));
        model.addAttribute("selectedMaxPrice", maxPriceOptional.orElse(""));

        List<Product> allProducts = this.productService.getAllProducts();
        List<Product> discountedProducts = new ArrayList<>();
        for (Product p : allProducts) {
            if (p.getSalePrice() != null && p.getSalePrice() > 0 && p.getSalePrice() < p.getPrice()) {
                discountedProducts.add(p);
            }
        }
        Collections.sort(discountedProducts, new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                double percent1 = (p1.getPrice() - p1.getSalePrice()) / p1.getPrice();
                double percent2 = (p2.getPrice() - p2.getSalePrice()) / p2.getPrice();
                return Double.compare(percent2, percent1); // giảm dần
            }
        });
        List<Product> topDiscountedProducts = new ArrayList<>();
        for (int i = 0; i < Math.min(8, discountedProducts.size()); i++) {
            topDiscountedProducts.add(discountedProducts.get(i));
        }
        model.addAttribute("topDiscountedProducts", topDiscountedProducts);
        model.addAttribute("activePage", "activeProduct");
        if (partial) {
            return "client/product/product-grid";
        }
        return "client/product/shop";
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(Model model, @PathVariable("id") long id) {
        Product pr = this.productService.fetchProductById(id).get();
        List<Product> relatedProducts = this.productService.findRelatedProducts(pr);
        model.addAttribute("relatedProducts", relatedProducts);
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    // @GetMapping("/products/ajax")
    // public String getProductsAjax(
    // @RequestParam(value = "sort", required = false) String sort,
    // @RequestParam(value = "page", defaultValue = "1") int page,
    // Model model) {

    // List<Product> allProducts = productService.getAllProducts();
    // List<Product> sortedProducts = new ArrayList<>();

    // for (Product p : allProducts) {
    // // Tạo bản sao hoặc giữ nguyên nếu không dùng chung
    // Product clone = new Product();
    // clone.setId(p.getId());
    // clone.setName(p.getName());
    // clone.setShortDesc(p.getShortDesc());
    // clone.setFirstImage(p.getFirstImage());
    // clone.setSalePrice(p.getSalePrice());
    // clone.setOriginalPrice(p.getPrice()); // nếu bạn có field này để hiển thị
    // double finalPrice = (p.getSalePrice() > 0 && p.getSalePrice() < p.getPrice())
    // ? p.getSalePrice()
    // : p.getPrice();
    // clone.setPrice(finalPrice); // Gán price = giá hiển thị thực tế

    // sortedProducts.add(clone);
    // }

    // return "client/layout/product-list.jsp"; // Đây là file JSP chỉ chứa danh
    // sách + phân trang
    // }
}
