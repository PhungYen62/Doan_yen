<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="utf-8">
                    <title>Liên hệ</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
                    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="css/bootstrap.min.css" rel="stylesheet">
                    <link href="css/global.css" rel="stylesheet">
                    <link href="css/index.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="css/style.css" rel="stylesheet">

                    <style>
                        .contact-title {
                            color: #212337 !important;
                        }

                        .contact-submit-btn {
                            border: 1px solid #ff6a1a !important;
                            color: #ff6a1a !important;
                            transition: all 0.25s ease;
                        }

                        .contact-submit-btn:hover,
                        .contact-submit-btn:focus {
                            background: #ff6a1a !important;
                            border-color: #ff6a1a !important;
                            color: #ffffff !important;
                            box-shadow: none !important;
                        }
                    </style>
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Single Page Header start -->
                    <div class="text-description-wrapper"
                        style="background-image: url('${contextPath}/images/content/Bgcontent.png'); background-size: cover; background-position: center; background-repeat: no-repeat; aspect-ratio: 1445 / 199; min-height: 199px; display: flex; align-items: center; justify-content: center; padding: 0 20px; margin: 0; width: 100vw; margin-left: calc(-50vw + 50%); position: relative; box-shadow: none;">
                        <div class="text-description"
                            style="text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 8px; position: relative; z-index: 1;">
                            <h2 class="page-title"
                                style="color: #212337; font-size: 48px; font-weight: 700; margin-bottom: 8px;">Liên hệ</h2>
                            <div class="breadcrumb" style="color: #212337; font-size: 16px; letter-spacing: 0.5px;">
                                <span>Trang chủ</span>
                                <span class="ca-hng2" style="color: #ff6a1a;"> / Liên hệ</span>
                            </div>
                        </div>
                    </div>
                    <!-- Single Page Header End -->


                    <!-- Contact Start -->
                    <div class="container-fluid contact py-5">
                        <div class="container py-5">
                            <div class="p-5 bg-light rounded">
                                <div class="row g-4">
                                    <div class="col-12">
                                        <div class="text-center mx-auto" style="max-width: 700px;">
                                            <h1 class="text-primary contact-title">Liên hệ với chúng tôi</h1>
                                            <p class="mb-4">Bạn có câu hỏi, góp ý hay cần tư vấn? Vui lòng điền vào biểu
                                                mẫu dưới đây — chúng tôi sẽ phản hồi bạn trong thời gian sớm nhất!</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="h-100 rounded">
                                            <iframe class="rounded w-100" style="height: 400px;"
                                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4543.02326974518!2d105.73293948139138!3d21.05291673763551!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345457e292d5bf%3A0x20ac91c94d74439a!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2hp4buHcCBIw6AgTuG7mWk!5e1!3m2!1svi!2s!4v1747065505086!5m2!1svi!2s"
                                                loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                        </div>

                                    </div>
                                    <div class="col-lg-7">
                                        <form:form action="/contact" method="post" modelAttribute="contact">

                                            <form:input class="form-control mb-4" type="text" value="${user.fullName}"
                                                path="fullName" aria-required="true" />


                                            <form:input path="title"
                                                class="form-control ${not empty errors['title'] ? 'is-invalid' : ''} mb-4"
                                                placeholder="Tiêu đề" />
                                            <form:errors path="title" cssClass="invalid-feedback" />

                                            <!-- Nội dung -->
                                            <form:textarea path="message"
                                                class="form-control ${not empty errors['message'] ? 'is-invalid' : ''} mb-4"
                                                rows="6" placeholder="Nội dung" />
                                            <form:errors path="message" cssClass="invalid-feedback" />


                                            <button
                                                class="w-100 btn form-control py-3 bg-white contact-submit-btn"
                                                type="submit">Gửi</button>
                                        </form:form>
                                        <c:if test="${not empty message}">
                                            <div class="alert alert-success mt-4">${message}</div>
                                        </c:if>
                                    </div>

                                    <div class="col-lg-5">
                                        <div class="d-flex p-4 rounded mb-4 bg-white">
                                            <i class="fas fa-map-marker-alt fa-2x text-primary me-4"></i>
                                            <div>
                                                <h4>Địa chỉ</h4>
                                                <p class="mb-2">Số 298 Đ. Cầu Diễn, Minh Khai, Bắc Từ Liêm, Hà Nội</p>
                                            </div>
                                        </div>
                                        <div class="d-flex p-4 rounded mb-4 bg-white">
                                            <i class="fas fa-envelope fa-2x text-primary me-4"></i>
                                            <div>
                                                <h4>Email</h4>
                                                <p class="mb-2">freshfood@gmail.com</p>
                                            </div>
                                        </div>
                                        <div class="d-flex p-4 rounded bg-white">
                                            <i class="fa fa-phone-alt fa-2x text-primary me-4"></i>
                                            <div>
                                                <h4>Số điện thoại</h4>
                                                <p class="mb-2">(+084) 3456 7890</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Contact End -->



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

