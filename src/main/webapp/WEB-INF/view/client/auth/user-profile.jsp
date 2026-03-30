<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Cập nhật thông tin cá nhân</title>
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
                                <h2 class="mx-auto">Cập nhật thông tin cá nhân</h2>
                                <form:form modelAttribute="user" method="post" action="/user/update"
                                    enctype="multipart/form-data">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="mb-3" style="display: none;">
                                        <label class="form-label">Id:</label>
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>
                                    <form:input path="email" type="hidden" />

                                    <div class="form-group mb-3">
                                        <label>Họ tên:</label>
                                        <form:input path="fullName" cssClass="form-control" />
                                        <form:errors path="fullName" cssClass="text-danger" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Số điện thoại:</label>
                                        <form:input path="phone" cssClass="form-control" />
                                        <form:errors path="phone" cssClass="text-danger" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Ảnh đại diện:</label>
                                        <input type="file" name="avatarFile" class="form-control" />
                                        <c:if test="${user.avatar != null}">
                                            <img src="/avatar/${user.avatar}" alt="Avatar" width="100px" class="mt-2" />
                                        </c:if>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Tỉnh/Thành phố:</label>
                                        <form:input path="province" cssClass="form-control" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Quận/Huyện:</label>
                                        <form:input path="district" cssClass="form-control" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Phường/Xã:</label>
                                        <form:input path="ward" cssClass="form-control" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Địa chỉ chi tiết:</label>
                                        <form:input path="address_detail" cssClass="form-control" />
                                    </div>

                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
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