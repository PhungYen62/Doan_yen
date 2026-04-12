<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Sản phẩm chi tiết</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/css/style.css" rel="stylesheet">

                <style>
                    .detail-gallery {
                        border: 1px solid rgba(0, 0, 0, .08);
                        border-radius: 12px;
                        background: var(--bs-white);
                        overflow: hidden;
                    }

                    .detail-gallery img {
                        width: 100%;
                        height: auto;
                        display: block;
                    }

                    .detail-thumbs {
                        display: grid;
                        grid-template-columns: repeat(3, 1fr);
                        gap: 12px;
                        margin-top: 14px;
                        max-width: 360px;
                    }

                    @media (min-width: 992px) {
                        .detail-thumbs {
                            grid-template-columns: repeat(3, 1fr);
                        }
                    }

                    .detail-thumb {
                        border: 1px solid rgba(0, 0, 0, .08);
                        border-radius: 12px;
                        overflow: hidden;
                        background: var(--bs-white);
                        cursor: pointer;
                        aspect-ratio: 1 / 1;
                    }

                    .detail-thumb img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        display: block;
                    }

                    .detail-badge {
                        display: inline-block;
                        font-size: 16px;
                        font-weight: 600;
                        padding: 4px 10px;
                        border-radius: 8px;
                        background-color: rgba(116, 155, 63, 0.10);
                        color: var(--primary-green);
                    }

                    .detail-rating-star {
                        color: var(--bs-orange);
                    }

                    .detail-actions {
                        display: flex;
                        gap: 12px;
                        flex-wrap: wrap;
                        align-items: center;
                    }

                    .detail-price {
                        color: var(--bs-orange);
                    }

                    .btn-detail-orange {
                        background-color: var(--bs-orange);
                        border-color: var(--bs-orange);
                        color: var(--bs-white);
                    }

                    .btn-detail-orange:hover,
                    .btn-detail-orange:focus {
                        background-color: var(--bs-orange);
                        border-color: var(--bs-orange);
                        opacity: .92;
                        color: var(--bs-white);
                    }

                    .detail-actions .btn {
                        border-radius: 10px;
                        padding: 12px 18px;
                        font-weight: 500;
                    }

                    .detail-fav {
                        width: 44px;
                        height: 44px;
                        border-radius: 10px;
                        border: 1px solid rgba(0, 0, 0, .12);
                        background: var(--bs-white);
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        color: var(--bs-gray-600);
                        text-decoration: none;
                    }

                    .detail-qty {
                        display: flex;
                        align-items: center;
                        border: 1px solid rgba(0, 0, 0, .18);
                        border-radius: 10px;
                        overflow: hidden;
                        background: var(--bs-white);
                        height: 44px;
                    }

                    .detail-qty .input-group-btn {
                        display: flex;
                        align-items: center;
                        height: 100%;
                    }

                    .detail-qty .detail-qty-btn {
                        width: 44px;
                        height: 100%;
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        padding: 0;
                        border: 0;
                        border-radius: 0 !important;
                        background: transparent;
                        color: var(--bs-dark);
                        line-height: 1;
                    }

                    .detail-qty .detail-qty-btn i {
                        font-size: 12px;
                        line-height: 1;
                    }

                    .detail-qty .detail-qty-btn:focus {
                        box-shadow: none;
                    }

                    .detail-qty .detail-qty-btn.detail-qty-minus {
                        border-right: 1px solid rgba(0, 0, 0, .12);
                    }

                    .detail-qty .detail-qty-btn.detail-qty-plus {
                        border-left: 1px solid rgba(0, 0, 0, .12);
                    }

                    .detail-qty .detail-qty-input {
                        width: 52px;
                        flex: 0 0 52px;
                        height: 100%;
                        line-height: 44px;
                        text-align: center;
                        padding: 0 6px;
                        border: 0;
                        border-radius: 0 !important;
                        box-shadow: none;
                        font-weight: 600;
                        background: transparent;
                    }

                    .detail-tabs .nav-tabs {
                        border-bottom: 0;
                        gap: 16px;
                    }

                    .detail-tabs .nav-tabs .nav-link {
                        margin-bottom: 0;
                        border: 1px solid rgba(0, 0, 0, .15) !important;
                        border-radius: 8px;
                        padding: 10px 28px;
                        font-weight: 500;
                        background: var(--bs-white);
                        color: rgba(0, 0, 0, .45);
                    }

                    .detail-tabs .nav-tabs .nav-link:hover {
                        color: rgba(0, 0, 0, .65);
                    }

                    .detail-tabs .nav-tabs .nav-link.active {
                        background: var(--primary-green) !important;
                        border-color: var(--primary-green) !important;
                        color: var(--bs-white) !important;
                    }

                    .detail-related-label {
                        display: inline-block;
                        padding: 6px 14px;
                        border-radius: 8px;
                        background-color: rgba(116, 155, 63, 0.10);
                        color: var(--primary-green);
                        font-size: 16px;
                        font-weight: 600;
                    }

                    .detail-related-grid {
                        display: grid;
                        grid-template-columns: repeat(4, 282px);
                        gap: 24px;
                        width: 1200px;
                        max-width: 100%;
                        margin: 16px auto 0 auto;
                        justify-content: center;
                    }

                    @media (max-width: 1200px) {
                        .detail-related-grid {
                            width: 100%;
                            grid-template-columns: repeat(2, minmax(0, 1fr));
                        }
                    }

                    @media (max-width: 576px) {
                        .detail-related-grid {
                            grid-template-columns: 1fr;
                        }
                    }

                    .detail-related-card {
                        width: 282px;
                        height: 343px;
                        display: flex;
                        flex-direction: column;
                        padding: 12px;
                        border-radius: 18px;
                        background: var(--bs-white);
                        border: 0;
                        box-shadow:
                            0 4px 10px rgba(16, 24, 40, 0.04),
                            0 1px 3px rgba(16, 24, 40, 0.02);
                        box-sizing: border-box;
                        transition: all 0.3s ease;
                    }

                    .detail-related-card.js-product-card {
                        cursor: pointer;
                    }

                    .detail-related-card:hover {
                        transform: translateY(-8px);
                        box-shadow:
                            0 10px 22px rgba(16, 24, 40, 0.08),
                            0 2px 6px rgba(16, 24, 40, 0.03);
                    }

                    .detail-related-card:active {
                        transform: translateY(-4px);
                    }

                    @media (max-width: 1200px) {
                        .detail-related-card {
                            width: 100%;
                        }
                    }

                    .detail-related-img {
                        height: 200px;
                        width: 100%;
                        margin: 0;
                        background: var(--bs-light);
                        border-radius: 14px;
                        overflow: hidden;
                    }

                    @media (max-width: 1200px) {
                        .detail-related-img {
                            width: 100%;
                        }
                    }

                    .detail-related-img img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        display: block;
                    }

                    .detail-related-body {
                        flex: 1;
                        display: flex;
                        flex-direction: column;
                        padding: 12px 8px 10px 8px;
                        width: 100%;
                        box-sizing: border-box;
                        text-align: center;
                        gap: 10px;
                    }

                    .detail-related-name {
                        flex-shrink: 0;
                        font-weight: 600;
                        color: var(--bs-dark);
                    }

                    .detail-related-prices {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 8px;
                        flex-shrink: 0;
                    }

                    .detail-related-price {
                        font-size: 16px;
                        font-weight: 600;
                        color: var(--bs-orange);
                    }

                    .detail-related-price-old {
                        font-size: 13px;
                        color: #999;
                        text-decoration: line-through;
                    }

                    .detail-related-form {
                        margin-top: auto;
                        width: 100%;
                        padding-top: 4px;
                    }

                    .detail-related-add {
                        background-color: var(--bs-white);
                        color: var(--bs-dark);
                        border: 1px solid rgba(0, 0, 0, .12);
                        padding: 10px 16px;
                        border-radius: 6px;
                        font-size: 14px;
                        font-weight: 600;
                        cursor: pointer;
                        transition: all 0.2s ease;
                        width: 100%;
                    }

                    .detail-related-add:hover {
                        background-color: var(--bs-orange);
                        border-color: var(--bs-orange);
                        color: var(--bs-white);
                    }
                </style>
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <!-- Navbar start -->
                <jsp:include page="../layout/header.jsp" />
                <!-- Navbar End -->

                <div class="container-fluid pt-4 pb-5">
                    <div class="container pb-3 pb-lg-4">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="detail-gallery">
                                    <img id="detailMainImage" src="/products/${product.firstImage}" alt="${product.name}">
                                </div>

                                <div class="detail-thumbs" aria-label="Ảnh sản phẩm">
                                    <c:choose>
                                        <c:when test="${not empty product.images}">
                                            <c:forEach var="img" items="${product.images}" varStatus="status">
                                                <c:if test="${status.index < 3}">
                                                    <div class="detail-thumb" role="button" tabindex="0" data-img-src="/products/${img.imageUrl}" aria-label="Ảnh ${status.index + 1}">
                                                        <img src="/products/${img.imageUrl}" alt="${product.name} - ${status.index + 1}">
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="detail-thumb" role="button" tabindex="0" data-img-src="/products/${product.firstImage}" aria-label="Ảnh 1">
                                                <img src="/products/${product.firstImage}" alt="${product.name}">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="mb-2">
                                    <c:if test="${not empty product.categories}">
                                        <span class="detail-badge">
                                            <c:forEach var="category" items="${product.categories}" varStatus="status">
                                                <c:if test="${status.first}">${category.name}</c:if>
                                            </c:forEach>
                                        </span>
                                    </c:if>
                                </div>

                                <h2 class="fw-bold mb-2">${product.name}</h2>

                                <div class="d-flex align-items-center gap-2 mb-3" style="font-size: 14px;">
                                    <div class="d-flex" style="gap: 2px;">
                                        <i class="fa fa-star detail-rating-star"></i>
                                        <i class="fa fa-star detail-rating-star"></i>
                                        <i class="fa fa-star detail-rating-star"></i>
                                        <i class="fa fa-star detail-rating-star"></i>
                                        <i class="fa fa-star detail-rating-star"></i>
                                    </div>
                                    <span class="text-muted">5.0</span>
                                    <span class="text-muted">(1 Review)</span>
                                </div>

                                <div class="mb-3">
                                    <c:choose>
                                        <c:when test="${product.salePrice != 0 && product.salePrice < product.price}">
                                            <div class="d-flex align-items-baseline flex-wrap gap-2">
                                                <span class="detail-price fw-bold" style="font-size: 26px;">
                                                    <fmt:formatNumber value="${product.salePrice}" type="number" maxFractionDigits="2" />đ/kg
                                                </span>
                                                <span class="text-muted" style="text-decoration: line-through;">
                                                    <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="2" />đ/kg
                                                </span>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="detail-price fw-bold" style="font-size: 26px;">
                                                <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="2" />đ/kg
                                            </span>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:if test="${not empty product.shortDesc}">
                                        <div class="text-muted mt-2">${product.shortDesc}</div>
                                    </c:if>
                                </div>

                                <form action="/add-product-to-cart/${product.id}" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                    <div class="d-flex align-items-center flex-wrap gap-3 mb-4">
                                        <div class="text-dark fw-semibold">Số lượng</div>
                                        <div class="input-group quantity detail-qty" style="width: 140px;">
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-sm btn-minus detail-qty-btn detail-qty-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" name="quantity" class="form-control form-control-sm text-center detail-qty-input" value="1">
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-sm btn-plus detail-qty-btn detail-qty-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <span class="text-muted" style="font-size: 13px;">/kg</span>
                                    </div>

                                    <div class="detail-actions">
                                        <button type="submit" class="btn btn-detail-orange">
                                            <i class="fa fa-shopping-bag me-2"></i>
                                            Thêm vào giỏ hàng
                                        </button>

                                        <a href="/checkout" class="btn btn-detail-orange" style="opacity: .95;">
                                            Mua ngay
                                        </a>

                                        <a class="detail-fav" href="#" aria-label="Yêu thích">
                                            <i class="fa fa-heart"></i>
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="row g-4 mt-4">
                            <div class="col-12">
                                <nav class="detail-tabs">
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active" type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about" aria-controls="nav-about" aria-selected="true">Mô tả</button>
                                        <button class="nav-link" type="button" role="tab" id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission" aria-controls="nav-mission" aria-selected="false">Đánh giá (1)</button>
                                    </div>
                                </nav>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <c:choose>
                                            <c:when test="${not empty product.detailDesc}">
                                                <p style="line-height: 1.75;">${product.detailDesc}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-muted">Chưa có mô tả cho sản phẩm này.</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                        <p class="text-muted mb-0">Chưa có đánh giá.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row g-4 mt-4 mb-5">
                            <div class="col-12 text-center">
                                <div class="mb-3">
                                    <span class="detail-related-label">Sản phẩm của chúng tôi</span>
                                </div>
                                <h2 class="fw-bold mb-3">Sản phẩm liên quan</h2>
                                <p class="text-muted mb-0">Chúng tôi tự hào cung cấp nhiều loại trái cây, rau củ và nguyên liệu tươi sạch mỗi ngày.</p>
                            </div>

                            <div class="col-12">
                                <section class="detail-related-grid" aria-label="Sản phẩm liên quan">
                                    <c:forEach var="related" items="${relatedProducts}" varStatus="loop">
                                        <c:if test="${loop.index < 4}">
                                            <div class="detail-related-card js-product-card" role="link" tabindex="0" data-href="/product/${related.id}" aria-label="Xem chi tiết ${related.name}">
                                                <div class="detail-related-img">
                                                    <a href="/product/${related.id}" aria-label="Xem chi tiết ${related.name}">
                                                        <img src="/products/${related.firstImage}" alt="${related.name}">
                                                    </a>
                                                </div>

                                                <div class="detail-related-body">
                                                    <a href="/product/${related.id}" style="text-decoration: none;">
                                                        <div class="detail-related-name">${related.name}</div>
                                                    </a>

                                                    <c:choose>
                                                        <c:when test="${related.salePrice != 0 && related.salePrice < related.price}">
                                                            <div class="detail-related-prices">
                                                                <span class="detail-related-price">
                                                                    <fmt:formatNumber value="${related.salePrice}" type="number" maxFractionDigits="0" />đ/kg
                                                                </span>
                                                                <span class="detail-related-price-old">
                                                                    <fmt:formatNumber value="${related.price}" type="number" maxFractionDigits="0" />đ/kg
                                                                </span>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="detail-related-price">
                                                                <fmt:formatNumber value="${related.price}" type="number" maxFractionDigits="0" />đ/kg
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <form action="/add-product-to-cart/${related.id}" method="post" class="detail-related-form">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                                        <button type="submit" class="detail-related-add">
                                                            <span>Thêm vào giỏ hàng</span>
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </section>
                            </div>
                        </div>
                        <!-- <h1 class="fw-bold mb-0">Related products</h1>
                        <div class="vesitable">
                            <div class="owl-carousel vegetable-carousel justify-content-center">
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light"
                                            alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Banana</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Bell Papper</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Potatoes</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Potatoes</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
                <!-- Single Product End -->


                <!-- Footer Start -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Footer End -->





                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/lib/easing/easing.min.js"></script>
                <script src="/lib/waypoints/waypoints.min.js"></script>
                <script src="/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/js/main.js"></script>

                <script>
                    (function () {
                        var mainImg = document.getElementById('detailMainImage');
                        if (!mainImg) return;

                        function setMain(src) {
                            if (!src) return;
                            mainImg.src = src;
                        }

                        document.querySelectorAll('.detail-thumb').forEach(function (el) {
                            el.addEventListener('click', function () {
                                setMain(el.getAttribute('data-img-src'));
                            });
                            el.addEventListener('keydown', function (e) {
                                if (e.key === 'Enter' || e.key === ' ') {
                                    e.preventDefault();
                                    setMain(el.getAttribute('data-img-src'));
                                }
                            });
                        });
                    })();

                    // Make the whole related-product card navigate like the shop page.
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
