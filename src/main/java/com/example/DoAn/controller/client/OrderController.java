package com.example.DoAn.controller.client;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.DoAn.domain.Order;
import com.example.DoAn.domain.User;
import com.example.DoAn.service.OrderService;
import com.example.DoAn.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller("orderClientController")
public class OrderController {
    private final OrderService orderService;
    private final UserService userService;

    public OrderController(OrderService orderService, UserService userService) {
        this.orderService = orderService;
        this.userService = userService;
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id);

        List<Order> orders = this.orderService.fetchOrdersByUser(currentUser);
        Collections.reverse(orders);
        model.addAttribute("orders", orders);
        return "client/order/order-history";
    }
}
