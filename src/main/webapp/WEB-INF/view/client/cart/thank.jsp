<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Cảm ơn</title>

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

                <!-- Template Stylesheet -->
                <link href="css/style.css" rel="stylesheet">
                <style>
                    .btn-back-cart {
                        background: #ffffff;
                        border: 1px solid #cfd4dc;
                        border-radius: 8px;
                        color: #6b7280;
                        font-family: "Inter", sans-serif;
                        font-size: 16px;
                        font-weight: 600;
                        padding: 8px 16px;
                        transition: all 0.2s ease;
                    }

                    .btn-back-cart:hover,
                    .btn-back-cart:focus {
                        background: #749b3f;
                        border-color: #749b3f;
                        color: #ffffff;
                        box-shadow: none;
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


                <div class="container" style="margin-top: 100px;">
                    <div class="row ">
                        <div class="col-12 mt-5">
                            <div class="alert alert-${alertType}" role="alert">
                                ${message}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-center align-items-center">
                    <a href="/cart" class="btn btn-back-cart">Quay về giỏ hàng</a>

                </div>



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
