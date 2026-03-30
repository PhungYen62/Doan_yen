package com.example.DoAn.domain.dto;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class TopCustomerDTO {
    private Long userId;
    private String userName;
    private String userPhone;
    private Long totalOrders;
    private Double totalSpent;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public Long getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(Long totalOrders) {
        this.totalOrders = totalOrders;
    }

    public Double getTotalSpent() {
        return totalSpent;
    }

    public void setTotalSpent(Double totalSpent) {
        this.totalSpent = totalSpent;
    }

    public TopCustomerDTO(Long userId, String userName, String userPhone, Long totalOrders, Double totalSpent) {
        this.userId = userId;
        this.userName = userName;
        this.userPhone = userPhone;
        this.totalOrders = totalOrders;
        this.totalSpent = totalSpent;
    }

    public String getFormattedTotalSpent() {
        DecimalFormat df = new DecimalFormat("#,###.##");
        return df.format(totalSpent);
    }

}
