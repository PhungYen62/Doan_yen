<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <title>Sản phẩm</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Favicon -->
                <link href="img/favicon.ico" rel="icon">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                <link href="/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

                <!-- Customized Bootstrap Stylesheet -->
                <link href="/admin/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/admin/css/style.css" rel="stylesheet">
                <style>
                    .admin-product-page .product-list-wrap {
                        padding-left: 16px !important;
                        padding-right: 16px !important;
                    }

                    .admin-product-page .product-card {
                        padding-left: 20px;
                        padding-right: 20px;
                    }

                    .admin-product-page .product-table {
                        min-width: 1500px;
                    }

                    .admin-product-page .product-action-group {
                        display: inline-flex;
                        flex-wrap: nowrap;
                        white-space: nowrap;
                        gap: 6px;
                    }

                    .admin-product-page .product-action-group .btn {
                        white-space: nowrap;
                    }
                </style>
            </head>

            <body>
                <div class="container-fluid position-relative bg-white d-flex p-0 admin-product-page">
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                            <span class="sr-only">Đang tải...</span>
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


                        <!-- Recent Sales Start -->
                        <div class="container-fluid pt-5 px-4 product-list-wrap">
                            <div class="bg-light text-center rounded p-4 product-card">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Danh sách sản phẩm</h6>
                                    <a href="/admin/product/create">Thêm mới</a>
                                </div>
                                <div class="row g-3 mb-4" data-filter-toolbar data-target="#admin-product-table">
                                    <div class="col-md-6">
                                        <label class="form-label text-start d-block">Tìm kiếm</label>
                                        <input type="search" class="form-control" data-filter-search
                                            placeholder="Tìm theo tên sản phẩm, danh mục hoặc tỉnh/thành">
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label text-start d-block">Danh mục</label>
                                        <select class="form-select" data-filter-column="6">
                                            <option value="">Tất cả danh mục</option>
                                            <c:forEach var="category" items="${categories}">
                                                <option value="${category.name}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label text-start d-block">Tỉnh/Thành</label>
                                        <select class="form-select" data-filter-column="7">
                                            <option value="">Tất cả tỉnh/thành</option>
                                            <c:forEach var="province" items="${provinces}">
                                                <option value="${province.name}">${province.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table id="admin-product-table" class="table text-start align-middle table-bordered table-hover mb-0 product-table">
                                        <thead>
                                            <tr class="text-dark">
                                                <th scope="col">ID</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Giá</th>
                                                <th scope="col">Giá khuyến mãi</th>
                                                <th scope="col">Hình ảnh</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Danh mục</th>
                                                <th scope="col">Tỉnh/Thành</th>
                                                <th scope="col">Ngày tạo</th>
                                                <th scope="col">Ngày cập nhật</th>
                                                <th scope="col">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${products}">

                                                <tr>
                                                    <th>${product.id}</th>
                                                    <td>${product.name}</td>
                                                    <td>
                                                        <fmt:formatNumber value="${product.price}" type="number"
                                                            maxFractionDigits="2" />đ
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value="${product.salePrice}" type="number"
                                                            maxFractionDigits="2" />đ
                                                    </td>
                                                    <td><img src="/products/${product.firstImage}" alt="Hình ảnh sản phẩm"
                                                            width="100">
                                                    </td>
                                                    <td>${product.quantity} kg</td>
                                                    <td>
                                                        <c:forEach var="category" items="${product.categories}">
                                                            ${category.name} <br />
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${product.province != null}">
                                                                ${product.province.name}
                                                            </c:when>
                                                            <c:otherwise>
                                                                -
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${product.createdAt}</td>
                                                    <td>${product.updatedAt}</td>

                                                    <td>
                                                        <div class="product-action-group">
                                                            <a href="/admin/product/${product.id}"
                                                                class="btn btn-success">Xem</a>
                                                            <a href="/admin/product/update/${product.id}"
                                                                class="btn btn-warning  mx-2">Cập nhật</a>
                                                            <a href="/admin/product/delete/${product.id}"
                                                                class="btn btn-danger">Xóa</a>
                                                        </div>

                                                    </td>
                                                </tr>

                                            </c:forEach>

                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </div>
                        <!-- Recent Sales End -->


                        <div class="pt-4">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                        href="/admin/product?page=${currentPage-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                    <li class="page-item">
                                        <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                            href="/admin/product?page=${loop.index + 1}">${loop.index
                                            + 1}
                                        </a>
                                    </li>
                                </c:forEach>

                                <li class="page-item">
                                    <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                        href="/admin/product?page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </div>


                        <!-- Footer Start -->
                        <jsp:include page="../layout/footer.jsp" />
                        <!-- Footer End -->
                    </div>
                    <!-- Content End -->


                    <!-- Nút về đầu trang -->
                    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                            class="bi bi-arrow-up"></i></a>
                </div>

                <!-- JavaScript Libraries -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/admin/lib/chart/chart.min.js"></script>
                <script src="/admin/lib/easing/easing.min.js"></script>
                <script src="/admin/lib/waypoints/waypoints.min.js"></script>
                <script src="/admin/lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/moment.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

                <!-- Template Javascript -->
                <script src="/admin/js/main.js"></script>
            </body>

            </html>



