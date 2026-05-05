package com.example.DoAn.config;

import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

@Configuration
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return new CustomSuccessHandler();
    }

    @Bean
    public SpringSessionRememberMeServices rememberMeServices() {
        SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
        rememberMeServices.setAlwaysRemember(true);
        return rememberMeServices;
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
            .authorizeHttpRequests(authorize -> authorize

                // Cho phép JSP forward/include
                .dispatcherTypeMatchers(
                        DispatcherType.FORWARD,
                        DispatcherType.INCLUDE
                ).permitAll()

                // ===== PUBLIC PAGES =====
                .requestMatchers(
                        "/",
                        "/about",
                        "/map",
                        "/login",
                        "/register",
                        "/blog",
                        "/blog/**",
                        "/logout",
                        "/product",
                        "/product/**",
                        "/products/**",
                        "/client/**",
                        "/error"
                ).permitAll()

                // ===== STATIC RESOURCES =====
                .requestMatchers(
                        "/css/**",
                        "/js/**",
                        "/img/**",
                        "/images/**",
                        "/lib/**",
                        "/avatar/**",
                        "/products/**",
                        "/scss/**",
                        "/resources/**"
                ).permitAll()

                // ADMIN
                .requestMatchers("/admin/**").hasRole("ADMIN")

                // Các request khác cần login
                .anyRequest().authenticated()
            )

            // ===== SESSION =====
            .sessionManagement(session -> session
                    .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                    .invalidSessionUrl("/logout?expired")
                    .maximumSessions(1)
                    .maxSessionsPreventsLogin(false)
            )

            // ===== LOGIN =====
            .formLogin(form -> form
                    .loginPage("/login")
                    .failureUrl("/login?error")
                    .successHandler(customSuccessHandler())
                    .permitAll()
            )

            // ===== LOGOUT =====
            .logout(logout -> logout
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/")
                    .invalidateHttpSession(true)
                    .deleteCookies("JSESSIONID")
                    .permitAll()
            )

            // ===== REMEMBER ME =====
            .rememberMe(r -> r.rememberMeServices(rememberMeServices()))

            // ===== ACCESS DENIED =====
            .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"))

            // Nếu form JSP lỗi CSRF thì bật dòng này
            //.csrf(csrf -> csrf.disable())
        ;

        return http.build();
    }
}
