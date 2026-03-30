package com.example.DoAn.domain.dto;

import com.example.DoAn.service.validator.StrongPassword;

import jakarta.validation.constraints.NotBlank;

public class ChangePasswordDTO {

    @NotBlank(message = "Mật khẩu hiện tại không được để trống")
    private String currentPassword;

    @StrongPassword // bạn đã có validator này rồi
    private String newPassword;

    @NotBlank(message = "Xác nhận mật khẩu không được để trống")
    private String confirmPassword;

    public String getCurrentPassword() {
        return currentPassword;
    }

    public void setCurrentPassword(String currentPassword) {
        this.currentPassword = currentPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    // getter/setter

}
