package com.example.DoAn.controller.admin;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.User;
import com.example.DoAn.domain.dto.RevenuePerDayDTO;
import com.example.DoAn.domain.dto.TopCustomerDTO;
import com.example.DoAn.service.OrderService;
import com.example.DoAn.service.ProductService;
import com.example.DoAn.service.UserService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class DashBoardController {
    private final OrderService orderService;
    private final ProductService productService;
    private final UserService userService;

    public DashBoardController(OrderService orderService, ProductService productService, UserService userService) {
        this.orderService = orderService;
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/api/revenue/last7days")
    @ResponseBody
    public List<RevenuePerDayDTO> getRevenueLast7Days() {
        return orderService.getDailyRevenueLast7Days();
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        // Lấy ra doanh thu trong 7 ngày gần nhất
        List<RevenuePerDayDTO> results = orderService.getDailyRevenueLast7Days();

        // Lấy ra top 5 khách hàng có doanh thu cao nhất
        List<TopCustomerDTO> topCustomers = orderService.getTopCustomers();

        // Lấy ra tổng số sản phẩm
        Long totalProducts = productService.countAllProducts();

        // Lấy ra tổng doanh thu
        Double totalRevenue = orderService.getTotalRevenue();

        // Lấy ra tổng số khách hàng
        Long totalCustomers = userService.countCustomers();

        // Tổng số đơn hàng
        Long totalOrders = orderService.countAllOrders();

        // Danh sách sản phẩm sắp hết hàng
        List<Product> lowStockProducts = productService.findProductsLowStock();
        model.addAttribute("activePage", "home");
        model.addAttribute("revenuePerDay", results);
        model.addAttribute("topCustomers", topCustomers);
        model.addAttribute("totalProducts", totalProducts);
        model.addAttribute("totalRevenue", totalRevenue);
        model.addAttribute("totalCustomers", totalCustomers);
        model.addAttribute("totalOrders", totalOrders);
        model.addAttribute("lowStockProducts", lowStockProducts);
        return "admin/dashboard/show";
    }

    @GetMapping("/admin/test")
    public String getTest(Model model) {
        List<RevenuePerDayDTO> results = orderService.getDailyRevenueLast7Days();
        System.out.println("results: " + results);
        model.addAttribute("activePage", "test");
        return "admin/dashboard/test";
    }

}
