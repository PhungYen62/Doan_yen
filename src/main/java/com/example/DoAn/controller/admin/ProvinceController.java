package com.example.DoAn.controller.admin;

import java.util.List;
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

import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.Province;
import com.example.DoAn.service.ProvinceService;

import jakarta.validation.Valid;

@Controller
public class ProvinceController {
    private final ProvinceService provinceService;

    public ProvinceController(ProvinceService provinceService) {
        this.provinceService = provinceService;
    }

    @RequestMapping("/admin/province")
    public String getProvincePage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;

        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            page = 1;
        }

        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by(Sort.Direction.ASC, "name"));
        Page<Province> provincePage = this.provinceService.getAllProvinces(pageable);
        List<Province> provinces = provincePage.getContent();

        model.addAttribute("provinces", provinces);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", provincePage.getTotalPages());
        model.addAttribute("activePage", "province");
        return "admin/province/show";
    }

    @GetMapping("/admin/province/create")
    public String getCreateProvincePage(Model model) {
        model.addAttribute("newProvince", new Province());
        model.addAttribute("activePage", "province");
        return "admin/province/create";
    }

    @PostMapping("/admin/province/create")
    public String createProvincePage(
            @ModelAttribute("newProvince") @Valid Province newProvince,
            BindingResult bindingResult,
            Model model) {
        normalizeProvince(newProvince);

        validateProvinceCreate(newProvince, bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("activePage", "province");
            return "admin/province/create";
        }

        this.provinceService.saveProvince(newProvince);
        return "redirect:/admin/province";
    }

    @GetMapping("/admin/province/update/{id}")
    public String getUpdateProvincePage(Model model, @PathVariable long id) {
        Optional<Province> provinceOptional = this.provinceService.getProvinceById(id);
        if (provinceOptional.isEmpty()) {
            return "redirect:/admin/province";
        }

        model.addAttribute("provinceUpdate", provinceOptional.get());
        model.addAttribute("activePage", "province");
        return "admin/province/update";
    }

    @PostMapping("/admin/province/update")
    public String postUpdateProvince(
            @ModelAttribute("provinceUpdate") @Valid Province provinceUpdate,
            BindingResult bindingResult,
            Model model) {
        Optional<Province> currentProvinceOptional = this.provinceService.getProvinceById(provinceUpdate.getId());
        if (currentProvinceOptional.isEmpty()) {
            return "redirect:/admin/province";
        }

        Province currentProvince = currentProvinceOptional.get();
        normalizeProvince(provinceUpdate);

        validateProvinceUpdate(provinceUpdate, currentProvince.getId(), bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("activePage", "province");
            return "admin/province/update";
        }

        currentProvince.setCode(provinceUpdate.getCode());
        currentProvince.setName(provinceUpdate.getName());
        this.provinceService.saveProvince(currentProvince);
        return "redirect:/admin/province";
    }

    @GetMapping("/admin/province/delete/{id}")
    public String getDeleteProvincePage(Model model, @PathVariable long id) {
        Optional<Province> provinceOptional = this.provinceService.getProvinceById(id);
        if (provinceOptional.isEmpty()) {
            return "redirect:/admin/province";
        }

        model.addAttribute("provinceInfoDelete", provinceOptional.get());
        model.addAttribute("provinceDelete", new Province());
        model.addAttribute("id", id);
        model.addAttribute("activePage", "province");
        return "admin/province/delete";
    }

    @PostMapping("/admin/province/delete")
    public String postDeleteProvince(@ModelAttribute("provinceDelete") Province province) {
        this.provinceService.deleteProvinceById(province.getId());
        return "redirect:/admin/province";
    }

    @GetMapping("/admin/province/{id}")
    public String getProvinceDetailPage(Model model, @PathVariable long id) {
        Optional<Province> provinceOptional = this.provinceService.getProvinceById(id);
        if (provinceOptional.isEmpty()) {
            return "redirect:/admin/province";
        }

        List<Product> products = this.provinceService.getProductsByProvinceId(id);
        model.addAttribute("provinceInfo", provinceOptional.get());
        model.addAttribute("products", products);
        model.addAttribute("id", id);
        model.addAttribute("activePage", "province");
        return "admin/province/detail";
    }

    private void normalizeProvince(Province province) {
        if (province == null) {
            return;
        }

        if (province.getCode() != null) {
            province.setCode(province.getCode().trim().toUpperCase());
        }
        if (province.getName() != null) {
            province.setName(province.getName().trim());
        }
    }

    private void validateProvinceCreate(Province province, BindingResult bindingResult) {
        if (province == null) {
            return;
        }

        if (province.getCode() != null && !province.getCode().isBlank()
                && this.provinceService.getProvinceByCode(province.getCode()).isPresent()) {
            bindingResult.rejectValue("code", "error.province", "Mã tỉnh đã tồn tại");
        }
    }

    private void validateProvinceUpdate(Province province, long currentProvinceId, BindingResult bindingResult) {
        if (province == null) {
            return;
        }

        if (province.getCode() != null && !province.getCode().isBlank()) {
            Optional<Province> existingProvince = this.provinceService.getProvinceByCode(province.getCode());
            if (existingProvince.isPresent() && existingProvince.get().getId() != currentProvinceId) {
                bindingResult.rejectValue("code", "error.province", "Mã tỉnh đã tồn tại");
            }
        }
    }
}
