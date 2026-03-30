package com.example.DoAn.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.DoAn.domain.Contact;
import com.example.DoAn.domain.Order;
import com.example.DoAn.service.ContactService;
import com.example.DoAn.service.UserService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("adminContactController")
public class ContactController {
    private final UserService userService;
    private final ContactService contactService;

    public ContactController(UserService userService, ContactService contactService) {
        this.userService = userService;
        this.contactService = contactService;
    }

    @GetMapping("admin/contact")
    public String getContactPageAdmin(Model model, @RequestParam("page") Optional<String> pageOptional) {
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
        Page<Contact> contact = this.contactService.fetchAllOrders(pageable);
        List<Contact> contacts = contact.getContent();

        model.addAttribute("contacts", contacts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", contact.getTotalPages());
        model.addAttribute("activePage", "contact");
        return "admin/contact/show";
    }

    @GetMapping("/admin/contact/{id}")
    public String getContactDetailPage(Model model, @PathVariable long id) {
        Contact contact = this.contactService.fetchContactById(id);
        model.addAttribute("contact", contact);
        model.addAttribute("id", id);
        return "admin/contact/detail";
    }

    // Delete Contact
    @GetMapping("/admin/contact/delete/{id}")
    public String getDeleteContactPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newContact", new Contact());
        return "admin/contact/delete";
    }

    @PostMapping("/admin/contact/delete")
    public String postDeleteContact(@ModelAttribute("newContact") Contact contact) {
        this.contactService.deleteContactById(contact.getId());
        return "redirect:/admin/contact";
    }
}
