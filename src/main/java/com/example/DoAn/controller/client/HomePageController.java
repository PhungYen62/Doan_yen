package com.example.DoAn.controller.client;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.text.Normalizer;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.DoAn.domain.Categories;
import com.example.DoAn.domain.Order;
import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.User;
import com.example.DoAn.domain.dto.ChangePasswordDTO;
import com.example.DoAn.domain.dto.RegisterDTO;
import com.example.DoAn.domain.dto.UserUpdateDTO;
import com.example.DoAn.service.CategoriesService;
import com.example.DoAn.service.OrderService;
import com.example.DoAn.service.ProductService;
import com.example.DoAn.service.UploadService;
import com.example.DoAn.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomePageController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final CategoriesService categoriesService;
    private final ProductService productService;
    private final UploadService uploadService;
    private final OrderService orderService;

    public HomePageController(UserService userService, PasswordEncoder passwordEncoder,
            CategoriesService categoriesService, ProductService productService, UploadService uploadService,
            OrderService orderService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.categoriesService = categoriesService;
        this.productService = productService;
        this.uploadService = uploadService;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Categories> categories = this.categoriesService.getAll();
        List<Product> allProducts = this.productService.getAllProducts();
        List<Product> discountedProducts = new ArrayList<>();
        Long northCategoryId = findCategoryIdByKeyword(categories, "mien bac");
        Long centralCategoryId = findCategoryIdByKeyword(categories, "mien trung");
        Long southCategoryId = findCategoryIdByKeyword(categories, "mien nam");
        model.addAttribute("activePage", "home");
        model.addAttribute("categories", categories);
        model.addAttribute("selectedCategoryId", 1);
        model.addAttribute("northCategoryId", northCategoryId);
        model.addAttribute("centralCategoryId", centralCategoryId);
        model.addAttribute("southCategoryId", southCategoryId);

        Collections.sort(allProducts, new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                if (p1.getCreatedAt() == null && p2.getCreatedAt() == null) {
                    return 0;
                }
                if (p1.getCreatedAt() == null) {
                    return 1;
                }
                if (p2.getCreatedAt() == null) {
                    return -1;
                }
                return p2.getCreatedAt().compareTo(p1.getCreatedAt());
            }
        });

        // Xử lý sản phẩm giảm giá
        for (Product p : allProducts) {
            if (p.getSalePrice() != null && p.getSalePrice() > 0 && p.getSalePrice() < p.getPrice()) {
                discountedProducts.add(p);
            }
        }
        Collections.sort(discountedProducts, new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                double price1 = p1.getPrice();
                double sale1 = (p1.getSalePrice() != null) ? p1.getSalePrice() : price1;

                double price2 = p2.getPrice();
                double sale2 = (p2.getSalePrice() != null) ? p2.getSalePrice() : price2;

                double percent1 = (price1 - sale1) / price1;
                double percent2 = (price2 - sale2) / price2;

                if (p1.getCreatedAt() == null && p2.getCreatedAt() == null) {
                    return 0;
                }
                if (p1.getCreatedAt() == null) {
                    return 1;
                }
                if (p2.getCreatedAt() == null) {
                    return -1;
                }
                return p2.getCreatedAt().compareTo(p1.getCreatedAt());
            }
        });

        // Lấy 6 sản phẩm đầu tiên
        List<Product> topDiscountedProducts = new ArrayList<>();
        for (int i = 0; i < Math.min(6, discountedProducts.size()); i++) {
            topDiscountedProducts.add(discountedProducts.get(i));
        }
        List<Product> showcaseProducts = allProducts.size() > 8
                ? new ArrayList<>(allProducts.subList(8, allProducts.size()))
                : new ArrayList<>(allProducts);
        model.addAttribute("homepageProducts", allProducts);
        model.addAttribute("showcaseProducts", showcaseProducts);
        model.addAttribute("topDiscountedProducts", topDiscountedProducts);
        model.addAttribute("discountedProducts", discountedProducts);
        return "client/homepage/show";
    }

    private Long findCategoryIdByKeyword(List<Categories> categories, String keyword) {
        if (categories == null || keyword == null) {
            return null;
        }

        for (Categories category : categories) {
            String normalizedName = normalizeText(category.getName());
            if (normalizedName.contains(keyword)) {
                return category.getId();
            }
        }
        return null;
    }

    private String normalizeText(String value) {
        if (value == null) {
            return "";
        }
        return Normalizer.normalize(value.toLowerCase(), Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .replace('đ', 'd');
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        // validate
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        // save
        this.userService.handleSaveUser(user);
        return "redirect:/login";

    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/user/profile")
    public String showProfile(Model model, Principal principal) {
        String email = principal.getName();
        User user = userService.getUserByEmail(email);
        List<Order> orders = this.orderService.fetchOrdersByUser(user);
        Collections.reverse(orders);

        model.addAttribute("user", user);
        model.addAttribute("orders", orders);
        return "client/auth/user-profile";
    }

    @PostMapping("/user/update")
    public String updateProfile(@Valid @ModelAttribute("user") UserUpdateDTO userUpdate, BindingResult result,
            @RequestParam("avatarFile") MultipartFile avatarFile,
            Principal principal, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (result.hasErrors()) {
            return "client/auth/user-profile";
        }

        User existingUser = userService.getUserById(userUpdate.getId());

        // Cập nhật các thông tin khác
        existingUser.setFullName(userUpdate.getFullName());
        existingUser.setPhone(userUpdate.getPhone());
        existingUser.setProvince(userUpdate.getProvince());
        existingUser.setDistrict(userUpdate.getDistrict());
        existingUser.setWard(userUpdate.getWard());
        existingUser.setAddress_detail(userUpdate.getAddress_detail());

        if (!avatarFile.isEmpty()) {
            this.uploadService.deleteAvatarImage(existingUser);
            String avatar = this.uploadService.handleSaveUploadFile(avatarFile, "avatar");
            existingUser.setAvatar(avatar);
            session.setAttribute("avatar", avatar);
        }

        this.userService.handleSaveUser(existingUser);
        return "redirect:/";
    }

    // Đổi mật khẩu
    @GetMapping("/user/change-password")
    public String showChangePasswordForm(Model model) {
        model.addAttribute("changePassword", new ChangePasswordDTO());
        return "client/auth/change-password";
    }

    @PostMapping("/user/change-password")
    public String changePassword(@Valid @ModelAttribute("changePassword") ChangePasswordDTO dto,
            BindingResult result,
            Model model,
            Principal principal) {
        if (result.hasErrors()) {
            return "client/auth/change-password";
        }

        User user = userService.getUserByEmail(principal.getName());

        if (!passwordEncoder.matches(dto.getCurrentPassword(), user.getPassword())) {
            model.addAttribute("errorCurrentPassword", "Mật khẩu hiện tại không đúng");
            return "client/auth/change-password";
        }

        if (!dto.getNewPassword().equals(dto.getConfirmPassword())) {
            model.addAttribute("errorPasswordMismatch", "Xác nhận mật khẩu không khớp");
            return "client/auth/change-password";
        }

        user.setPassword(passwordEncoder.encode(dto.getNewPassword()));
        this.userService.handleSaveUser(user);
        return "redirect:/";
    }

}
