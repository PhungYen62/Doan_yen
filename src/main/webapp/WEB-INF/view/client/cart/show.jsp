<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Giỏ hàng - Fresh Food</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

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
            font-family: 'Rubik', sans-serif;
            background-color: #ffffff;
        }

        .cart-header {
            padding: 0 20px;
            background-image: url('/resources/images/content/Bgcontent.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            margin-top: 0;
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
            margin-bottom: 8px;
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

        .cart-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .cart-table-section {
            background: white;
            border-radius: 8px;
            border: 1px solid var(--border-light);
            box-shadow: none;
            overflow: hidden;
            margin-bottom: 30px;
        }

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
            padding: 15px;
            text-align: center;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Keep the 'Sản phẩm' column header left-aligned */
        .cart-table thead th:nth-child(2) {
            text-align: left;
        }

        /* Keep the 'Tổng tiền' column header centered */
        .cart-table thead th:nth-child(5) {
            text-align: center;
        }

        /* Keep the 'Thao tác' column header centered */
        .cart-table thead th:nth-child(6) {
            text-align: center;
        }

        /* Center the trash icon/button in the actions column */
        .cart-table tbody td:nth-child(6) {
            text-align: center;
        }

        .cart-table tbody td:nth-child(6) form {
            display: flex !important;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .cart-table tbody td {
            padding: 15px;
            border-bottom: 1px solid var(--border-light);
            vertical-align: middle;
            text-align: center;
        }

        /* Keep product column content left-aligned */
        .cart-table tbody td:nth-child(2) {
            text-align: left;
        }

        /* Keep the 'Tổng tiền' column values centered */
        .cart-table tbody td:nth-child(5) {
            text-align: center;
        }

        .cart-table tbody tr:last-child td {
            border-bottom: none;
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 15px;
            width: 100%;
            justify-content: flex-start;
        }

        .product-image {
            width: 70px;
            height: 70px;
            border-radius: 8px;
            overflow: hidden;
            background: #f3f4f6;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-name a {
            color: var(--text-dark);
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
        }

        .product-name a:hover {
            color: var(--primary-green);
        }

        .price-text {
            color: var(--text-dark);
            font-weight: 500;
            font-size: 14px;
        }

        .quantity-control {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            padding: 4px;
            border-radius: 8px;
            background: #ffffff;
            width: auto;
        }

        .quantity-control button {
            background-color: #f3f4f6;
            border: none;
            color: var(--text-dark);
            width: 32px;
            height: 32px;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border-radius: 6px;
            transition: all 0.3s;
            line-height: 1;
        }

        .quantity-control button i {
            display: block;
            line-height: 1;
        }

        .quantity-control button:hover {
            background-color: #ff6a1a;
            color: white;
        }

        .quantity-control input {
            width: 48px;
            height: 32px;
            text-align: center;
            border: none;
            border-radius: 6px;
            padding: 0 6px;
            font-size: 13px;
            background: transparent;
        }

        .quantity-control input:focus {
            outline: none;
            box-shadow: none;
        }

        .delete-btn {
            background: transparent;
            border: none;
            color: #ff6a1a;
            width: 36px;
            height: 36px;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .delete-btn:hover {
            background-color: #fff1e8;
            color: #e55a0f;
        }

        .empty-cart-message {
            text-align: center;
            padding: 60px 20px;
            color: #6b7280;
        }

        .empty-cart-icon {
            width: 104px;
            height: 104px;
            object-fit: contain;
            display: block;
            margin: 0 auto 20px auto;
            opacity: 0.9;
        }

        .cart-summary {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-top: 30px;
        }

        .discount-section {
            background: white;
            padding: 25px;
            border-radius: 8px;
            border: 1px solid var(--border-light);
            box-shadow: none;
        }

        .discount-section h6 {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 15px;
            text-transform: uppercase;
        }

        .discount-form {
            display: flex;
            gap: 10px;
        }

        .discount-form input {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid var(--border-light);
            border-radius: 4px;
            font-size: 13px;
        }

        .discount-form input:focus {
            outline: none;
            box-shadow: none;
            border-color: #d1d5db;
        }

        .discount-form button {
            background-color: #ff6a1a;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            font-size: 13px;
            transition: all 0.3s;
        }

        .discount-form button:hover {
            background-color: #e55a0f;
        }

        .order-summary {
            background: white;
            padding: 25px;
            border-radius: 8px;
            border: 1px solid var(--border-light);
            box-shadow: none;
        }

        .order-summary h6 {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            font-size: 14px;
        }

        .summary-row:last-child {
            border-bottom: none;
        }

        .summary-row label {
            color: #6b7280;
            font-weight: 500;
        }

        .summary-row .value {
            color: var(--text-dark);
            font-weight: 500;
        }

        .summary-row.total {
            padding: 20px 0;
            border: none;
            border-top: 2px solid var(--border-light);
            margin-top: 15px;
        }

        .summary-row.total label {
            font-size: 16px;
            font-weight: 700;
            color: var(--text-dark);
        }

        .summary-row.total .value {
            font-size: 18px;
            font-weight: 700;
            color: #ff6a1a;
        }

        .checkout-btn {
            width: fit-content;
            background-color: #ffffff;
            color: #ff6a1a;
            border: 1px solid #ff6a1a;
            padding: 12px 34px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
            line-height: 1;
            white-space: nowrap;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 44px;
            margin: 20px auto 0;
            transition: all 0.3s;
        }

        .checkout-btn:hover {
            background-color: #ff6a1a;
            color: #ffffff;
        }

        .alert {
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .cart-summary {
                grid-template-columns: 1fr;
            }

            .cart-table thead {
                display: none;
            }

            .cart-table tbody tr {
                display: block;
                margin-bottom: 20px;
                border: 1px solid var(--border-light);
                border-radius: 8px;
                overflow: hidden;
            }

            .cart-table tbody td {
                display: block;
                padding: 12px 15px;
                border: none;
                text-align: right;
            }

            .cart-table tbody td:before {
                content: attr(data-label);
                float: left;
                font-weight: 600;
                color: var(--text-dark);
            }

            .product-info {
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
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

    <!-- Header -->
    <jsp:include page="../layout/header.jsp" />
    <!-- Header End -->

    <!-- Cart Header -->
    <div class="cart-header">
        <div class="container">
            <h1>Giỏ hàng</h1>
            <div class="breadcrumb-custom">
                <a href="/">Trang chủ</a><span class="ca-hng2"> / Giỏ hàng</span>
            </div>
        </div>
    </div>
    <!-- Cart Header End -->

    <!-- Cart Content -->
    <div class="cart-container">
        <!-- Cart Table Section -->
        <div class="cart-table-section">
            <c:if test="${empty cartDetails}">
                <div class="empty-cart-message">
                    <img class="empty-cart-icon" src="/resources/images/content/Product-Image.png" alt="Giỏ hàng trống">
                    <h5>Giỏ hàng của bạn trống</h5>
                    <p style="margin-top: 10px;">
                        <a href="/" style="color: var(--primary-green); text-decoration: none;">Tiếp tục mua sắm</a>
                    </p>
                </div>
            </c:if>
            <c:if test="${not empty cartDetails}">
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th style="width: 5%;">STT</th>
                            <th style="width: 35%;">Sản phẩm</th>
                            <th style="width: 15%;">Giá</th>
                            <th style="width: 20%;">Số lượng</th>
                            <th style="width: 15%;">Tổng tiền</th>
                            <th style="width: 10%;">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                            <tr>
                                <td style="font-weight: 500; color: #6b7280;">${status.count}</td>
                                <td>
                                    <div class="product-info">
                                        <div class="product-image">
                                            <img src="/products/${cartDetail.product.firstImage}" alt="${cartDetail.product.name}">
                                        </div>
                                        <div class="product-name">
                                            <a href="/product/${cartDetail.product.id}">${cartDetail.product.name}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="price-text">
                                        <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                    </span>
                                </td>
                                <td>
                                    <div class="quantity-control">
                                        <button class="btn-minus" type="button" title="Giảm số lượng">
                                            <i class="fa fa-minus" style="font-size: 12px;"></i>
                                        </button>
                                        <input type="text" 
                                            class="quantity-input"
                                            value="${cartDetail.quantity}"
                                            data-cart-detail-id="${cartDetail.id}"
                                            data-cart-detail-price="${cartDetail.price}"
                                            data-cart-detail-index="${status.index}"
                                            readonly>
                                        <button class="btn-plus" type="button" title="Tăng số lượng">
                                            <i class="fa fa-plus" style="font-size: 12px;"></i>
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    <span class="price-text" data-cart-detail-id="${cartDetail.id}" data-original-price="${cartDetail.price * cartDetail.quantity}">
                                        <fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" /> đ
                                    </span>
                                </td>
                                <td>
                                    <form method="post" action="/delete-cart-product/${cartDetail.id}" style="display: inline;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button class="delete-btn" type="submit" title="Xóa sản phẩm">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>

        <!-- Cart Summary Section -->
        <c:if test="${not empty cartDetails}">
            <div class="cart-summary">
                <!-- Discount Section -->
                <div class="discount-section">
                    <h6>Mã giảm giá</h6>
                    <div class="discount-form">
                        <input type="text" placeholder="Nhập mã giảm giá" id="discountCode">
                        <button type="button" onclick="applyDiscount()">Áp dụng</button>
                    </div>
                </div>

                <!-- Order Summary Section -->
                <div class="order-summary">
                    <h6>Tổng giỏ hàng</h6>
                    
                    <div class="summary-row">
                        <label>Tạm tính:</label>
                        <span class="value" data-cart-total-price="${totalPrice}">
                            <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                        </span>
                    </div>

                    <div class="summary-row">
                        <label>Phí vận chuyển:</label>
                        <span class="value">0 đ</span>
                    </div>

                    <div class="summary-row">
                        <label>Chiết khấu:</label>
                        <span class="value" id="discountAmount">0 đ</span>
                    </div>

                    <div class="summary-row total">
                        <label>Tổng tiền:</label>
                        <span class="value" data-cart-total-price="${totalPrice}">
                            <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                        </span>
                    </div>

                    <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div style="display: none;">
                            <c:forEach var="cartDetail" items="${cart.cartDetails}" varStatus="status">
                                <div class="mb-3">
                                    <form:input type="hidden" path="cartDetails[${status.index}].id" />
                                    <form:input type="hidden" path="cartDetails[${status.index}].quantity" />
                                </div>
                            </c:forEach>
                        </div>
                        <button class="checkout-btn" type="submit">Tiếp tục thanh toán</button>
                    </form:form>

                    <c:if test="${not empty errorMessages}">
                        <div class="alert alert-danger" style="margin-top: 20px;">
                            <ul style="margin-bottom: 0;">
                                <c:forEach var="err" items="${errorMessages}">
                                    <li>${err}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </c:if>
    </div>
    <!-- Cart Content End -->



    <!-- Footer -->
    <jsp:include page="../layout/footer.jsp" />
    <!-- Footer End -->

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

    <script>
        // Quantity control functionality
        $(document).ready(function() {
            // Minus button
            $('.btn-minus').on('click', function() {
                const input = $(this).siblings('.quantity-input');
                let value = parseInt(input.val());
                if (value > 1) {
                    value--;
                    input.val(value);
                    updateCartTotal();
                }
            });

            // Plus button
            $('.btn-plus').on('click', function() {
                const input = $(this).siblings('.quantity-input');
                let value = parseInt(input.val());
                value++;
                input.val(value);
                updateCartTotal();
            });

            // Update cart total
            function updateCartTotal() {
                let total = 0;
                $('.quantity-input').each(function() {
                    const quantity = parseInt($(this).val());
                    const price = parseFloat($(this).data('cart-detail-price'));
                    const cartDetailId = $(this).data('cart-detail-id');
                    
                    const itemTotal = quantity * price;
                    const totalSpan = $('[data-cart-detail-id="' + cartDetailId + '"]');
                    totalSpan.text(formatCurrency(itemTotal) + ' đ');
                    
                    total += itemTotal;
                });

                // Update grand total
                $('.summary-row .value[data-cart-total-price]').text(formatCurrency(total) + ' đ');
            }

            function formatCurrency(value) {
                return new Intl.NumberFormat('vi-VN').format(value);
            }
        });

        function applyDiscount() {
            const code = $('#discountCode').val();
            if (code.trim() === '') {
                alert('Vui lòng nhập mã giảm giá');
                return;
            }
            // Server-side discount logic will be implemented here
            alert('Mã giảm giá: ' + code + ' (tính năng sẽ được thực thi phía máy chủ)');
        }
    </script>
</body>

</html>