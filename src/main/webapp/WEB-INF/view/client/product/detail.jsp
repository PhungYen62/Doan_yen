<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Sản phẩm chi tiết</title>
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
                    <h1 class="text-center text-white display-6">Product Detail</h1>
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active text-white">Product Detail</li>
                    </ol>
                </div>
                <!-- Single Page Header End -->


                <!-- Single Product Start -->
                <div class="container-fluid py-5 mt-5">
                    <div class="container py-5">
                        <div class="row g-4 mb-5">
                            <div class="col-lg-8 col-xl-9">
                                <div class="row g-4">
                                    <div class="col-lg-6">
                                        <div class="border rounded">
                                            <a href="#">
                                                <img src="/products/${product.firstImage}" class="img-fluid rounded"
                                                    alt="Image">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4 class="fw-bold mb-3">${product.name}</h4>
                                        <p class="mb-3">Danh Mục:
                                            <c:forEach var="category" items="${product.categories}" varStatus="status">
                                                ${category.name}<c:if test="${!status.last}">, </c:if>
                                            </c:forEach>
                                        </p>
                                        <c:choose>
                                            <c:when
                                                test="${product.salePrice != 0 && product.salePrice < product.price}">
                                                <p class="text-danger fs-5 fw-bold mb-0">

                                                    <fmt:formatNumber value="${product.salePrice}" type="number"
                                                        maxFractionDigits="2" />đ/kg
                                                    <span class="text-muted ms-2 fs-6"
                                                        style="text-decoration: line-through;">
                                                        <fmt:formatNumber value="${product.price}" type="number"
                                                            maxFractionDigits="2" />
                                                        đ/kg
                                                    </span>
                                                </p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-dark fs-5 fw-bold mb-0">

                                                    <fmt:formatNumber value="${product.price}" type="number"
                                                        maxFractionDigits="2" /> /
                                                    kg
                                                </p>
                                            </c:otherwise>
                                        </c:choose>

                                        <div class="d-flex mb-4">
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star"></i>
                                        </div>

                                        <form action="/add-product-to-cart/${product.id}" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                            <div class="input-group quantity mb-5" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button type="button"
                                                        class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" name="quantity"
                                                    class="form-control form-control-sm text-center border-0" value="1">
                                                <div class="input-group-btn">
                                                    <button type="button"
                                                        class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <button type="submit"
                                                class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ
                                                hàng</button>
                                        </form>


                                    </div>
                                    <div class="col-lg-12">
                                        <nav>
                                            <div class="nav nav-tabs mb-3">
                                                <button class="nav-link active border-white border-bottom-0"
                                                    type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                    data-bs-target="#nav-about" aria-controls="nav-about"
                                                    aria-selected="true">Mô tả</button>
                                                <button class="nav-link border-white border-bottom-0" type="button"
                                                    role="tab" id="nav-mission-tab" data-bs-toggle="tab"
                                                    data-bs-target="#nav-mission" aria-controls="nav-mission"
                                                    aria-selected="false">Đánh giá</button>
                                            </div>
                                        </nav>
                                        <div class="tab-content mb-5">
                                            <div class="tab-pane active" id="nav-about" role="tabpanel"
                                                aria-labelledby="nav-about-tab">
                                                <p>${product.detailDesc}</p>

                                            </div>
                                            <div class="tab-pane" id="nav-mission" role="tabpanel"
                                                aria-labelledby="nav-mission-tab">

                                            </div>
                                            <div class="tab-pane" id="nav-vision" role="tabpanel">
                                                <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam
                                                    ipsum et
                                                    tempor sit. Aliqu diam
                                                    amet diam et eos labore. 3</p>
                                                <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet
                                                    diam et eos
                                                    labore.
                                                    Clita erat ipsum et lorem et sit</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <form action="#">
                                        <h4 class="mb-5 fw-bold">Leave a Reply</h4>
                                        <div class="row g-4">
                                            <div class="col-lg-6">
                                                <div class="border-bottom rounded">
                                                    <input type="text" class="form-control border-0 me-4"
                                                        placeholder="Yur Name *">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="border-bottom rounded">
                                                    <input type="email" class="form-control border-0"
                                                        placeholder="Your Email *">
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="border-bottom rounded my-4">
                                                    <textarea name="" id="" class="form-control border-0" cols="30"
                                                        rows="8" placeholder="Your Review *"
                                                        spellcheck="false"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="d-flex justify-content-between py-3 mb-5">
                                                    <div class="d-flex align-items-center">
                                                        <p class="mb-0 me-3">Please rate:</p>
                                                        <div class="d-flex align-items-center" style="font-size: 12px;">
                                                            <i class="fa fa-star text-muted"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <a href="#"
                                                        class="btn border border-secondary text-primary rounded-pill px-4 py-3">
                                                        Post Comment</a>
                                                </div>
                                            </div>
                                        </div>
                                    </form> -->
                                </div>
                            </div>
                            <div class="col-lg-4 col-xl-3">
                                <div class="row g-4 fruite">
                                    <div class="col-lg-12">
                                        <h4 class="mb-4">Các sản phẩm tương tự</h4>
                                        <c:forEach var="product" items="${relatedProducts}">
                                            <div class="d-flex align-items-center justify-content-start">
                                                <div class="rounded mr-1" style="width: 100px; height: 100px;">
                                                    <a href="/product/${product.id}">
                                                        <img src="/products/${product.firstImage}"
                                                            class="img-fluid rounded" alt="Image">
                                                    </a>
                                                </div>
                                                <div class="ml-2">
                                                    <a href="/product/${product.id}">
                                                        <h6 class="mb-2">${product.name}</h6>
                                                    </a>
                                                    <div class="d-flex mb-2">
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="d-flex mb-2">
                                                        <c:choose>
                                                            <c:when
                                                                test="${product.salePrice != 0 && product.salePrice < product.price}">
                                                                <p class="text-danger fs-5 fw-bold mb-0">

                                                                    <fmt:formatNumber value="${product.salePrice}"
                                                                        type="number" maxFractionDigits="2" />đ/kg
                                                                    <span class="text-muted ms-2 fs-6"
                                                                        style="text-decoration: line-through;">
                                                                        <fmt:formatNumber value="${product.price}"
                                                                            type="number" maxFractionDigits="2" />
                                                                        đ/kg
                                                                    </span>
                                                                </p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="text-dark fs-5 fw-bold mb-0">

                                                                    <fmt:formatNumber value="${product.price}"
                                                                        type="number" maxFractionDigits="2" /> đ/
                                                                    kg
                                                                </p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>


                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- <h1 class="fw-bold mb-0">Related products</h1>
                        <div class="vesitable">
                            <div class="owl-carousel vegetable-carousel justify-content-center">
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light"
                                            alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Banana</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Bell Papper</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Potatoes</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Potatoes</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; right: 10px;">Vegetable</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                            incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
                <!-- Single Product End -->


                <!-- Footer Start -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Footer End -->





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