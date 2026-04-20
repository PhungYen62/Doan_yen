<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <title>Thêm tỉnh/thành</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <link href="img/favicon.ico" rel="icon">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                    rel="stylesheet">

                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <link href="/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                <link href="/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

                <link href="/admin/css/bootstrap.min.css" rel="stylesheet">
                <link href="/admin/css/style.css" rel="stylesheet">
            </head>

            <body>
                <div class="container-fluid position-relative bg-white d-flex p-0">
                    <div id="spinner"
                        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                            <span class="sr-only">Đang tải...</span>
                        </div>
                    </div>

                    <jsp:include page="../layout/sidebar.jsp" />

                    <div class="content">
                        <jsp:include page="../layout/header.jsp" />

                        <div class="container-fluid px-4">
                            <div class="mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Thêm tỉnh/thành</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/province/create"
                                            modelAttribute="newProvince" class="row">

                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorCode">
                                                    <form:errors path="code" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Mã tỉnh:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorCode ? 'is-invalid' : ''}"
                                                    path="code" />
                                                ${errorCode}
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Tên tỉnh/thành:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                    path="name" />
                                                ${errorName}
                                            </div>

                                            <div class="col-12 mb-5">
                                                <a href="/admin/province" class="btn btn-success">Quay lại</a>
                                                <button type="submit" class="btn btn-primary">Thêm mới</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <jsp:include page="../layout/footer.jsp" />
                    </div>

                    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                            class="bi bi-arrow-up"></i></a>
                </div>

                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/admin/lib/chart/chart.min.js"></script>
                <script src="/admin/lib/easing/easing.min.js"></script>
                <script src="/admin/lib/waypoints/waypoints.min.js"></script>
                <script src="/admin/lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/moment.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
                <script src="/admin/js/main.js"></script>
            </body>

            </html>

