package com.example.DoAn.controller.client;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DoAn.domain.Cart;
import com.example.DoAn.domain.CartDetail;
import com.example.DoAn.domain.User;
import com.example.DoAn.repository.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.DoAn.service.ProductService;
import com.example.DoAn.service.UserService;

@Controller
public class CartController {

    private final UserService userService;
    private final PaymentController paymentController;
    private final UserRepository userRepository;
    private final ProductService productService;

    public CartController(ProductService productService, UserRepository userRepository, UserService userService,
            PaymentController paymentController) {
        this.paymentController = paymentController;
        this.productService = productService;
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.getCartByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        List<String> stockErrors = this.productService.getCartStockErrors(cartDetails);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("hasStockIssues", !stockErrors.isEmpty());
        if (!stockErrors.isEmpty()) {
            model.addAttribute("errorMessages", stockErrors);
        }

        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable("id") long id, HttpServletRequest request,
            @RequestParam(name = "quantity", required = false, defaultValue = "1") int quantity) {

        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId, session, quantity);

        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isBlank()) {
            return "redirect:" + referer;
        }

        return "redirect:/cart";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable("id") long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.findByUser(currentUser);
        currentUser = this.userService.getUserById(id);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        List<String> stockErrors = this.productService.getCartStockErrors(cartDetails);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("user", currentUser);
        model.addAttribute("hasStockIssues", !stockErrors.isEmpty());
        if (!model.containsAttribute("errorMessages") && !stockErrors.isEmpty()) {
            model.addAttribute("errorMessages", stockErrors);
        }
        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart, RedirectAttributes redirectAttributes) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        List<String> errors = this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        if (!errors.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessages", errors);
            return "redirect:/cart"; // quay lại trang giỏ hàng
        }
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            HttpServletResponse resp,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("totalPrice") Double totalPrice,
            RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login"; // hoặc xử lý lỗi
        }

        long id = (long) session.getAttribute("id");
        User currentUser = new User();
        currentUser.setId(id);
        List<String> stockErrors = this.productService.getCartStockErrors(currentUser);
        if (!stockErrors.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessages", stockErrors);
            return "redirect:/checkout";
        }

        // Xử lý theo hình thức thanh toán
        if ("VNPAY".equalsIgnoreCase(paymentMethod)) {
            // 👉 Gọi hàm tạo URL thanh toán và redirect qua VNPAY
            try {
                session.setAttribute("receiverName", receiverName);
                session.setAttribute("receiverAddress", receiverAddress);
                session.setAttribute("receiverPhone", receiverPhone);
                session.setAttribute("totalPrice", totalPrice);

                this.paymentController.createPayment(request, resp, totalPrice);
                return null;
            } catch (IOException e) {
                e.printStackTrace();
                // Hoặc redirect sang trang lỗi
                return "redirect:/checkout";
            }
        } else {
            // COD: xử lý như cũ
            this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone, 0, "COD", null);
            String message = "Cảm ơn bạn đã đặt hàng!";
            String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8);
            return "redirect:/thanks?status=success&message=" + encodedMessage;
        }
    }

    @GetMapping("/thanks")
    public String getThankYouPage(@RequestParam("status") String status, @RequestParam("message") String message,
            Model model) {
        if ("success".equalsIgnoreCase(status)) {
            model.addAttribute("message", message);
            model.addAttribute("alertType", "success");
        } else {
            model.addAttribute("message", message);
            model.addAttribute("alertType", "danger");
        }
        return "client/cart/thank";
    }
}
