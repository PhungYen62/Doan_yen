package com.example.DoAn.controller.client;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import com.example.DoAn.config.Config;
import com.example.DoAn.domain.dto.PaymentResDTO;
import com.example.DoAn.service.ProductService;
import com.example.DoAn.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.DoAn.domain.User;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PaymentController {

    private final ProductService productService;

    public PaymentController(ProductService productService) {
        this.productService = productService;
    }

    public void createPayment(HttpServletRequest req, HttpServletResponse resp, Double price) throws IOException {
        String orderType = "other";
        // long amount = Integer.parseInt(req.getParameter("amount"))*100;
        // String bankCode = req.getParameter("bankCode");
        Long amount = price.longValue() * 100;
        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", Config.vnp_Version);
        vnp_Params.put("vnp_Command", Config.vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_BankCode", "NCB");
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        vnp_Params.put("vnp_Locale", "vn");

        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);

        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                // Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                // Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

        PaymentResDTO paymentResDTO = new PaymentResDTO();
        paymentResDTO.setStatus("OK");
        paymentResDTO.setMessage("successfully");
        paymentResDTO.setURL(paymentUrl);
        com.google.gson.JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);
        Gson gson = new Gson();
        resp.sendRedirect(paymentUrl);

        // return ResponseEntity.status(HttpStatus.OK).body(paymentResDTO);
    }

    @GetMapping("/vnpay-return")
    public String handleVNPayReturn(HttpServletRequest request, Model model) {
        String message = "";
        String status = "success";
        String responseCode = request.getParameter("vnp_ResponseCode");
        String vnpTxnRef = request.getParameter("vnp_TxnRef");
        if ("00".equals(responseCode)) {

            HttpSession session = request.getSession(false);
            Long userId = (Long) session.getAttribute("id");
            if (userId != null) {
                String receiverName = (String) session.getAttribute("receiverName");
                String receiverAddress = (String) session.getAttribute("receiverAddress");
                String receiverPhone = (String) session.getAttribute("receiverPhone");

                User user = new User();
                user.setId(userId);
                List<String> stockErrors = this.productService.getCartStockErrors(user);
                if (!stockErrors.isEmpty()) {
                    message = "Thanh toán thành công nhưng một số sản phẩm không còn đủ tồn kho. Vui lòng liên hệ cửa hàng để được hỗ trợ.";
                    status = "error";
                    String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8);
                    return "redirect:/thanks?status=" + status + "&message=" + encodedMessage;
                }
                this.productService.handlePlaceOrder(user, session, receiverName, receiverAddress, receiverPhone, 1, "VNPAY", vnpTxnRef);
                // ✅ Thành công
                message = "Cảm ơn bạn đã đặt hàng qua VNPay!";
            } else {
                return "redirect:/login";
            }
        } else {
            // ❌ Không thành công
            message = "Thanh toán thất bại! Mã lỗi: " + responseCode;
        }
        String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8);
        return "redirect:/thanks?status=" + status + "&message=" + encodedMessage;
    }

}
