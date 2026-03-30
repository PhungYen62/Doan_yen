package com.example.DoAn.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class HashDemo {
    public static void main(String[] args) {
        String raw = "Yen@123456";
        String hash = new BCryptPasswordEncoder().encode(raw);
        System.out.println(hash);
    }
}