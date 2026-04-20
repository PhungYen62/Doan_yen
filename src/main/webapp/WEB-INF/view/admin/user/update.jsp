<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <title>Người dùng</title>
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
            </head>

            <body>
                <div class="container-fluid position-relative bg-white d-flex p-0">
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



                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Quản lý người dùng</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Bảng điều khiển</a></li>
                                <li class="breadcrumb-item active">Users</li>
                            </ol>
                            <div class=" mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Cập nhật người dùng</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/user/update" modelAttribute="newUser">

                                            <div class="mb-3" style="display: none;">
                                                <label class="form-label">Id:</label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Email:</label>
                                                <form:input type="email" class="form-control" path="email"
                                                    disabled="true" />
                                            </div>

                                            <div class="mb-3">
                                                <c:set var="errorPhoneNumber">
                                                    <form:errors path="phone" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Số điện thoại:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorPhoneNumber ? 'is-invalid' : ''}"
                                                    path="phone" />
                                                ${errorPhoneNumber}
                                            </div>
                                            <div class="mb-3">
                                                <c:set var="errorFullName">
                                                    <form:errors path="fullName" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Họ và tên:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                    path="fullName" />
                                                ${errorFullName}
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Tỉnh/Thành:</label>
                                                <form:input type="text" class="form-control" path="province" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Quận/Huyện:</label>
                                                <form:input type="text" class="form-control" path="district" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Phường/Xã:</label>
                                                <form:input type="text" class="form-control" path="ward" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Địa chỉ chi tiết:</label>
                                                <form:input type="text" class="form-control" path="address_detail" />
                                            </div>

                                            <button type="submit" class="btn btn-warning">Cập nhật</button>
                                        </form:form>
                                    </div>

                                </div>

                            </div>
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


