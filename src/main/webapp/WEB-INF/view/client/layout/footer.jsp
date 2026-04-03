<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
    :root {
        --primary-green: #749b3f;
        --text-dark: #1f2937;
        --text-light: #6b7280;
        --border-light: #e5e7eb;
        --bg-footer: #f4f5f6;
    }

    /* ========== FOOTER MAIN ========== */
    .footer-main {
        background-color: var(--bg-footer);
        padding: 50px 0 20px 0;
        width: 100%;
        margin-top: 60px;
        font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    }

    .footer-container {
        max-width: 1400px;
        margin: 0 auto;
        padding: 0 40px;
    }

    /* Bố cục 5 cột */
    .footer-grid {
        display: grid;
        grid-template-columns: 2fr 1fr 1fr 1.8fr 2fr; 
        gap: 60px;
        margin-bottom: 40px;
        justify-items: start;
        align-items: start;
    }

    /* Column styling */
    .footer-column {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .footer-column h4 {
        font-size: 16px;
        font-weight: 700;
        color: var(--text-dark);
        margin: 0 0 5px 0;
    }

    .footer-column a,
    .footer-column p {
        color: var(--text-light);
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s ease;
        margin: 0;
        line-height: 1.5;
    }

    .footer-column a:hover {
        color: var(--primary-green);
    }

    /* Logo section (Đã tinh chỉnh bỏ text) */
    .footer-logo {
        display: flex;
        align-items: center;
    }

    .footer-logo img {
        height: 55px; /* Tăng kích thước logo lên một chút để lấp đầy không gian khi không có chữ */
        width: auto;
        transition: transform 0.3s ease;
    }

    .footer-logo img:hover {
        transform: scale(1.05); /* Thêm hiệu ứng hover nhẹ cho logo */
    }

    /* Contact info styling */
    .contact-item {
        display: flex;
        align-items: flex-start;
        gap: 12px;
    }

    .contact-item i {
        color: var(--primary-green);
        margin-top: 4px;
        font-size: 14px;
        width: 16px;
        text-align: center;
    }

    /* Bản đồ */
    .footer-map {
        border-radius: 8px;
        overflow: hidden;
        height: 150px;
        width: 100%;
        background-color: #e8e8e8;
    }

    /* ========== FOOTER BOTTOM ========== */
    .footer-bottom {
        border-top: 1px solid var(--border-light);
        padding-top: 25px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 20px;
    }

    /* Social Icons (Trái) */
    .footer-socials {
        display: flex;
        gap: 12px;
        align-items: center;
    }

    .social-icon {
        width: 36px;
        height: 36px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        color: white;
        font-size: 18px;
        transition: all 0.3s ease;
    }

    .social-icon.facebook { background-color: #4285F4; }
    .social-icon.instagram { background: linear-gradient(45deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888); }
    .social-icon.twitter { background-color: #000000; font-family: sans-serif; font-weight: bold; font-style: normal; }
    .social-icon.youtube { background-color: #EA4335; }

    .social-icon:hover {
        transform: translateY(-2px);
        opacity: 0.9;
    }

    /* Copyright & Links (Phải) */
    .footer-copyright-links {
        display: flex;
        align-items: center;
        gap: 10px;
        flex-wrap: wrap;
        color: var(--text-dark);
        font-size: 14px;
        font-weight: 500;
    }

    .footer-copyright-links a {
        color: var(--text-dark);
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-copyright-links a:hover {
        color: var(--primary-green);
    }

    .separator {
        color: #9ca3af;
        margin: 0 5px;
    }

    /* Responsive */
    @media (max-width: 992px) {
        .footer-grid {
            grid-template-columns: 1fr 1fr 1fr;
        }
    }

    @media (max-width: 768px) {
        .footer-grid {
            grid-template-columns: 1fr 1fr;
        }
        .footer-bottom {
            flex-direction: column;
            justify-content: center;
        }
    }

    @media (max-width: 480px) {
        .footer-grid {
            grid-template-columns: 1fr;
        }
        .footer-container {
            padding: 0 20px;
        }
    }
</style>

<footer class="footer-main">
    <div class="footer-container">
        <div class="footer-grid">
            
            <div class="footer-column">
                <a href="${contextPath}/" class="footer-logo" title="Trang chủ Fresh Food">
                    <img src="${contextPath}/resources/images/header/logo.png" alt="Fresh Food Logo" onerror="this.src='https://via.placeholder.com/120x60?text=Logo'" />
                </a>
            </div>

            <div class="footer-column">
                <h4>Liên kết 1</h4>
                <a href="${contextPath}/">Trang chủ</a>
                <a href="${contextPath}/product">Cửa hàng</a>
                <a href="${contextPath}/about">Về chúng tôi</a>
                <a href="${contextPath}/blog">Blog</a>
                <a href="${contextPath}/blog-detail">Chi tiết Blog</a>
            </div>

            <div class="footer-column">
                <h4>Liên kết 2</h4>
                <a href="${contextPath}/wishlist">Yêu thích</a>
                <a href="${contextPath}/cart">Giỏ hàng</a>
                <a href="${contextPath}/login">Đăng nhập</a>
                <a href="${contextPath}/register">Đăng ký</a>
            </div>

            <div class="footer-column">
                <h4>Liên hệ chúng tôi</h4>
                <div class="contact-item">
                    <i class="fas fa-phone-alt"></i>
                    <a href="tel:1234567890">1234 5678 90</a>
                </div>
                <div class="contact-item">
                    <i class="far fa-envelope"></i>
                    <a href="mailto:Freshharvests@gmail.com">Freshharvests@gmail.com</a>
                </div>
                <div class="contact-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <p>Tanjung Sari Street, Pontianak, Indonesia</p>
                </div>
            </div>

            <div class="footer-column">
                <h4>Bản đồ vị trí</h4>
                <div class="footer-map">
                    <iframe src="https://maps.google.com/maps?q=Pontianak&t=&z=13&ie=UTF8&iwloc=&output=embed" 
                            width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>

        </div>

        <div class="footer-bottom">
            <div class="footer-socials">
                <a href="#" class="social-icon facebook" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-icon instagram" title="Instagram"><i class="fab fa-instagram"></i></a>
                <a href="#" class="social-icon twitter" title="X (Twitter)">X</a> 
                <a href="#" class="social-icon youtube" title="YouTube"><i class="fab fa-youtube"></i></a>
            </div>

            <div class="footer-copyright-links">
                <span class="separator">|</span>
                <span>All rights reserved</span>
                <span class="separator">|</span>
                <a href="${contextPath}/policy">Policy</a>
                <span class="separator">|</span>
                <a href="${contextPath}/terms">Term of use</a>
            </div>
        </div>
    </div>
</footer>