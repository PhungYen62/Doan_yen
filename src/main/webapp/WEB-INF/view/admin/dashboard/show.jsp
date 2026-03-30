<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Admin-Dashboard</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Favicon -->
                <link href="img/favicon.ico" rel="icon">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                <link href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

                <!-- Customized Bootstrap Stylesheet -->
                <link href="admin/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="admin/css/style.css" rel="stylesheet">
            </head>

            <body>
                <div class="container-fluid position-relative bg-white d-flex p-0">
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Sidebar Start -->
                    <jsp:include page="../layout/sidebar.jsp" />
                    <!-- Sidebar End -->


                    <!-- Content Start -->
                    <div class="content">
                        <!-- Navbar Start -->
                        <jsp:include page="../layout/header.jsp" />
                        <!-- Navbar End -->


                        <!-- Sale & Revenue Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">

                                        <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng số sản phẩm</p>
                                            <h6 class="mb-0">${totalProducts}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng doanh thu</p>
                                            <h6 class="mb-0">
                                                <fmt:formatNumber value="${totalRevenue}" type="number"
                                                    groupingUsed="true" maxFractionDigits="0" /> đ

                                            </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-area fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng số khách hàng</p>
                                            <h6 class="mb-0">${totalCustomers}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-line fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng số đơn đặt hàng</p>
                                            <h6 class="mb-0">${totalOrders}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Sale & Revenue End -->


                        <!-- Sales Chart Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <div class="col-sm-12 col-xl-12">
                                    <div class="bg-light text-center rounded p-4">
                                        <div class="d-flex align-items-center justify-content-between mb-4">
                                            <h6 class="mb-0">Doanh thu 7 ngày gần nhất</h6>
                                        </div>
                                        <canvas id="salse-revenue"
                                            style="width:100% !important; height:400px !important;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Sales Chart End -->


                        <!-- Top khách hàng -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Top 5 khách hàng mua nhiều nhất</h6>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-dark">
                                                <th scope="col">Tên khách hàng</th>
                                                <th scope="col">Số điện thoại</th>
                                                <th scope="col">Số đơn hàng đã mua</th>
                                                <th scope="col">Tổng tiền đã chi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="customer" items="${topCustomers}">
                                                <tr>
                                                    <td>${customer.userName}</td>
                                                    <td>${customer.userPhone}</td>
                                                    <td>${customer.totalOrders}</td>
                                                    <td>
                                                        <span>${customer.formattedTotalSpent} đ</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Recent Sales End -->


                        <!-- Sản phẩm sắp hết hàng -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Sản phẩm sắp hết hàng</h6>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-dark">
                                                <th scope="col">Tên sản phẩm</th>
                                                <th scope="col">Số lượng tồn kho</th>
                                                <th scope="col">Hình ảnh</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${lowStockProducts}">
                                                <tr>
                                                    <td>${product.name}</td>
                                                    <td>${product.quantity}kg</td>
                                                    <td><img src="/products/${product.firstImage}" alt="Product Image"
                                                            width="100"></td>
                                                    <td><a href="/admin/product/update/${product.id}"
                                                            class="btn btn-warning  mx-2">Update</a></td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- Widgets End -->


                            <!-- Footer Start -->
                            <jsp:include page="../layout/footer.jsp" />
                            <!-- Footer End -->
                        </div>
                        <!-- Content End -->


                        <!-- Back to Top -->
                        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                                class="bi bi-arrow-up"></i></a>
                    </div>

                    <!-- JavaScript Libraries -->
                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="admin/lib/chart/chart.min.js"></script>
                    <script src="admin/lib/easing/easing.min.js"></script>
                    <script src="admin/lib/waypoints/waypoints.min.js"></script>
                    <script src="admin/lib/owlcarousel/owl.carousel.min.js"></script>
                    <script src="admin/lib/tempusdominus/js/moment.min.js"></script>
                    <script src="admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
                    <script src="admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="admin/js/main.js"></script>
            </body>

            </html>