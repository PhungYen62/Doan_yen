package com.example.DoAn.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import com.example.DoAn.domain.Categories;
import com.example.DoAn.domain.Product;
import com.example.DoAn.service.CategoriesService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoriesController {
    private final CategoriesService categoriesService;

    public CategoriesController(CategoriesService categoriesService) {
        this.categoriesService = categoriesService;
    }

    @RequestMapping("/admin/categories")
    public String getCategoriesPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
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

        Pageable pageable = PageRequest.of(page - 1, 4);
        Page<Categories> usPage = this.categoriesService.getAllCate(pageable);
        List<Categories> cates = usPage.getContent();
        model.addAttribute("cates", cates);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", usPage.getTotalPages());
        model.addAttribute("activePage", "category");
        return "admin/categories/show";
    }

    // Create
    @GetMapping("/admin/categories/create")
    public String getCreateCategoriesPage(Model model) {
        model.addAttribute("newCate", new Categories());
        return "admin/categories/create";
    }

    @PostMapping(value = "/admin/categories/create")
    public String createCategoriesPage(Model model,
            @ModelAttribute("newCate") @Valid Categories categories,
            BindingResult newCateBindingResult) {

        categories.setName(categories.getName().trim());
        Categories categories2 = this.categoriesService.getCategoriesByName(categories.getName());
        if (categories2 != null) {
            newCateBindingResult.rejectValue("name", "error.category", "Tên danh mục đã tồn tại!");
        }

        // validate
        if (newCateBindingResult.hasErrors()) {
            return "admin/categories/create";
        }

        // save
        this.categoriesService.handleSaveCategories(categories);
        return "redirect:/admin/categories";
    }

    // Update
    @RequestMapping("/admin/categories/update/{id}") // GET
    public String getUpdateCategoryPage(Model model, @PathVariable long id) {
        Categories categories = this.categoriesService.getCategoriesById(id);
        model.addAttribute("categoryUpdate", categories);
        return "admin/categories/update";
    }

    @PostMapping("/admin/categories/update")
    public String postUpdateCategory(Model model, @ModelAttribute("categoryUpdate") Categories categories,
            BindingResult newCateBindingResult) {
        Categories currentCategories = this.categoriesService.getCategoriesById(categories.getId());
        if (currentCategories != null) {
            currentCategories.setName(categories.getName());
            currentCategories.setDescription(categories.getDescription());

            if (this.categoriesService.getCategoriesByName(categories.getName()) != null
                    && currentCategories.getId() != categories.getId()) {
                newCateBindingResult.rejectValue("name", "error.category", "Tên danh mục đã tồn tại!");
            }

            if (newCateBindingResult.hasErrors()) {
                return "admin/categories/update";
            } else {
                this.categoriesService.handleSaveCategories(currentCategories);
            }
        }
        return "redirect:/admin/categories";
    }

    // Delete
    @GetMapping("/admin/categories/delete/{id}")
    public String getDeleteCategoriesPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        Categories categories = this.categoriesService.getCategoriesById(id);
        model.addAttribute("categoriesDele", categories);
        model.addAttribute("categoriesDelete", new Categories());
        return "admin/categories/delete";
    }

    @PostMapping("/admin/categories/delete")
    public String postDeleteCategories(Model model, @ModelAttribute("categoriesDelete") Categories categories) {
        this.categoriesService.deleteCategories(categories.getId());
        return "redirect:/admin/categories";
    }

    // Information
    @GetMapping("/admin/categories/{id}")
    public String getInformationCategoriesPage(Model model, @PathVariable long id) {
        Categories categories = this.categoriesService.getCategoriesById(id);
        List<Product> products = categories.getProducts();
        model.addAttribute("categoriesInfo", categories);
        model.addAttribute("productList", products);
        return "admin/categories/detail";
    }
}
