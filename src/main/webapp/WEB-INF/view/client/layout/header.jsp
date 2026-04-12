<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
    /* ========== NHÚNG FONT CHỮ TỪ GOOGLE ========== */
    @import url('https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700&display=swap');

    /* ========== CSS VARIABLES ========== */
    :root {
        --primary-green: #749b3f;
        --secondary-green: #5f7f33;
        --text-dark: #1f2937;
        --border-light: #e5e7eb;
        --bg-light: #ffffff;
    }

    body {
        padding-top: 130px; 
        margin: 0;
        font-family: 'Rubik', sans-serif; 
    }

    /* ========== TOP HEADER - WHITE BAR ========== */
    .header-top {
        height: 80px; 
        background-color: white;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        width: 100%;
        z-index: 1000;
        border-bottom: 1px solid #f0f0f0;
        display: flex;
        align-items: center; /* Căn giữa trục dọc cho tất cả nội dung bên trong */
        justify-content: center;
    }

    .header-container {
        width: 100%;
        max-width: 1360px;
        margin: 0 auto;
        padding: 0 40px; 
        display: flex;
        align-items: center;
        gap: 60px;
    }

    /* TRÁI: LOGO */
    .header-left {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        flex-shrink: 0;
    }

    .header-logo {
        height: 45px;
        display: block;
    }
    
    .header-logo img {
        height: 100%;
        width: auto;
        object-fit: contain;
    }

    /* GIỮA: SEARCH BAR */
    .header-center {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        min-width: 300px;
    }

    .header-search {
        width: 100%;
        max-width: 500px; 
        position: relative;
    }

    .header-search input {
        width: 100%;
        padding: 12px 20px 12px 45px;
        border: 2px solid var(--primary-green);
        border-radius: 6px;
        font-size: 16px;
        font-family: 'Rubik', sans-serif;
        background-color: white;
        color: var(--text-dark);
        outline: none;
        transition: border-color 0.2s ease;
    }

    .header-search input:focus {
        border-color: var(--secondary-green);
    }

    .header-search input::placeholder {
        color: #999;
        font-weight: 400;
    }

    .header-search i {
        position: absolute;
        left: 16px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--primary-green);
        font-size: 16px;
    }

    /* PHẢI: ICONS & BUTTONS */
    .header-right {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        flex-shrink: 0;
    }

    .header-actions {
        display: flex;
        align-items: center;
        gap: 32px; /* Giãn đều khoảng cách giữa các icon */
    }

    .header-icon-item {
        position: relative;
        color: var(--text-dark);
        font-size: 22px; 
        text-decoration: none;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: color 0.3s ease;
    }

    .header-icon-item:hover {
        color: var(--primary-green);
    }

    /* Cart Badge */
    .cart-badge {
        position: absolute;
        top: -10px;
        right: -10px;
        background-color: var(--primary-green);
        color: white;
        border-radius: 50%;
        width: 22px;
        height: 22px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        font-weight: 700;
    }

    /* Nút Đăng nhập */
    .header-login-btn {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 10px 20px;
        background-color: var(--primary-green);
        color: white;
        border: 2px solid var(--primary-green);
        border-radius: 6px;
        font-size: 16px;
        font-family: 'Rubik', sans-serif;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .header-login-btn:hover {
        background-color: var(--secondary-green);
        border-color: var(--secondary-green);
        color: white;
    }

    .header-login-btn i {
        font-size: 18px;
    }

    /* Nút Đăng ký */
    .header-signup-btn {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 10px 28px;
        background-color: var(--primary-green);
        color: white;
        border: 2px solid var(--primary-green);
        border-radius: 6px;
        font-size: 16px;
        font-family: 'Rubik', sans-serif;
        font-weight: 600; 
        text-decoration: none;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .header-signup-btn i {
        font-size: 18px;
    }

    .header-signup-btn:hover {
        background-color: var(--secondary-green);
        border-color: var(--secondary-green);
        color: white;
    }

    /* ========== GREEN NAVIGATION BAR ========== */
    .header-nav {
        background-color: var(--primary-green);
        position: fixed;
        top: 80px; 
        left: 0;
        right: 0;
        width: 100%;
        z-index: 999;
        height: 50px; 
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .navbar-menu {
        width: 100%;
        max-width: 1360px;
        margin: 0 auto;
        padding: 0 40px; 
        list-style: none;
        display: flex;
        justify-content: center;
        gap: 60px; /* Giãn đều thanh menu theo thiết kế */
    }

    .navbar-menu li a {
        color: white;
        text-decoration: none;
        font-size: 16px;
        font-family: 'Rubik', sans-serif;
        font-weight: 500; 
        letter-spacing: 0.5px;
        transition: opacity 0.2s ease;
        display: block;
    }

    .navbar-menu li a:hover,
    .navbar-menu li a.active {
        opacity: 0.8;
    }

    /* ========== RESPONSIVE DESIGN ========== */
    @media (max-width: 1024px) {
        .header-container {
            gap: 40px;
        }
        .navbar-menu {
            gap: 40px;
            padding: 0 30px;
        }
    }

    @media (max-width: 768px) {
        .header-center { 
            display: none; 
        }
        .header-container {
            gap: 20px;
        }
        .header-actions {
            gap: 20px;
        }
    }

    /* ========== ACCOUNT SELECT (CUSTOM DROPDOWN) ========== */
    .account-select-wrapper {
        position: relative;
        display: inline-flex;
        align-items: center;
    }

    .account-select-btn {
        position: relative;
        padding-right: 42px; /* chừa chỗ cho mũi tên */
        user-select: none;
    }

    .account-select-btn .account-caret {
        position: absolute;
        right: 14px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 16px;
        opacity: 0.95;
        pointer-events: none;
    }

    .account-select-menu {
        position: absolute;
        top: calc(100% + 10px);
        right: 0;
        min-width: 220px;
        background: white;
        border: 1px solid var(--border-light);
        border-radius: 10px;
        padding: 8px;
        z-index: 1001;
        display: none;
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
    }

    .account-select-menu.is-open {
        display: block;
    }

    .account-select-item {
        width: 100%;
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px 12px;
        border-radius: 8px;
        text-decoration: none;
        color: var(--text-dark);
        font-size: 16px;
        font-family: 'Rubik', sans-serif;
        font-weight: 500;
        background: transparent;
        border: none;
        cursor: pointer;
        text-align: left;
    }

    .account-select-item i {
        width: 18px;
        text-align: center;
    }

    .account-select-item:hover,
    .account-select-item:focus {
        background: rgba(116, 155, 63, 0.10);
        color: var(--primary-green);
        outline: none;
    }

    .account-select-form {
        margin: 0;
    }
</style>

<div class="header-top">
    <div class="header-container">
        
        <!-- LOGO -->
        <div class="header-left">
            <a href="${contextPath}/" class="header-logo">
                <img src="${contextPath}/resources/images/header/logo.png" alt="Fresh Food Logo" />
            </a>
        </div>

        <!-- SEARCH BAR -->
        <div class="header-center">
            <div class="header-search">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search products..." />
            </div>
        </div>

        <!-- ICONS & BUTTONS -->
        <div class="header-right">
            <div class="header-actions">
                
                <!-- Wishlist Icon -->
                <a href="#" class="header-icon-item" title="Wishlist">
                    <i class="far fa-heart"></i>
                </a>

                <!-- Shopping Cart Icon -->
                <a href="${contextPath}/cart" class="header-icon-item" title="Giỏ hàng">
                    <i class="fas fa-shopping-cart"></i>
                    <c:if test="${not empty sessionScope.sum && sessionScope.sum > 0}">
                        <span class="cart-badge">${sessionScope.sum}</span>
                    </c:if>
                </a>

                <!-- Login Button with Icon -->
                <c:if test="${empty pageContext.request.userPrincipal}">
                    <a href="${contextPath}/login" class="header-login-btn">
                        <i class="far fa-user"></i>
                        <span>Đăng nhập</span>
                    </a>
                </c:if>
                <c:if test="${not empty pageContext.request.userPrincipal}">
                    <div class="account-select-wrapper">
                        <button type="button" class="header-login-btn account-select-btn" id="accountSelectBtn" aria-haspopup="true" aria-expanded="false">
                            <i class="far fa-user" aria-hidden="true"></i>
                            <span>Tài khoản</span>
                            <i class="fas fa-chevron-down account-caret" aria-hidden="true"></i>
                        </button>

                        <div class="account-select-menu" id="accountSelectMenu" role="menu" aria-labelledby="accountSelectBtn">
                            <a href="${contextPath}/user/profile" class="account-select-item" role="menuitem">
                                <i class="fas fa-user-cog" aria-hidden="true"></i>
                                <span>Cập nhật thông tin</span>
                            </a>

                            <form action="${contextPath}/logout" method="post" class="account-select-form">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="account-select-item" role="menuitem">
                                    <i class="fas fa-sign-out-alt" aria-hidden="true"></i>
                                    <span>Đăng xuất</span>
                                </button>
                            </form>
                        </div>
                    </div>
                </c:if>

                <!-- Signup Button -->
                <c:if test="${empty pageContext.request.userPrincipal}">
                    <a href="${contextPath}/register" class="header-signup-btn">
                        <i class="far fa-user"></i>
                        <span>Đăng ký</span>
                    </a>
                </c:if>
                
            </div>
        </div>

    </div>
</div>

<nav class="header-nav">
    <ul class="navbar-menu">
        <li><a href="${contextPath}/" class="${activePage == 'home' ? 'active' : ''}">Trang chủ</a></li>
        <li><a href="${contextPath}/product" class="${activePage == 'product' ? 'active' : ''}">Cửa hàng</a></li>
        <li><a href="${contextPath}/about" class="${activePage == 'about' ? 'active' : ''}">Về chúng tôi</a></li>
        <li><a href="${contextPath}/blog" class="${activePage == 'blog' ? 'active' : ''}">Blog</a></li>
    </ul>
</nav>

<script>
    (function () {
        var btn = document.getElementById('accountSelectBtn');
        var menu = document.getElementById('accountSelectMenu');
        if (!btn || !menu) return;

        function openMenu() {
            menu.classList.add('is-open');
            btn.setAttribute('aria-expanded', 'true');
        }

        function closeMenu() {
            menu.classList.remove('is-open');
            btn.setAttribute('aria-expanded', 'false');
        }

        function toggleMenu() {
            if (menu.classList.contains('is-open')) closeMenu();
            else openMenu();
        }

        btn.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            toggleMenu();
        });

        document.addEventListener('click', function (e) {
            if (!menu.classList.contains('is-open')) return;
            if (menu.contains(e.target) || btn.contains(e.target)) return;
            closeMenu();
        });

        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') closeMenu();
        });
    })();
</script>
