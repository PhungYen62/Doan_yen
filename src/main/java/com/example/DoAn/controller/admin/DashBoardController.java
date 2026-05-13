package com.example.DoAn.controller.admin;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping("/api/revenue")
    @ResponseBody
    public List<RevenuePerDayDTO> getRevenue(@RequestParam(value = "days", required = false, defaultValue = "6") Integer days) {
        int filterDays = (days != null) ? days : 6;
        return orderService.getDailyRevenue(filterDays);
    }

    @GetMapping("/admin")
    public String getDashboard(@RequestParam(value = "days", required = false, defaultValue = "6") Integer days, Model model) {
        int filterDays = (days != null) ? days : 6;
        
        // Lấy ra doanh thu
        List<RevenuePerDayDTO> results = orderService.getDailyRevenue(filterDays);

        // Lấy ra top 5 khách hàng có doanh thu cao nhất
        List<TopCustomerDTO> topCustomers = orderService.getTopCustomers(filterDays);

        // Lấy ra tổng số sản phẩm
        Long totalProducts = productService.countAllProducts();

        // Lấy ra tổng doanh thu
        Double totalRevenue = orderService.getTotalRevenue(filterDays);
        if (totalRevenue == null) totalRevenue = 0.0;

        // Lấy ra tổng số khách hàng
        Long totalCustomers = userService.countCustomers();

        // Tổng số đơn hàng (chỉ tính đơn hoàn thành)
        Long totalOrders = orderService.countCompletedOrders(filterDays);

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
        model.addAttribute("selectedDays", filterDays);
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
