<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8">
            <title>Liên hệ</title>
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
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

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
                        <h1 class="mt-4">Contacts</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Bảng điều khiển</a></li>
                            <li class="breadcrumb-item"><a href="/admin/contact">Contact</a></li>
                            <li class="breadcrumb-item active">Chi tiết</li>
                        </ol>
                        <div class="container mt-5">
                            <div class="row">
                                <div class="col-12 mx-auto">
                                    <div class="d-flex justify-content-between">
                                        <h3>Chi tiết liên hệ có mã = ${id}</h3>
                                    </div>

                                    <hr />

                                    <div class="card" style="width: 60%">

                                        <div class="card-header">
                                            Contact information
                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">Email: ${contact.email}</li>
                                            <li class="list-group-item">Họ và tên: ${contact.fullName}</li>
                                            <li class="list-group-item">Title: ${contact.title}</li>
                                            <li class="list-group-item">Message: ${contact.message}</li>
                                        </ul>
                                    </div>
                                    <a href="/admin/contact" class="btn btn-success mt-3">Quay lại</a>
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
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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



