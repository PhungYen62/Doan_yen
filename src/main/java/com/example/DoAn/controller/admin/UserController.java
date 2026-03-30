package com.example.DoAn.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.DoAn.domain.User;
import com.example.DoAn.domain.dto.UserUpdateDTO;
import com.example.DoAn.service.UploadService;
import com.example.DoAn.service.UserService;

import jakarta.validation.Valid;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // View
    @RequestMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
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

        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<User> usPage = this.userService.getAllUsers(pageable);
        List<User> users = usPage.getContent();
        model.addAttribute("users1", users);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", usPage.getTotalPages());
        model.addAttribute("activePage", "user");
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    // Create
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User usernew,
            BindingResult newUserBindingResult,
            @RequestParam("avatarUser") MultipartFile file) {

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        // ✅ Kiểm tra email đã tồn tại
        if (this.userService.checkEmailExist(usernew.getEmail())) {
            newUserBindingResult.rejectValue("email", "email.exists", "Email đã tồn tại");
            return "admin/user/create";
        }

        //
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(usernew.getPassword());

        usernew.setAvatar(avatar);
        usernew.setPassword(hashPassword);
        usernew.setRole(this.userService.getRoleByName(usernew.getRole().getName()));

        // save
        this.userService.handleSaveUser(usernew);
        return "redirect:/admin/user";
    }

    // Update
    @RequestMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @Valid @ModelAttribute("newUser") UserUpdateDTO userUpdate,
            BindingResult newUserBindingResult) {
        User currentUser = this.userService.getUserById(userUpdate.getId());
        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/update";
        }
        if (currentUser != null) {
            currentUser.setProvince(userUpdate.getProvince());
            currentUser.setDistrict(userUpdate.getDistrict());
            currentUser.setWard(userUpdate.getWard());
            currentUser.setAddress_detail(userUpdate.getAddress_detail());
            currentUser.setFullName(userUpdate.getFullName());
            currentUser.setPhone(userUpdate.getPhone());

            // bug here
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // Delete
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User userDelete = this.userService.getUserById(id);
        model.addAttribute("userDelete", userDelete);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteUser(user.getId());
        return "redirect:/admin/user";
    }
}
