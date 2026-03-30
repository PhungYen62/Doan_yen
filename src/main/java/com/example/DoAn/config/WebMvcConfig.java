package com.example.DoAn.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**").addResourceLocations("/resources/static/css/");
        registry.addResourceHandler("/js/**").addResourceLocations("/resources/static/js/");
        registry.addResourceHandler("/img/**").addResourceLocations("/resources/static/img/");
        registry.addResourceHandler("/avatar/**").addResourceLocations("/resources/images/avatar/");
        registry.addResourceHandler("/lib/**").addResourceLocations("/resources/static/lib/");
        registry.addResourceHandler("/scss/**").addResourceLocations("/resources/static/scss/");
        registry.addResourceHandler("/admin/**").addResourceLocations("/resources/static/admin/");
        registry.addResourceHandler("/products/**").addResourceLocations("/resources/images/products/");

    }
}
