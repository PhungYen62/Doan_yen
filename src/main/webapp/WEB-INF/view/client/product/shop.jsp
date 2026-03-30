<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Sản phẩm</title>
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
                <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="css/style.css" rel="stylesheet">
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
                    <h1 class="text-center text-white display-6">Shop</h1>
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active text-white">Shop</li>
                    </ol>
                </div>
                <!-- Single Page Header End -->


                <!-- Fruits Shop Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <h1 class="mb-4">FarmFresh Shop</h1>
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <div class="col-xl-3">
                                        <div class="input-group w-100 mx-auto d-flex">
                                            <input type="search" class="form-control p-3" placeholder="Nhập từ khóa"
                                                id="searchName" aria-describedby="search-icon-1">
                                            <button id="btnFilterFirst" class="input-group-text p-3">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-6"></div>

                                </div>
                                <div class="row g-4 mt-2">
                                    <div class="col-lg-3">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <div class="mb-2"><b>Danh mục</b></div>
                                                    <c:forEach var="category" items="${categories}">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input category-checkbox"
                                                                type="checkbox" id="category-${category.id}"
                                                                value="${category.id}">
                                                            <label class="form-check-label"
                                                                for="factory-1">${category.name}</label>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <div class="mb-2"><b>Giá</b></div>
                                                    <input type="range" class="form-range w-100" id="rangeInput"
                                                        name="rangeInput" min="0" max="300000" value="0"
                                                        oninput="amount.value=rangeInput.value">

                                                    <span class="text-muted">0đ - </span>
                                                    <output id="amount" name="amount" min-velue="0" max-value="300000"
                                                        for="rangeInput">0đ</output>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-2"><b>Sắp xếp</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input sort-radio" type="radio" id="sort-1"
                                                        value="gia-tang-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input sort-radio" type="radio" id="sort-2"
                                                        value="gia-giam-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input sort-radio" type="radio" id="sort-3"
                                                        value="gia-nothing" name="radio-sort" checked>
                                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                                    id="btnFilter">
                                                    Lọc Sản Phẩm
                                                </button>
                                            </div>
                                            <div class="col-lg-12">
                                                <h4 class="mb-3">Sản phẩm giảm giá</h4>
                                                <c:forEach var="product" items="${topDiscountedProducts}">
                                                    <div class="d-flex align-items-center justify-content-start">
                                                        <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                            <a href="/product/${product.id}">
                                                                <img src="/products/${product.firstImage}"
                                                                    class="img-fluid rounded" alt="">
                                                            </a>
                                                        </div>
                                                        <div>
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
                                                                <h5 class="fw-bold me-2 fs-6">
                                                                    <fmt:formatNumber value="${product.salePrice}"
                                                                        type="number" maxFractionDigits="2" />đ/kg
                                                                </h5>
                                                            </div>
                                                            <div class="d-flex mb-2">
                                                                <h5
                                                                    class="text-danger text-decoration-line-through fs-6">
                                                                    <fmt:formatNumber value="${product.price}"
                                                                        type="number" maxFractionDigits="2" />đ/kg
                                                                </h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="row g-4 justify-content-center" id="productList">
                                            <c:choose>
                                                <c:when test="${empty products}">
                                                    <div class="col-12 text-center py-5">
                                                        <p class="fs-4">Không tìm thấy sản phẩm phù hợp.</p>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="product" items="${products}">
                                                        <div class="col-md-6 col-lg-6 col-xl-4">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <a href="/product/${product.id}">
                                                                        <img src="/products/${product.firstImage}"
                                                                            class="img-fluid w-100 rounded-top" alt="">
                                                                    </a>
                                                                </div>

                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <a href="/product/${product.id}">
                                                                        <h4>${product.name}</h4>
                                                                    </a>
                                                                    <p>${product.shortDesc}</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <div
                                                                            class="d-flex justify-content-between align-items-center flex-wrap">
                                                                            <c:choose>
                                                                                <c:when
                                                                                    test="${product.salePrice != 0 && product.salePrice < product.price}">
                                                                                    <p
                                                                                        class="text-danger fs-5 fw-bold mb-0">

                                                                                        <fmt:formatNumber
                                                                                            value="${product.salePrice}"
                                                                                            type="number"
                                                                                            maxFractionDigits="2" />đ/kg
                                                                                        <span
                                                                                            class="text-muted ms-2 fs-6"
                                                                                            style="text-decoration: line-through;">
                                                                                            <fmt:formatNumber
                                                                                                value="${product.price}"
                                                                                                type="number"
                                                                                                maxFractionDigits="2" />
                                                                                            đ/kg
                                                                                        </span>
                                                                                    </p>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <p
                                                                                        class="text-dark fs-5 fw-bold mb-0">

                                                                                        <fmt:formatNumber
                                                                                            value="${product.price}"
                                                                                            type="number"
                                                                                            maxFractionDigits="2" /> /
                                                                                        kg
                                                                                    </p>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </div>
                                                                        <form
                                                                            action="/add-product-to-cart/${product.id}"
                                                                            method="post">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />

                                                                            <button
                                                                                class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                    class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                                Thêm vào giỏ hàng
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="col-12">
                                                        <div class="pagination d-flex justify-content-center mt-5">
                                                            <c:if test="${currentPage > 1}">
                                                                <li class="page-item">
                                                                    <a href="?page=${currentPage - 1}" class="rounded">
                                                                        <span aria-hidden="true">&laquo;</span>
                                                                    </a>
                                                                </li>

                                                            </c:if>
                                                            <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                                                <li class="page-item">
                                                                    <a class="${(loop.index + 1) eq currentPage ? 'active rounded' : 'rounded'}"
                                                                        href="/product?page=${loop.index + 1}">${loop.index
                                                                        + 1}
                                                                    </a>
                                                                </li>

                                                            </c:forEach>

                                                            <c:if test="${currentPage < totalPages}">
                                                                <li class="page-item">
                                                                    <a href="?page=${currentPage + 1}" class="rounded">
                                                                        <span aria-hidden="true">&raquo;</span>
                                                                    </a>
                                                                </li>
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->




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

                <script>
                    function loadProducts(page = 1) {
                        const sort = document.getElementById('sortSelect').value;

                        fetch(`/products/ajax?sort=${sort}&page=${page}`)
                            .then(res => res.text())
                            .then(html => {
                                document.getElementById('productList').innerHTML = html;
                            })
                            .catch(err => console.error("Lỗi khi tải sản phẩm:", err));
                    }

                    // Lắng nghe click trên phân trang (gắn vào <a data-page="...">)
                    document.addEventListener('click', function (e) {
                        if (e.target.matches('.pagination a')) {
                            e.preventDefault();
                            const page = e.target.dataset.page;
                            if (page) {
                                loadProducts(page);
                            }
                        }
                    });
                </script>


            </body>

            </html>