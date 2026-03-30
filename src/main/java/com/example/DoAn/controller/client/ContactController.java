package com.example.DoAn.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DoAn.domain.Contact;
import com.example.DoAn.domain.User;
import com.example.DoAn.service.ContactService;
import com.example.DoAn.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ContactController {
    private final UserService userService;
    private final ContactService contactService;

    public ContactController(UserService userService, ContactService contactService) {
        this.userService = userService;
        this.contactService = contactService;
    }

    @GetMapping("/contact")
    public String getContactPage(@RequestParam(value = "success", required = false) String success, Model model,
            HttpSession session) {
        Long id = (Long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id);
        if (currentUser != null) {
            model.addAttribute("user", currentUser);
        }
        Contact contact = new Contact();
        model.addAttribute("contact", contact);
        model.addAttribute("activePage", "activeContact");
        if ("true".equals(success)) {
            model.addAttribute("message", "✅ Gửi liên hệ thành công! Chúng tôi sẽ phản hồi sớm nhất có thể.");
        }
        return "client/contact/contact";
    }

    @PostMapping("/contact")
    public String handleContactForm(@ModelAttribute("contact") @Valid Contact contact, HttpSession session,
            BindingResult bindingResult, Model model) {
        Long userId = (Long) session.getAttribute("id");
        System.out.println("title: " + contact.getTitle());
        System.out.println("message: " + contact.getMessage());

        if (bindingResult.hasErrors()) {
            return "client/contact/contact";
        }
        if (userId != null) {
            User user = userService.getUserById(userId);
            contact.setUser(user);
            contact.setEmail(user.getEmail());
        }

        contactService.saveContact(contact);
        return "redirect:/contact?success=true";
    }

}
