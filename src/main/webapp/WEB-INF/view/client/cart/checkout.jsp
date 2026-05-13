<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Thanh toán - Fresh Food</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <style>
        :root {
            --primary-green: #749b3f;
            --text-dark: #1f2937;
            --border-light: #e5e7eb;
            --bg-light: #f9fafb;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #ffffff;
        }

        /* Banner (reuse from cart/show) */
        .cart-header {
            padding: 0 20px;
            background-image: url('/resources/images/content/Bgcontent.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            aspect-ratio: 1445 / 199;
            min-height: 199px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100vw;
            margin-left: calc(-50vw + 50%);
            position: relative;
        }

        .cart-header .container {
            text-align: center;
            width: 100%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 8px;
            position: relative;
            z-index: 1;
        }

        .cart-header h1 {
            font-size: 48px;
            font-weight: 700;
            margin: 0;
            color: #212337;
        }

        .breadcrumb-custom {
            font-size: 16px;
            color: #212337;
            letter-spacing: 0.5px;
        }

        .breadcrumb-custom a {
            color: #212337;
            text-decoration: none;
        }

        .breadcrumb-custom a:hover {
            text-decoration: underline;
        }

        .breadcrumb-custom .ca-hng2 {
            color: #ff6a1a;
        }

        .checkout-container {
            max-width: 1200px;
            margin: 30px auto 60px auto;
            padding: 0 20px;
        }

        .checkout-grid {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: 24px;
            align-items: start;
        }

        .checkout-col {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .card-box {
            background: #ffffff;
            border: 1px solid var(--border-light);
            border-radius: 8px;
            box-shadow: none;
            overflow: hidden;
        }

        .card-box-inner {
            padding: 18px;
        }

        .card-title {
            font-size: 14px;
            font-weight: 700;
            color: #212337;
            margin: 0 0 12px 0;
            text-transform: uppercase;
        }

        /* Table (reuse from cart/show style) */
        .cart-table {
            width: 100%;
            margin-bottom: 0;
        }

        .cart-table thead {
            background-color: #f3f4f6;
            border-bottom: 2px solid var(--border-light);
        }

        .cart-table thead th {
            font-weight: 600;
            color: var(--text-dark);
            padding: 14px 12px;
            text-align: center;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            white-space: nowrap;
        }

        .cart-table thead th:nth-child(2) {
            text-align: left;
        }

        .cart-table tbody td {
            padding: 12px;
            border-bottom: 1px solid var(--border-light);
            vertical-align: middle;
            text-align: center;
            font-size: 14px;
        }

        .cart-table tbody td:nth-child(2) {
            text-align: left;
        }

        .cart-table tbody tr:last-child td {
            border-bottom: none;
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .product-image {
            width: 56px;
            height: 56px;
            border-radius: 8px;
            overflow: hidden;
            background: #f3f4f6;
            flex-shrink: 0;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-name a {
            color: #212337;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
        }

        .product-name a:hover {
            color: var(--primary-green);
        }

        .price-text {
            color: #212337;
            font-weight: 500;
        }

        /* Payment */
        .payment-options {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .payment-option {
            display: flex;
            gap: 10px;
            align-items: center;
            font-size: 13px;
            color: #ff6a1a;
        }

        .payment-option input {
            -webkit-appearance: none;
            appearance: none;
            width: 14px;
            height: 14px;
            border: 2px solid #ff6a1a;
            border-radius: 50%;
            background: #ffffff;
            display: inline-grid;
            place-content: center;
            margin: 0;
            cursor: pointer;
            box-shadow: none;
        }

        .payment-option input::before {
            content: "";
            width: 5px;
            height: 5px;
            border-radius: 50%;
            background: #ff6a1a;
            transform: scale(0);
            transition: transform 0.15s ease-in-out;
        }

        .payment-option input:checked::before {
            transform: scale(1);
        }

        .payment-option input:focus {
            outline: none;
        }

        .qr-box {
            margin-top: 14px;
            border: none;
            border-radius: 0;
            padding: 0;
            text-align: center;
        }

        .qr-box img {
            width: 100%;
            max-width: 220px;
            height: auto;
            object-fit: contain;
            display: block;
            margin: 0 auto;
            border: 1px solid var(--border-light);
            border-radius: 8px;
            padding: 10px;
            background: #ffffff;
            box-sizing: border-box;
        }

        .qr-meta {
            margin-top: 10px;
            font-size: 11px;
            color: #ff6a1a;
            font-weight: 700;
            letter-spacing: 0.3px;
            line-height: 1.5;
        }

        /* Customer info */
        .muted-text {
            font-size: 12px;
            color: #6b7280;
            line-height: 1.5;
            margin: -6px 0 12px 0;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .field label {
            font-size: 12px;
            color: #212337;
            font-weight: 600;
        }

        .field input {
            border: 1px solid var(--border-light);
            border-radius: 6px;
            padding: 10px 12px;
            font-size: 13px;
            outline: none;
            box-shadow: none;
        }

        .field input:focus {
            border-color: #d1d5db;
            box-shadow: none;
        }

        .field.full {
            grid-column: 1 / -1;
        }

        .checkbox-row {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 10px;
            font-size: 12px;
            color: #212337;
        }

        .checkbox-row input {
            -webkit-appearance: none;
            appearance: none;
            width: 14px;
            height: 14px;
            border: 1.5px solid #d1d5db;
            border-radius: 3px;
            background: #ffffff;
            display: inline-grid;
            place-content: center;
            margin: 0;
            cursor: pointer;
            box-shadow: none;
            position: relative;
        }

        .checkbox-row input::before {
            content: "";
            width: 4px;
            height: 7px;
            border-right: 2px solid #ffffff;
            border-bottom: 2px solid #ffffff;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -55%) rotate(45deg) scale(0);
            transition: transform 0.15s ease-in-out;
        }

        .checkbox-row:hover input {
            border-color: #ff6a1a;
            background: #ff6a1a;
        }

        .checkbox-row input:checked {
            border-color: #ff6a1a;
            background: #ff6a1a;
        }

        .checkbox-row input:checked::before {
            transform: translate(-50%, -55%) rotate(45deg) scale(1);
        }

        .checkbox-row input:focus {
            outline: none;
        }

        /* Order summary */
        .summary-rows {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 6px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            gap: 16px;
            font-size: 13px;
            color: #212337;
        }

        .summary-row .label {
            color: #6b7280;
        }

        .summary-row.total {
            padding-top: 12px;
            margin-top: 6px;
            border-top: 1px solid var(--border-light);
            font-weight: 800;
        }

        .summary-row.total .value {
            color: #ff6a1a;
        }

        .action-row {
            margin-top: 14px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .btn-secondary-gray {
            width: 100%;
            border: 1px solid var(--border-light);
            background: #f3f4f6;
            color: #6b7280;
            border-radius: 6px;
            padding: 10px 12px;
            font-weight: 700;
            font-size: 13px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-secondary-gray:hover {
            color: #ff6a1a;
            text-decoration: none;
        }

        .btn-primary-orange {
            width: 100%;
            border: none;
            background: #ff6a1a;
            color: #ffffff;
            border-radius: 6px;
            padding: 10px 12px;
            font-weight: 800;
            font-size: 13px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .btn-primary-orange:hover {
            background: #e55a0f;
        }

        .btn-primary-orange:disabled {
            background: #d1d5db;
            color: #6b7280;
            cursor: not-allowed;
        }

        .btn-primary-orange:disabled:hover {
            background: #d1d5db;
        }

        .checkout-alert {
            margin-bottom: 20px;
        }

        .checkout-alert ul {
            margin-bottom: 0;
            padding-left: 18px;
        }

        .stock-warning {
            margin-top: 6px;
            font-size: 12px;
            font-weight: 600;
            color: #dc2626;
        }

        .empty-cart-message {
            text-align: center;
            padding: 60px 20px;
            color: #6b7280;
        }

        .empty-cart-message i {
            font-size: 48px;
            color: #d1d5db;
            margin-bottom: 20px;
        }

        @media (max-width: 992px) {
            .checkout-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Banner -->
    <div class="cart-header">
        <div class="container">
            <h1>Giỏ hàng</h1>
            <div class="breadcrumb-custom">
                <a href="/">Trang chủ</a><span class="ca-hng2"> / Giỏ hàng</span>
            </div>
        </div>
    </div>

    <div class="checkout-container">
        <c:if test="${empty cartDetails}">
            <div class="card-box">
                <div class="empty-cart-message">
                    <i class="fas fa-shopping-cart"></i>
                    <h5>Giỏ hàng của bạn trống</h5>
                    <p style="margin-top: 10px;">
                        <a href="/" style="color: #ff6a1a; text-decoration: none; font-weight: 600;">Tiếp tục mua sắm</a>
                    </p>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty cartDetails}">
            <!-- Main place-order form kept separate to avoid nested forms -->
            <form id="placeOrderForm" method="post" action="/place-order">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="totalPrice" value="${totalPrice}" />
            </form>

            <c:if test="${not empty errorMessages}">
                <div class="alert alert-danger checkout-alert">
                    <ul>
                        <c:forEach var="err" items="${errorMessages}">
                            <li>${err}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <div class="checkout-grid">
                <!-- Left column -->
                <div class="checkout-col">
                    <!-- Cart items -->
                    <div class="card-box">
                        <table class="cart-table">
                            <thead>
                                <tr>
                                    <th style="width: 8%;">STT</th>
                                    <th style="width: 50%;">Sản phẩm</th>
                                    <th style="width: 18%;">Số lượng</th>
                                    <th style="width: 24%;">Tổng tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                    <tr>
                                        <td style="font-weight: 600; color: #6b7280;">${status.count}</td>
                                        <td>
                                            <div class="product-info">
                                                <div class="product-image">
                                                    <img src="/products/${cartDetail.product.firstImage}" alt="${cartDetail.product.name}">
                                                </div>
                                                <div class="product-name">
                                                    <a href="/product/${cartDetail.product.id}" target="_blank">${cartDetail.product.name}</a>
                                                    <div style="margin-top: 2px; font-size: 12px; color: #6b7280;">
                                                        <fmt:formatNumber type="number" value="${cartDetail.price}" /> VND
                                                    </div>
                                                    <c:if test="${cartDetail.quantity > cartDetail.product.quantity}">
                                                        <div class="stock-warning">
                                                            Chỉ còn ${cartDetail.product.quantity} trong kho.
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="price-text">${cartDetail.quantity}</span>
                                        </td>
                                        <td>
                                            <span class="price-text">
                                                <fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" /> VND
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Customer info -->
                    <div class="card-box">
                        <div class="card-box-inner">
                            <div class="card-title">Thông tin khách hàng</div>
                            <div class="muted-text">
                                Các trường tin được đánh dấu * là thông tin bắt buộc, quý khách hàng vui lòng cung cấp đúng thông tin.
                            </div>

                            <div class="form-grid">
                                <div class="field">
                                    <label>Họ và tên của khách hàng *</label>
                                    <input form="placeOrderForm" name="receiverName" value="${user.fullName}" required />
                                </div>
                                <div class="field">
                                    <label>Số điện thoại của khách hàng *</label>
                                    <input form="placeOrderForm" name="receiverPhone" value="${user.phone}" required />
                                </div>
                                <div class="field full">
                                    <label>Địa chỉ của khách hàng *</label>
                                    <input form="placeOrderForm" name="receiverAddress" value="${user.province},${user.district},${user.ward},${user.address_detail}" required />
                                </div>
                            </div>

                            <label class="checkbox-row">
                                <input type="checkbox" checked>
                                <span>Tôi xác nhận giao hàng tới thông tin trên</span>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Right column -->
                <div class="checkout-col">
                    <!-- Payment methods -->
                    <div class="card-box">
                        <div class="card-box-inner">
                            <div class="card-title">Hình thức thanh toán</div>
                            <div class="payment-options">
                                <label class="payment-option">
                                    <input form="placeOrderForm" type="radio" name="paymentMethod" value="COD" checked>
                                        <span>Thanh toán bằng tiền mặt (COD)</span>
                                    </label>
                                    <label class="payment-option">
                                        <input form="placeOrderForm" type="radio" name="paymentMethod" value="VNPAY">
                                        <span>Thanh toán trực tuyến (VNPay Sandbox)</span>
                                    </label>
                        </div>
                    </div>

                    <!-- Order summary -->
                    <div class="card-box">
                        <div class="card-box-inner">
                            <div class="card-title">Tổng giỏ hàng</div>
                            <div class="summary-rows">
                                <div class="summary-row">
                                    <span class="label">Tổng tiền sản phẩm:</span>
                                    <span class="value"><fmt:formatNumber type="number" value="${totalPrice}" /> VND</span>
                                </div>
                                <div class="summary-row">
                                    <span class="label">Chiết khấu:</span>
                                    <span class="value">0%</span>
                                </div>
                                <div class="summary-row">
                                    <span class="label">Phí vận chuyển:</span>
                                    <span class="value">0 VND</span>
                                </div>
                                <div class="summary-row total">
                                    <span class="label">Thành tiền:</span>
                                    <span class="value"><fmt:formatNumber type="number" value="${totalPrice}" /> VND</span>
                                </div>
                            </div>

                            <div class="action-row">
                                <a class="btn-secondary-gray" href="/cart">Hủy đơn</a>
                                <button class="btn-primary-orange" type="submit" form="placeOrderForm" <c:if test="${hasStockIssues}">disabled</c:if>>
                                    <c:choose>
                                        <c:when test="${hasStockIssues}">Không thể đặt hàng</c:when>
                                        <c:otherwise>Đặt hàng</c:otherwise>
                                    </c:choose>
                                </button>
                            </div>
                            <c:if test="${hasStockIssues}">
                                <div class="stock-warning" style="margin-top: 12px; text-align: center;">
                                    Vui lòng quay lại giỏ hàng để giảm số lượng.
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top">
        <i class="fa fa-arrow-up"></i>
    </a>

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
