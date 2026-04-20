<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Fresh Food - Trang Chủ</title>

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                    rel="stylesheet">

                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />

                <link href="css/global.css" rel="stylesheet">
                <link href="css/index.css" rel="stylesheet">

                <style>
                    /* ========== HERO SECTION - FULLSCREEN BACKGROUND IMAGE WITH TEXT OVER ========== */
                    body {
                        padding-top: 135px;
                        margin: 0;
                        font-family: 'Inter', sans-serif;
                        background-color: #ffffff;
                    }

                    .hero-section {
                        width: 100%;
                        height: 600px;
                        background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)),
                            url('images/content/avatar.png');
                        background-size: cover;
                        background-position: right center;
                        background-repeat: no-repeat;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        position: relative;
                        margin-bottom: 60px;
                    }

                    .hero-content-wrapper {
                        width: 100%;
                        max-width: 100%;
                        margin: 0;
                        padding: 0 40px;
                        text-align: center;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 30px;
                        color: white;
                        position: relative;
                        z-index: 1;
                    }

                    .hero-greeting {
                        display: inline-block;
                        background-color: rgba(255, 255, 255, 0.95);
                        color: #749b3f;
                        padding: 8px 20px;
                        border-radius: 8px;
                        font-size: 16px;
                        font-weight: 600;
                        font-family: 'Inter', sans-serif;
                    }

                    .hero-title {
                        font-size: 48px;
                        font-weight: 700;
                        line-height: 1.3;
                        color: white;
                        font-family: 'Inter', sans-serif;
                        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
                        margin: 0;
                    }

                    .hero-button {
                        background-color: #ff7a3d;
                        color: white;
                        border: none;
                        padding: 14px 40px;
                        border-radius: 6px;
                        font-size: 16px;
                        font-weight: 700;
                        font-family: 'Inter', sans-serif;
                        cursor: pointer;
                        transition: background-color 0.3s ease;
                        margin-top: 10px;
                    }

                    .hero-button:hover {
                        background-color: #ff6a1a;
                    }

                    .hero-download-app {
                        text-align: center;
                        margin-top: 20px;
                    }

                    .hero-download-label {
                        font-size: 16px;
                        color: rgba(255, 255, 255, 0.9);
                        margin-bottom: 12px;
                        display: block;
                    }

                    .hero-app-badges {
                        display: flex;
                        gap: 20px;
                        justify-content: center;
                        align-items: center;
                    }

                    .hero-app-badges a {
                        text-decoration: none;
                        transition: transform 0.3s ease;
                    }

                    .hero-app-badges a:hover {
                        transform: scale(1.05);
                    }

                    .hero-app-badges img {
                        height: 40px;
                        width: auto;
                    }

                    /* ========== PROMO SLIDER SECTION (ĐÃ ĐƯỢC CĂN GIỮA HOÀN HẢO) ========== */
                    .promo-slider-section {
                        width: 100%;
                        padding: 0 20px 40px 20px;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        background-image: url('images/content/Clippathgroup.png');
                        background-size: cover;
                        background-position: top;
                        background-repeat: no-repeat;
                        position: relative;
                        box-sizing: border-box;
                        /* Tránh vỡ khung padding */
                        margin-top: -160px;
                        margin-bottom: 80px;
                        padding-top: 80px;
                    }

                    .promo-badge {
                        padding: 8px 24px;
                        background-color: rgba(116, 155, 63, 0.10);
                        border-radius: 8px;
                        color: #749B3F;
                        font-size: 16px;
                        font-weight: 600;
                        font-family: 'Inter', sans-serif;
                        margin-bottom: 20px;
                    }

                    /* Khung bao bọc toàn bộ slider + nút */
                    .promo-slider-row {
                        width: 100%;
                        max-width: 1300px;
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        gap: 80px;
                        margin: 0 auto;
                    }

                    .promo-nav-btn {
                        width: 44px;
                        height: 44px;
                        border-radius: 50%;
                        border: 1.5px solid #749B3F;
                        background: transparent;
                        color: #749B3F;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 16px;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        flex-shrink: 0;
                    }

                    .promo-nav-btn:hover {
                        background: #749B3F;
                        color: white;
                        transform: scale(1.1);
                    }

                    /* Vùng hiển thị ảnh nền + 3 ảnh đè lên */
                    .promo-display-area {
                        position: relative;
                        width: 100%;
                        max-width: 1100px;
                        height: 400px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto;
                        overflow: hidden;
                    }

                    /* Ảnh Background đằng sau */
                    .promo-bg-image {
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                        width: 100%;
                        max-width: 950px;
                        height: 380px;
                        border-radius: 16px;
                        overflow: hidden;
                        z-index: 1;
                        clip-path: polygon(0 10%, 100% 0, 100% 85%, 50% 100%, 0 85%);
                        display: none;
                    }

                    .promo-bg-image img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        opacity: 1;
                    }

                    /* Lớp chứa 3 ảnh sản phẩm */
                    .promo-cards-wrapper {
                        position: relative;
                        z-index: 10;
                        width: 100%;
                        max-width: 980px;
                        height: 360px;
                        margin: 0 auto;
                    }

                    .product-card-item {
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        width: 520px;
                        height: 318px;
                        border-radius: 16px;
                        overflow: hidden;
                        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
                        background-color: white;
                        cursor: pointer;
                        transition: transform 0.85s cubic-bezier(0.22, 0.61, 0.36, 1), opacity 0.85s cubic-bezier(0.22, 0.61, 0.36, 1), box-shadow 0.85s cubic-bezier(0.22, 0.61, 0.36, 1);
                        will-change: transform, opacity;
                    }

                    .product-card-item img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        display: block;
                    }

                    .product-card-item:hover {
                        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
                    }

                    /* Overlay thông tin cho side-card */
                    .product-card-item.side-card::after {
                        display: none;
                    }

                    .side-card-info {
                        display: none;
                    }

                    .side-card-title {
                        display: none;
                    }

                    .side-card-discount {
                        display: none;
                    }

                    /* 2 Ảnh nhỏ */
                    .product-card-item.is-left {
                        transform: translate(-148%, -50%) scale(0.48);
                        opacity: 0.92;
                        z-index: 1;
                    }

                    /* Ảnh giữa to nhất */
                    .product-card-item.is-center {
                        transform: translate(-50%, -50%) scale(1);
                        z-index: 3;
                        opacity: 1;
                        border: 4px solid white;
                        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
                    }

                    .product-card-item.is-right {
                        transform: translate(48%, -50%) scale(0.48);
                        opacity: 0.92;
                        z-index: 1;
                    }

                    .product-card-item.is-exit-right,
                    .product-card-item.is-pre-right {
                        transform: translate(170%, -50%) scale(0.36);
                        opacity: 0;
                        z-index: 0;
                    }

                    .product-card-item.is-exit-left,
                    .product-card-item.is-pre-left {
                        transform: translate(-270%, -50%) scale(0.36);
                        opacity: 0;
                        z-index: 0;
                    }

                    .product-card-item.no-transition {
                        transition: none !important;
                    }

                    @media (max-width: 1100px) {
                        .promo-display-area {
                            max-width: 900px;
                            height: 400px;
                        }

                        .promo-bg-image {
                            height: 320px;
                            max-width: 800px;
                        }

                        .promo-cards-wrapper {
                            max-width: 850px;
                            height: 320px;
                        }

                        .product-card-item {
                            width: 430px;
                            height: 262px;
                        }

                        .product-card-item.is-left {
                            transform: translate(-138%, -50%) scale(0.46);
                        }

                        .product-card-item.is-right {
                            transform: translate(38%, -50%) scale(0.46);
                        }
                    }

                    @media (max-width: 768px) {
                        .hero-section {
                            height: 500px;
                        }

                        .hero-content-wrapper {
                            padding: 0 20px;
                            gap: 20px;
                        }

                        .hero-title {
                            font-size: 32px;
                        }

                        .promo-slider-row {
                            gap: 10px;
                        }

                        .promo-display-area {
                            height: auto;
                            padding: 20px 0;
                            min-height: 320px;
                        }

                        .promo-bg-image {
                            display: none;
                        }

                        /* Ẩn ảnh nền trên mobile */
                        .promo-cards-wrapper {
                            height: 300px;
                        }

                        .product-card-item {
                            width: min(100%, 350px);
                            height: auto;
                            aspect-ratio: 4/5;
                        }

                        .product-card-item.is-left,
                        .product-card-item.is-right,
                        .product-card-item.is-exit-left,
                        .product-card-item.is-exit-right,
                        .product-card-item.is-pre-left,
                        .product-card-item.is-pre-right {
                            display: none;
                        }

                        /* Ẩn ảnh nhỏ trên mobile */
                        .product-card-item.is-center {
                            display: block;
                            transform: translate(-50%, -50%) scale(1);
                        }

                        .card2 {
                            grid-template-columns: repeat(2, 1fr);
                            gap: 16px;
                        }
                    }

                    @media (max-width: 480px) {
                        .hero-section {
                            height: 400px;
                        }

                        .hero-title {
                            font-size: 24px;
                        }

                        .card2 {
                            grid-template-columns: 1fr;
                            gap: 12px;
                        }
                    }

                    /* ========== GIỮ NGUYÊN CÁC CSS KHÁC CỦA BẠN ========== */
                    .product-img-container {
                        width: 100%;
                        height: 200px;
                        background: linear-gradient(135deg, #f5f5f5 0%, #e0e0e0 100%);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        overflow: hidden;
                        border-radius: 12px;
                    }

                    .product-img-container img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        transition: transform 0.3s ease;
                    }

                    .product-img-container:hover img {
                        transform: scale(1.1);
                    }

                    .blog-img-container {
                        width: 100%;
                        height: 240px;
                        background: #f0f0f0;
                        border-radius: 16px;
                        overflow: hidden;
                    }

                    .blog-img-container img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                    }

                    .testimonial-img-circle {
                        width: auto;
                        height: auto;
                        max-width: 500px;
                        border-radius: 50%;
                        overflow: hidden;
                        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                        margin-right: 80px;
                    }

                    .testimonial-img-circle img {
                        width: 100%;
                        height: 100%;
                        object-fit: contain;
                    }

                    .card2 {
                        display: grid;
                        grid-template-columns: repeat(4, 1fr);
                        gap: 24px;
                        width: 100%;
                        margin-bottom: 30px;
                    }

                    .product-cadt {
                        display: flex;
                        flex-direction: column;
                        gap: 12px;
                        height: 100%;
                    }

                    .bnh-phu-th-h-ni-gi-500g-parent {
                        display: flex;
                        flex-direction: column;
                        gap: 10px;
                        flex: 1;
                    }

                    .bnh-phu-th {
                        font-size: 15px;
                        font-weight: 600;
                        color: #1f2937;
                        margin: 0;
                    }

                    .div {
                        font-size: 16px;
                        font-weight: 700;
                        color: #749b3f;
                    }

                    .button7 {
                        width: 100%;
                        background-color: white !important;
                        color: #1f2937 !important;
                        border: 1px solid #e5e7eb !important;
                        padding: 12px 16px !important;
                        border-radius: 6px;
                        font-size: 15px;
                        font-weight: 600;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 8px;
                        margin-top: auto;
                    }

                    .button7:hover {
                        background-color: #ff6a1a !important;
                        color: white !important;
                        border-color: #ff6a1a !important;
                    }

                    .button7 i {
                        font-size: 16px;
                    }

                    .product-cadt form {
                        width: 100%;
                        display: flex;
                        flex-direction: column;
                    }

                    .js-product-card {
                        cursor: pointer;
                    }

                    .our-products-wrapper .caption2 .u-i-c {
                        font-size: 16px;
                        font-weight: 600;
                        color: #749B3F;
                    }

                    .our-products-wrapper .section-description {
                        font-size: 16px;
                        text-align: center;
                    }

                    .our-products-wrapper .c-sn-vng {
                        font-size: 48px;
                    }

                    .special-offer-wrapper .caption2 .u-i-c,
                    .text-description8 .caption2 .nhn-xt,
                    .our-blog .caption2 .u-i-c {
                        font-size: 16px;
                        font-weight: 600;
                    }

                    .jane-doe-container {
                        white-space: nowrap;
                    }

                    .jane-doe-container span + span {
                        margin-left: 6px;
                    }

                    .our-blog .blog-date,
                    .our-blog .blog-post-title,
                    .our-blog .read-more-text {
                        font-size: 16px;
                    }

                    .categories .button3:hover,
                    .categories .button4:hover,
                    .categories2 .button3:hover,
                    .categories2 .button4:hover {
                        background-color: #749B3F !important;
                        border-color: #749B3F !important;
                        color: #ffffff !important;
                    }

                    .categories .button3:hover .c-sn-min,
                    .categories .button4:hover .c-sn-min,
                    .categories2 .button3:hover .c-sn-min,
                    .categories2 .button4:hover .c-sn-min {
                        color: #ffffff !important;
                    }
                </style>
            </head>

            <body>
                <div class="homepage">
                    <jsp:include page="../layout/header.jsp" />

                    <section class="hero-section">
                        <div class="hero-content-wrapper">
                            <div class="hero-greeting">Chào mừng đến Fresh Food</div>

                            <h1 class="hero-title">
                                Kết tinh ẩm thực ba miền<br>
                                Thưởng thức trọn vẹn tinh hoa đất Việt
                            </h1>

                            <button class="hero-button" onclick="window.location.href='/product'">
                                Mua sắm ngay
                            </button>

                            <div class="hero-download-app">
                                <span class="hero-download-label">Download App:</span>
                                <div class="hero-app-badges">
                                    <a href="#" target="_blank">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg"
                                            alt="Download on App Store" style="height: 44px; width: auto;">
                                    </a>
                                    <a href="#" target="_blank">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg"
                                            alt="Get it on Google Play" style="height: 44px; width: auto;">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="promo-slider-section">
                        <div class="promo-badge">
                            Khuyến mãi trong tuần
                        </div>

                        <div class="promo-slider-row">

                            <button class="promo-nav-btn">
                                <i class="fas fa-chevron-left"></i>
                            </button>

                            <div class="promo-display-area">

                                <div class="promo-bg-image">
                                    <img src="images/Clippathgroup.png"
                                        onerror="this.src='https://via.placeholder.com/1000x380/e8f5e9/999?text=Anh+Nen'"
                                        alt="Background">
                                </div>

                                <div class="promo-cards-wrapper">
                                    <div class="product-card-item is-left">
                                        <img src="images/content/Main Frame-1.png"
                                            onerror="this.src='https://via.placeholder.com/250x280/dcedc8/333?text=San+Pham+Trai'"
                                            alt="Sản phẩm Trái">
                                    </div>

                                    <div class="product-card-item is-center">
                                        <img src="images/content/Main Frame.png"
                                            onerror="this.src='https://via.placeholder.com/400x420/aed581/333?text=San+Pham+Chinh+(To)'"
                                            alt="Sản phẩm Chính">
                                    </div>

                                    <div class="product-card-item is-right">
                                        <img src="images/content/Main Frame-2.png"
                                            onerror="this.src='https://via.placeholder.com/250x280/dcedc8/333?text=San+Pham+Phai'"
                                            alt="Sản phẩm Phải">
                                    </div>
                                </div>

                            </div>

                            <button class="promo-nav-btn">
                                <i class="fas fa-chevron-right"></i>
                            </button>

                        </div>
                    </section>

                    <section class="our-products-wrapper">
                        <div class="our-products">
                            <section class="our-products2">
                                <div class="text-description3">
                                    <div class="caption2">
                                        <h3 class="u-i-c">Sản phẩm của chúng tôi</h3>
                                    </div>
                                    <div class="text-description4">
                                        <h2 class="c-sn-vng">Đặc sản vùng miền của chúng tôi</h2>
                                        <div class="section-description">
                                            Chúng tôi tự hào cung cấp nhiều loại đặc sản<br>
                                            của các vùng miền khác nhau đảm bảo chất lượng cao.
                                        </div>
                                    </div>
                                </div>
                                <div class="categories">
                                    <button class="button3">
                                        <div class="c-sn-min">Tất cả</div>
                                    </button>
                                    <button class="button4">
                                        <div class="c-sn-min">Đặc sản miền Bắc</div>
                                    </button>
                                    <button class="button4">
                                        <div class="c-sn-min">Đặc sản miền Trung</div>
                                    </button>
                                    <button class="button4">
                                        <div class="c-sn-min">Đặc sản miền Nam</div>
                                    </button>
                                </div>
                            </section>

                            <div class="card">
                                <section class="card2">
                                    <c:forEach var="product" items="${discountedProducts}" varStatus="loop">
                                        <c:if test="${loop.index < 8}">
                                            <div class="product-cadt js-product-card" role="link" tabindex="0" data-href="/product/${product.id}">
                                                <div class="product-img-container bg-icon">
                                                    <c:if test="${not empty product.firstImage}">
                                                        <img src="/products/${product.firstImage}" alt="${product.name}"
                                                            onerror="this.src='https://via.placeholder.com/282x208/e0e0e0/999?text=${product.name}'">
                                                    </c:if>
                                                    <c:if test="${empty product.firstImage}">
                                                        <img src="https://via.placeholder.com/282x208/e0e0e0/999?text=${product.name}"
                                                            alt="${product.name}">
                                                    </c:if>
                                                </div>
                                                <div class="bnh-phu-th-h-ni-gi-500g-parent">
                                                    <b class="bnh-phu-th">${product.name}</b>
                                                    <div class="div">
                                                        <c:if test="${product.salePrice != null}">
                                                            <fmt:formatNumber value="${product.salePrice}" type="number"
                                                                maxFractionDigits="0" />đ
                                                        </c:if>
                                                    </div>
                                                    <form action="/add-product-to-cart/${product.id}" method="post"
                                                        style="align-self: stretch;">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}">
                                                        <button type="submit" class="button7">
                                                            <span>Thêm vào giỏ hàng</span>
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </section>
                            </div>

                            <button class="button15" onclick="window.location.href='/shop'">
                                <div class="xem-tt-c">Xem tất cả sản phẩm</div>
                            </button>
                        </div>
                    </section>

                    <section class="homepage-inner" style="min-height: auto; padding-bottom: 0;">
                        <div class="special-offer-wrapper"
                            style="background-image: url('images/content/FooterSection.png'); background-size: 100% auto; background-position: center top; background-repeat: no-repeat; background-attachment: scroll; aspect-ratio: 1440 / 640; padding: 100px 10px 52px 180px;">
                            <div class="special-offer">
                                <section class="special-offer2">
                                    <div class="text-description5">
                                        <div class="text-description6">
                                            <div class="text-description7">
                                                <div class="caption2"
                                                    style="background-color: rgba(116, 155, 63, 0.3);">
                                                    <h3 class="u-i-c" style="color: #749b3f;">Ưu đãi đặc biệt</h3>
                                                </div>
                                            </div>
                                            <h1 class="flash-sale2" style="color: #1f2937;">Flash Sale</h1>
                                        </div>
                                        <h2 class="gim-gi-ln-container" style="color: #1f2937;">
                                            <span>Giảm giá lên tới </span>
                                            <span class="off" style="color: #ff7a3d; font-weight: bold;">80% OFF</span>
                                        </h2>
                                    </div>
                                    <div class="countdown"
                                        style="color: #212337; align-items: flex-start; gap: 24px; margin-bottom: 16px;">
                                        <div class="countdown2"
                                            style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                            <h2 class="countdown-delimiters" style="position: static; margin: 0;">03
                                            </h2>
                                            <div class="ngy-wrapper" style="padding: 0; justify-content: center;">
                                                <div class="ngy" style="position: static;">Ngày</div>
                                            </div>
                                        </div>
                                        <div class="countdown3"
                                            style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                            <h2 class="h2" style="position: static; margin: 0;">18</h2>
                                            <div class="gi-wrapper" style="padding: 0; justify-content: center;">
                                                <div class="gi" style="position: static;">Giờ</div>
                                            </div>
                                        </div>
                                        <div class="countdown2"
                                            style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                            <h2 class="countdown-delimiters" style="position: static; margin: 0;">54
                                            </h2>
                                            <div class="pht-wrapper" style="padding: 0; justify-content: center;">
                                                <div class="pht" style="position: static;">Phút</div>
                                            </div>
                                        </div>
                                        <div class="countdown3"
                                            style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                            <h2 class="h2" style="position: static; margin: 0;">21</h2>
                                            <div class="ngy-wrapper" style="padding: 0; justify-content: center;">
                                                <div class="ma" style="position: static;">Mùa</div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <button class="button16" style="background-color: #176d38; margin-top: 8px;">
                                    <b class="code-fruit28-container">
                                        <span class="code">CODE : </span>
                                        <span class="fruit28" style="color: #ffeb3b; font-weight: bold;">FRUIT28</span>
                                    </b>
                                </button>
                            </div>
                        </div>
                    </section>

                    <main class="product-display" style="margin-top: 24px;">
                        <div class="our-products-parent">
                            <div class="our-products3">
                                <div class="categories2">
                                    <button class="button3">
                                        <div class="c-sn-min">Tất cả</div>
                                    </button>
                                    <button class="button4">
                                        <div class="c-sn-min">Đặc sản miền Bắc</div>
                                    </button>
                                    <button class="button4">
                                        <div class="c-sn-min">Đặc sản miền Trung</div>
                                    </button>
                                    <button class="button4">
                                        <div class="c-sn-min">Đặc sản miền Nam</div>
                                    </button>
                                </div>

                                <div class="card4">
                                    <div class="text-description7">
                                        <div class="card">
                                            <section class="card2">
                                                <c:forEach var="product" items="${discountedProducts}">
                                                    <div class="product-cadt js-product-card" role="link" tabindex="0" data-href="/product/${product.id}">
                                                        <div class="product-img-container bg-icon">
                                                            <c:if test="${not empty product.firstImage}">
                                                                <img src="/products/${product.firstImage}"
                                                                    alt="${product.name}"
                                                                    onerror="this.src='https://via.placeholder.com/282x208/e0e0e0/999?text=${product.name}'">
                                                            </c:if>
                                                            <c:if test="${empty product.firstImage}">
                                                                <img src="https://via.placeholder.com/282x208/e0e0e0/999?text=${product.name}"
                                                                    alt="${product.name}">
                                                            </c:if>
                                                        </div>
                                                        <div class="bnh-phu-th-h-ni-gi-500g-parent">
                                                            <b class="bnh-phu-th">${product.name}</b>
                                                            <div class="div">
                                                                <c:if test="${product.salePrice != null}">
                                                                    <fmt:formatNumber value="${product.salePrice}"
                                                                        type="number" maxFractionDigits="0" />đ
                                                                </c:if>
                                                            </div>
                                                            <form action="/add-product-to-cart/${product.id}"
                                                                method="post" style="align-self: stretch;">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}">
                                                                <button type="submit" class="button7">
                                                                    <span>Thêm vào giỏ hàng</span>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </section>
                                        </div>
                                    </div>
                                </div>

                                <button class="button29">
                                    <div class="xem-tt-c">Xem tất cả sản phẩm</div>
                                </button>
                            </div>

                            <div class="image-elements-wrapper">
                                <div class="image-elements">
                                    <div class="testimonial">
                                        <section class="text-description8">
                                            <div class="caption2">
                                                <h3 class="nhn-xt">Nhận xét</h3>
                                            </div>
                                            <div class="text-description9">
                                                <h2 class="c-sn-vng">Khách hàng của chúng tôi nói gì?</h2>
                                                <div class="ng-ch-tin">
                                                    Đừng chỉ tin lời chúng tôi — đây là một vài nhận xét từ khách hàng
                                                    của chúng tôi về trải nghiệm của họ với Fresh Food:
                                                </div>
                                            </div>
                                        </section>
                                        <div class="testimonial2">
                                            <section class="testimonial3">
                                                <div class="testimonial-img-circle">
                                                    <img src="images/content/kkachhang.png" alt="Customer testimonial">
                                                </div>
                                                <div class="testimonial4">
                                                    <div class="special-offer">
                                                        <div class="ti-cc-k">
                                                            "Tôi cực kỳ yêu thích Fresh Food! Chất lượng sản phẩm của họ
                                                            thật tuyệt vời. Luôn tươi ngon, đậm đà hương vị. Việc đặt
                                                            hàng trực tuyến và được giao hàng tận nhà giúp tôi tiết kiệm
                                                            được rất nhiều thời gian. Fresh Food đã trở thành lựa chọn
                                                            hàng đầu của tôi cho mọi nhu cầu về những thức quà đặc sản."
                                                        </div>
                                                        <div class="jane-doe-container">
                                                            <span class="jane-doe">Nguyễn Thị Hương</span>
                                                            <span>Khách hàng VIP</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                            <div class="slider">
                                                <div class="slide-dots"></div>
                                                <div class="slide-dots2"></div>
                                                <div class="slide-dots2"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>

                    <div class="our-blog">
                        <section class="our-products2">
                            <div class="caption2">
                                <h3 class="u-i-c">Blog của chúng tôi</h3>
                            </div>
                            <div class="text-description4">
                                <h2 class="c-sn-vng">Fresh Food Blog</h2>
                                <div class="blog-description">
                                    Chào mừng đến với Blog Fresh Food, nguồn thông tin hữu ích cho mọi thứ liên quan đến
                                    đặc sản của mỗi miền từ nguồn gốc, cách chế biến và nguyên liệu đẩm bảo chất lượng.
                                </div>
                            </div>
                        </section>
                        <div class="blog2">
                            <section class="blog3">
                                <div class="blog-img-container">
                                    <img src="${contextPath}/images/blog/blog1.jpg"
                                        alt="Blog post 1">
                                </div>
                                <div class="download-app">
                                    <div class="text-description5">
                                        <div class="blog-date">May 23, 2024</div>
                                        <b class="blog-post-title">Khám phá những món ngon theo mùa: Hướng dẫn về những
                                            món tươi ngon nhất hiện nay</b>
                                    </div>
                                    <button class="read-more-container">
                                        <b class="read-more-text">Đọc thêm</b>
                                    </button>
                                </div>
                            </section>
                            <section class="blog3">
                                <div class="blog-img-container">
                                    <img src="${contextPath}/images/blog/blog2.jpg"
                                        alt="Blog post 2">
                                </div>
                                <div class="download-app">
                                    <div class="text-description5">
                                        <div class="blog-date">May 23, 2024</div>
                                        <b class="blog-post-title">Bí quyết tạo nên những món salad ngon miệng và bổ
                                            dưỡng</b>
                                    </div>
                                    <button class="read-more-container">
                                        <b class="read-more-text">Đọc thêm</b>
                                    </button>
                                </div>
                            </section>
                            <section class="blog3">
                                <div class="blog-img-container">
                                    <img src="${contextPath}/images/blog/blog3.jpg"
                                        alt="Blog post 3">
                                </div>
                                <div class="download-app">
                                    <div class="text-description5">
                                        <div class="blog-date">May 23, 2024</div>
                                        <b class="blog-post-title">Nghệ thuật chuẩn bị bữa ăn: Làm thế nào để tiết kiệm
                                            thời gian và ăn uống lành mạnh suốt cả tuần</b>
                                    </div>
                                    <button class="read-more-container">
                                        <b class="read-more-text">Đọc thêm</b>
                                    </button>
                                </div>
                            </section>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />
                </div>

                <script>
                    function filterProducts(categoryId) {
                        console.log('Filter by category: ' + categoryId);
                    }

                    // ========== PROMO SLIDER AUTO-PLAY ==========
                    const navButtons = document.querySelectorAll('.promo-nav-btn');
                    let autoPlayInterval;
                    const promoTransitionMs = 850;
                    const promoCards = {
                        left: document.querySelector('.promo-cards-wrapper .is-left'),
                        center: document.querySelector('.promo-cards-wrapper .is-center'),
                        right: document.querySelector('.promo-cards-wrapper .is-right')
                    };
                    let isTransitioning = false;

                    function setCardState(card, state) {
                        card.classList.remove(
                            'is-left',
                            'is-center',
                            'is-right',
                            'is-exit-left',
                            'is-exit-right',
                            'is-pre-left',
                            'is-pre-right'
                        );
                        card.classList.add(state);
                    }

                    function slideRight() {
                        if (isTransitioning) return;
                        isTransitioning = true;

                        const oldLeft = promoCards.left;
                        const oldCenter = promoCards.center;
                        const oldRight = promoCards.right;

                        oldRight.classList.add('no-transition');
                        setCardState(oldRight, 'is-pre-left');
                        oldRight.getBoundingClientRect();
                        oldRight.classList.remove('no-transition');

                        requestAnimationFrame(() => {
                            setCardState(oldLeft, 'is-center');
                            setCardState(oldCenter, 'is-right');
                            setCardState(oldRight, 'is-left');
                        });

                        setTimeout(() => {
                            promoCards.left = oldRight;
                            promoCards.center = oldLeft;
                            promoCards.right = oldCenter;
                            isTransitioning = false;
                        }, promoTransitionMs);
                    }

                    function slideLeft() {
                        if (isTransitioning) return;
                        isTransitioning = true;

                        const oldLeft = promoCards.left;
                        const oldCenter = promoCards.center;
                        const oldRight = promoCards.right;

                        oldLeft.classList.add('no-transition');
                        setCardState(oldLeft, 'is-pre-right');
                        oldLeft.getBoundingClientRect();
                        oldLeft.classList.remove('no-transition');

                        requestAnimationFrame(() => {
                            setCardState(oldRight, 'is-center');
                            setCardState(oldCenter, 'is-left');
                            setCardState(oldLeft, 'is-right');
                        });

                        setTimeout(() => {
                            promoCards.left = oldCenter;
                            promoCards.center = oldRight;
                            promoCards.right = oldLeft;
                            isTransitioning = false;
                        }, promoTransitionMs);
                    }

                    function startAutoPlay() {
                        autoPlayInterval = setInterval(slideRight, 4200);
                    }

                    function resetAutoPlay() {
                        clearInterval(autoPlayInterval);
                        startAutoPlay();
                    }

                    // Add click events to navigation buttons
                    navButtons.forEach((btn, index) => {
                        btn.addEventListener('click', function () {
                            if (index === 0) {
                                // Mũi tên trái
                                slideLeft();
                            } else {
                                // Mũi tên phải
                                slideRight();
                            }
                            resetAutoPlay();
                        });
                    });

                    // Initialize slider
                    startAutoPlay();

                    // Make the whole product card navigate to detail page.
                    (function () {
                        function shouldIgnoreNavigation(target) {
                            return !!(target.closest('form') || target.closest('button') || target.closest('a') || target.closest('input') || target.closest('select') || target.closest('textarea'));
                        }

                        function navigateFromCard(card) {
                            var href = card.getAttribute('data-href');
                            if (!href) return;
                            window.location.href = href;
                        }

                        document.addEventListener('click', function (e) {
                            var card = e.target.closest('.js-product-card');
                            if (!card) return;
                            if (shouldIgnoreNavigation(e.target)) return;
                            navigateFromCard(card);
                        });

                        document.addEventListener('keydown', function (e) {
                            var card = e.target.closest('.js-product-card');
                            if (!card) return;
                            if (e.key !== 'Enter' && e.key !== ' ') return;
                            if (shouldIgnoreNavigation(e.target)) return;
                            e.preventDefault();
                            navigateFromCard(card);
                        });
                    })();
                </script>
            </body>

            </html>
