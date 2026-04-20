<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Đổi mật khẩu</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
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
                    <div class="my-5 py-5">

                    </div>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <h2 class="mx-auto">Đổi mật khẩu</h2>
                                <form:form method="post" action="/user/change-password" modelAttribute="changePassword">
                                    <div class="form-group mb-3">
                                        <label>Mật khẩu hiện tại:</label>
                                        <form:password path="currentPassword" class="form-control" />
                                        <form:errors path="currentPassword" cssClass="text-danger" />
                                        <c:if test="${errorCurrentPassword != null}">
                                            <div class="text-danger">${errorCurrentPassword}</div>
                                        </c:if>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Mật khẩu mới:</label>
                                        <form:password path="newPassword" class="form-control" />
                                        <form:errors path="newPassword" cssClass="text-danger" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Nhập lại mật khẩu mới:</label>
                                        <form:password path="confirmPassword" class="form-control" />
                                        <form:errors path="confirmPassword" cssClass="text-danger" />
                                        <c:if test="${errorPasswordMismatch != null}">
                                            <div class="text-danger">${errorPasswordMismatch}</div>
                                        </c:if>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                                </form:form>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />



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
                </body>

                </html>
