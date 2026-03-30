package com.example.DoAn.controller.admin;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.DoAn.domain.Categories;
import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.ProductImage;
import com.example.DoAn.repository.ProductImageRepository;
import com.example.DoAn.service.CategoriesService;
import com.example.DoAn.service.ProductService;
import com.example.DoAn.service.UploadService;
import com.example.DoAn.utils.StringUtils;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;
    private final ProductImageRepository productImageRepository;
    private final CategoriesService categoriesService;

    public ProductController(ProductService productService, UploadService uploadService,
            ProductImageRepository productImageRepository, CategoriesService categoriesService) {
        this.productService = productService;
        this.uploadService = uploadService;
        this.productImageRepository = productImageRepository;
        this.categoriesService = categoriesService;
    }

    // View
    @RequestMapping("/admin/product")
    public String getProductPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
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

        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by(Sort.Direction.DESC, "createdAt"));
        Page<Product> ProductPage = this.productService.getAllProducts(pageable);
        List<Product> products = ProductPage.getContent();

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ProductPage.getTotalPages());
        model.addAttribute("activePage", "product");
        return "admin/product/show";
    }

    // Create
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());

        List<Categories> categories = this.categoriesService.getAll();
        model.addAttribute(("categories"), categories);
        return "admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String createProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductBindingResult,
            @RequestParam("categoryIds") List<Long> categoryIds,
            @RequestParam("imageFile") MultipartFile[] files) {

        newProduct.setName(newProduct.getName().trim());
        if (this.productService.getProductByName(newProduct.getName()) != null) {
            newProductBindingResult.rejectValue("name", "", "Tên sản phẩm đã tồn tại!");
        }
        // validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        if (newProduct.getSalePrice() == null) {
            newProduct.setSalePrice(0.0); // hoặc giá mặc định khác
        }

        List<Categories> categories = this.categoriesService.getCategoriesByIds(categoryIds);
        newProduct.setCategories(categories);

        // save
        this.productService.handleSaveProduct(newProduct);

        // Lấy tên sản phẩm để tạo thư mục riêng
        String productFolder = StringUtils.removeAccent(newProduct.getName()).replaceAll("\\s+", "_");

        List<ProductImage> images = new ArrayList<>();
        for (MultipartFile file : files) {
            String imageUrl = this.uploadService.handleSaveUploadImage(file, productFolder);

            if (!imageUrl.isEmpty()) {
                ProductImage image = new ProductImage();
                image.setImageUrl(imageUrl);
                image.setProduct(newProduct);
                images.add(image);
            }
        }

        productImageRepository.saveAll(images);

        return "redirect:/admin/product";
    }

    // View detail
    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

    // Update
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Optional<Product> currentProduct = this.productService.fetchProductById(id);
        List<Categories> categories = this.categoriesService.getAll();
        List<ProductImage> productImages = productImageRepository.findByProduct(currentProduct.get());
        model.addAttribute(("categories"), categories);
        model.addAttribute(("productImages"), productImages);
        model.addAttribute("updateProduct", currentProduct.get());
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("updateProduct") Product productUpdate,
            BindingResult newProductBindingResult,
            @RequestParam Map<String, MultipartFile> files) {
        Product product = this.productService.fetchProductById(productUpdate.getId()).get();

        if (product != null) {

            if (newProductBindingResult.hasErrors()) {
                return "admin/product/update";
            } else {
                List<ProductImage> existingImages = productImageRepository.findByProduct(product);

                for (ProductImage image : existingImages) {
                    String paramName = "newImage_" + image.getId();
                    MultipartFile file = files.get(paramName);

                    if (file != null && !file.isEmpty()) {
                        // Xóa ảnh cũ khỏi thư mục
                        this.uploadService.updateProductImage(image.getImageUrl());
                        String productFolder = StringUtils.removeAccent(product.getName()).replaceAll("\\s+", "_");
                        // Lưu ảnh mới
                        String newImagePath = this.uploadService.handleSaveUploadImage(file, productFolder);
                        image.setImageUrl(newImagePath);
                        productImageRepository.save(image);
                    }
                }
                if (productUpdate.getSalePrice() == null) {
                    product.setSalePrice(0.0);
                } else {
                    product.setSalePrice(productUpdate.getSalePrice());
                }
                product.setPrice(productUpdate.getPrice());
                product.setQuantity(productUpdate.getQuantity());
                product.setDetailDesc(productUpdate.getDetailDesc());
                product.setShortDesc(productUpdate.getShortDesc());
                product.setUpdatedAt(LocalDateTime.now());
                this.productService.handleSaveProduct(product);
            }
        }

        return "redirect:/admin/product";
    }

    // Delete
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product pr) {
        Product product = this.productService.fetchProductById(pr.getId()).get();
        this.uploadService.deleteProductImagesFromFolder(product);
        this.productService.deleteProduct(pr.getId());
        return "redirect:/admin/product";
    }
}
