<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Cart</title>
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
                    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="css/style.css" rel="stylesheet">
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


                    <!-- Modal Search Start -->
                    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content rounded-0">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body d-flex align-items-center">
                                    <div class="input-group w-75 mx-auto d-flex">
                                        <input type="search" class="form-control p-3" placeholder="keywords"
                                            aria-describedby="search-icon-1">
                                        <span id="search-icon-1" class="input-group-text p-3"><i
                                                class="fa fa-search"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Search End -->


                    <!-- Single Page Header start -->
                    <div class="container-fluid page-header py-5">
                        <h1 class="text-center text-white display-6">Lịch sử mua hàng</h1>
                    </div>
                    <!-- Single Page Header End -->

                    <!-- Orders Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="row">
                                <!-- Sidebar -->
                                <div class="col-lg-3 col-md-4 mb-4">
                                    <div class="p-3" style="background:#f8faf5;border-radius:10px;">
                                        <div class="d-flex align-items-center mb-3">
                                            <img src="/avatar/${user.avatar}" alt="Avatar" style="width:44px;height:44px;border-radius:50%;object-fit:cover;border:2px solid #c7e2b1;" onerror="this.src='https://via.placeholder.com/44x44?text=Avatar'" />
                                            <div style="margin-left:10px;font-weight:600;color:#749b3f;">${user.fullName}</div>
                                        </div>
                                        <div style="font-weight:700;margin-bottom:8px;">Quản lý đơn hàng</div>
                                        <a href="/order-history" class="d-block mb-2" style="padding:10px;border-radius:8px;background:#a6c98a;color:#fff;text-decoration:none;">Đơn hàng</a>
                                        <div style="font-weight:700;margin-top:8px;margin-bottom:8px;">Quản lý tài khoản</div>
                                        <a href="/user/profile" class="d-block mb-1" style="padding:8px;border-radius:6px;color:#333;text-decoration:none;">Tài khoản</a>
                                        <a href="/user/vouchers" class="d-block" style="padding:8px;border-radius:6px;color:#333;text-decoration:none;">Voucher của tôi</a>
                                    </div>
                                </div>

                                <!-- Main -->
                                <div class="col-lg-9 col-md-8">
                                    <div class="mb-3">
                                        <button class="btn btn-outline-success btn-sm me-2">Tất cả</button>
                                        <button class="btn btn-outline-secondary btn-sm me-2">Chờ thanh toán</button>
                                        <button class="btn btn-outline-secondary btn-sm me-2">Đang giao</button>
                                        <button class="btn btn-outline-secondary btn-sm me-2">Hoàn thành</button>
                                        <button class="btn btn-outline-secondary btn-sm">Trả hàng</button>
                                    </div>

                                    <c:if test="${empty orders}">
                                        <div class="alert alert-light">Bạn chưa có đơn hàng nào.</div>
                                    </c:if>

                                    <c:forEach var="order" items="${orders}">
                                        <c:forEach var="od" items="${order.orderDetails}">
                                            <div class="mb-3" style="background:#f6f7f8;padding:14px;border-radius:8px;display:flex;align-items:center;justify-content:space-between;">
                                                <div style="display:flex;align-items:center;gap:14px;">
                                                    <img src="${od.product.firstImage}" alt="thumb" style="width:72px;height:72px;border-radius:8px;object-fit:cover;" onerror="this.src='${pageContext.request.contextPath}/resources/images/header/logo.png'" />
                                                    <div>
                                                        <div style="font-weight:600;color:#333;">${od.product.name}</div>
                                                        <div style="color:#666;font-size:13px;">x${od.quantity}</div>
                                                    </div>
                                                </div>
                                                <div style="text-align:right;min-width:160px;">
                                                    <div style="color:#ff6b24;font-weight:700;margin-bottom:8px;"><fmt:formatNumber type="number" value="${od.price}" /> đ</div>
                                                    <div>
                                                        <a href="/product/${od.product.id}" class="btn btn-warning btn-sm" style="background:#ff7a2a;border-color:#ff7a2a;color:#fff;margin-right:8px;">Mua lại</a>
                                                        <a href="/product/${od.product.id}#reviews" class="btn btn-outline-warning btn-sm" style="border-color:#ff7a2a;color:#ff7a2a;">Đánh giá</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Orders Page End -->


                    <jsp:include page="../layout/footer.jsp" />



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


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