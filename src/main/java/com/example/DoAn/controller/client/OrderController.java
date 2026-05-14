package com.example.DoAn.controller.client;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DoAn.domain.Order;
import com.example.DoAn.domain.User;
import com.example.DoAn.service.OrderService;
import com.example.DoAn.service.UserService;

@Controller("orderClientController")
public class OrderController {

    private final OrderService orderService;
    private final UserService userService;

    public OrderController(OrderService orderService, UserService userService) {
        this.orderService = orderService;
        this.userService = userService;
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(
            Model model,
            Principal principal,
            @RequestParam(value = "status", required = false, defaultValue = "ALL") String status) {

        User currentUser = this.userService.getUserByEmail(principal.getName());

        List<Order> orders = currentUser == null
                ? new ArrayList<>()
                : this.orderService.fetchOrdersByUserAndStatus(currentUser, status);

        Collections.reverse(orders);

        model.addAttribute("user", currentUser);
        model.addAttribute("orders", orders);
        model.addAttribute("selectedStatus", status);

        return "client/order/order-history";
    }
}