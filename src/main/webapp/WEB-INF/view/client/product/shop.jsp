<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <title>Sản phẩm - Fresh Food</title>
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Rubik:wght@500&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/global.css" />
    <link rel="stylesheet" href="css/index.css" />
    
    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <style>
        /* Keep the fixed header above all page content (shop page only) */
        .header-top { z-index: 3000 !important; }
        .header-nav { z-index: 2999 !important; }

        /* Avoid stacking-context issues that can block header overlay */
        .shop { isolation: auto !important; }

        /* Shop page fix: remove forced tall container that creates huge whitespace */
        .frame-div { min-height: auto !important; }

        /* Shop page fix: footer adds a big top margin by default */
        body .footer-main { margin-top: 16px !important; }
    </style>
</head>

<body style="font-family: 'Inter', sans-serif;">

    <!-- Spinner Start -->
    <div id="spinner"
        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <div class="shop" style="gap: 0; justify-content: flex-start; align-items: stretch;">
        <!-- Navbar start -->
        <jsp:include page="../layout/header.jsp" />
        <!-- Navbar End -->

        <main class="shop-inner">
            <div class="frame-group" style="gap: 0;">
                <div class="frame-container" style="gap: 0;">
                    <div class="text-description-wrapper" style="background-image: url('/resources/images/content/Bgcontent.png'); background-size: cover; background-position: center; background-repeat: no-repeat; aspect-ratio: 1445 / 199; min-height: 199px; display: flex; align-items: center; justify-content: center; padding: 0 20px; margin: 0; margin-top: 0; width: 100vw; margin-left: calc(-50vw + 50%);">
                        <div class="text-description" style="text-align: center; transform: translateY(45px);">
                            <h2 class="page-title" style="color: #212337; font-size: 48px; font-weight: 700; margin-bottom: 8px;">Cửa hàng</h2>
                            <div class="breadcrumb" style="color: #212337; font-size: 16px; letter-spacing: 0.5px;">
                                <span>Trang chủ</span>
                                <span class="ca-hng2" style="color: #ff6a1a;"> / Cửa hàng</span>
                            </div>
                        </div>
                    </div>
                    <div class="frame-div" style="display: flex; justify-content: center; width: 100%; padding: 24px 20px 16px 20px; margin: 0;">
                        <div style="width: 100%; max-width: 1200px; padding: 0;">
                            <section class="our-products" style="width: 100%; max-width: 100%; margin: 0; padding: 0; margin-top: 0px;">
                                <div class="text-description2" style="width: 100%; margin: 0; display: flex; flex-direction: column; gap: 8px; padding: 0;">
                                    <div class="caption" style="margin: 0; padding: 0;">
                                        <h3 class="section-title" style="font-size: 14px; color: #749b3f; font-weight: 600; margin: 0 !important; background-color: #e8f3d6; padding: 4px 12px; display: inline-block; border-radius: 4px;">Sản phẩm của chúng tôi</h3>
                                    </div>
                                    <div class="text-description3" style="display: flex; flex-direction: column; align-items: flex-start !important; gap: 4px; margin: 0; padding: 0;">
                                        <h2 class="page-title" style="margin: 0 !important; margin-left: 0 !important; padding: 0 !important; padding-left: 0 !important; font-size: 32px; color: #212337; font-weight: 700; text-align: left;">
                                            Đặc sản vùng miền của chúng tôi
                                        </h2>
                                        <div class="section-description" style="font-size: 14px; color: #666; line-height: 1.5; text-align: left; margin: 0; padding: 0;">
                                            Chúng tôi tự hào cung cấp nhiều loại trái cây, rau củ và nguyên liệu làm salad tươi ngon nhất.
                                        </div>
                                    </div>
                                </div>
                                <div class="categories-parent" style="align-self: stretch; width: 100%; max-width: 1200px; display: flex; justify-content: space-between; align-items: center; gap: 20px; margin-top: 20px; flex-wrap: nowrap;">
                                    <div class="categories" style="display: flex; gap: 12px; flex-wrap: nowrap; align-items: center; white-space: nowrap; flex: 1;">
                                        <button class="button3" style="min-width: 120px; height: 48px; justify-content: center; align-items: center;">
                                            <div class="c-sn-min">Tất cả</div>
                                        </button>
                                        <c:forEach var="category" items="${categories}">
                                            <button class="button3" style="min-width: 120px; height: 48px; justify-content: center; align-items: center;">
                                                <div class="c-sn-min">${category.name}</div>
                                            </button>
                                        </c:forEach>
                                    </div>
                                    <div style="display: flex; gap: 24px; align-items: center; flex-wrap: nowrap; justify-content: flex-end; flex-shrink: 0;">
                                        <div class="sort-by" style="display: flex; flex-direction: row; gap: 12px; align-items: center; cursor: pointer; flex-wrap: nowrap; white-space: nowrap; position: relative;">
                                            <span style="font-size: 14px; color: #666; font-weight: 500; font-family: 'Inter', sans-serif;">Nơi bán:</span>
                                            <div class="location-dropdown" style="display: flex; gap: 6px; align-items: center; border: 1px solid #e5e7eb; border-radius: 4px; padding: 6px 12px; background-color: #f9fafb; flex-shrink: 0; cursor: pointer;" onclick="toggleDropdown(event, 'location-menu')">
                                                <span style="font-size: 12px; color: #666;">▼</span>
                                                <span style="font-size: 14px; color: #666; font-family: 'Inter', sans-serif;">Hà Nội</span>
                                            </div>
                                            <div id="location-menu" style="position: absolute; top: 100%; left: 60px; background: white; border: 1px solid #e5e7eb; border-radius: 4px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); display: none; z-index: 10; min-width: 150px;">
                                                <div style="padding: 8px 0;">
                                                    <div onclick="selectLocation(this, 'location-dropdown')" style="padding: 8px 12px; cursor: pointer; font-size: 14px; color: #333; font-family: 'Inter', sans-serif;" onmouseover="this.style.backgroundColor='#f0f0f0'" onmouseout="this.style.backgroundColor='transparent'">Hà Nội</div>
                                                    <div onclick="selectLocation(this, 'location-dropdown')" style="padding: 8px 12px; cursor: pointer; font-size: 14px; color: #333; font-family: 'Inter', sans-serif;" onmouseover="this.style.backgroundColor='#f0f0f0'" onmouseout="this.style.backgroundColor='transparent'">Hồ Chí Minh</div>
                                                    <div onclick="selectLocation(this, 'location-dropdown')" style="padding: 8px 12px; cursor: pointer; font-size: 14px; color: #333; font-family: 'Inter', sans-serif;" onmouseover="this.style.backgroundColor='#f0f0f0'" onmouseout="this.style.backgroundColor='transparent'">Đà Nẵng</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="sort-by3" style="display: flex; flex-direction: row; gap: 12px; align-items: center; cursor: pointer; flex-wrap: nowrap; white-space: nowrap; position: relative;">
                                            <span style="font-size: 14px; color: #666; font-weight: 500; font-family: 'Inter', sans-serif;">Sắp xếp theo:</span>
                                            <div class="sort-dropdown" style="display: flex; gap: 6px; align-items: center; border: 1px solid #e5e7eb; border-radius: 4px; padding: 6px 12px; background-color: #f9fafb; flex-shrink: 0; cursor: pointer;" onclick="toggleDropdown(event, 'sort-menu')">
                                                <span style="font-size: 12px; color: #666;">▼</span>
                                                <span style="font-size: 14px; color: #666; font-family: 'Inter', sans-serif;">Phổ biến</span>
                                            </div>
                                            <div id="sort-menu" style="position: absolute; top: 100%; right: 0; background: white; border: 1px solid #e5e7eb; border-radius: 4px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); display: none; z-index: 10; min-width: 150px;">
                                                <div style="padding: 8px 0;">
                                                    <div onclick="selectSort(this, 'sort-dropdown')" style="padding: 8px 12px; cursor: pointer; font-size: 14px; color: #333; font-family: 'Inter', sans-serif;" onmouseover="this.style.backgroundColor='#f0f0f0'" onmouseout="this.style.backgroundColor='transparent'">Phổ biến</div>
                                                    <div onclick="selectSort(this, 'sort-dropdown')" style="padding: 8px 12px; cursor: pointer; font-size: 14px; color: #333; font-family: 'Inter', sans-serif;" onmouseover="this.style.backgroundColor='#f0f0f0'" onmouseout="this.style.backgroundColor='transparent'">Mới nhất</div>
                                                    <div onclick="selectSort(this, 'sort-dropdown')" style="padding: 8px 12px; cursor: pointer; font-size: 14px; color: #333; font-family: 'Inter', sans-serif;" onmouseover="this.style.backgroundColor='#f0f0f0'" onmouseout="this.style.backgroundColor='transparent'">Giá thấp tới cao</div>
                                                    <div onclick="selectSort(this, 'sort-dropdown')" style="padding: 8px 12px; cursor: pointer; font-size: 14px; color: #333; font-family: 'Inter', sans-serif;" onmouseover="this.style.backgroundColor='#f0f0f0'" onmouseout="this.style.backgroundColor='transparent'">Giá cao tới thấp</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                                <section class="card2" style="display: grid; grid-template-columns: repeat(4, 282px); gap: 24px 24px; width: 1200px; margin: 16px auto 16px auto;">
                                    <c:forEach var="product" items="${products}" varStatus="loop">
                                        <c:if test="${loop.index < 21}">
                                        <div class="product-cadt" style="width: 282px; height: 343px; display: flex; flex-direction: column;">
                                            <div class="product-img-container bg-icon" style="width: 258px; height: 200px; margin: 0 auto;">
                                                <c:if test="${not empty product.firstImage}">
                                                    <img src="/products/${product.firstImage}" alt="${product.name}" onerror="this.src='https://via.placeholder.com/258x200/e0e0e0/999?text=${product.name}'" style="width: 100%; height: 100%; object-fit: cover;">
                                                </c:if>
                                                <c:if test="${empty product.firstImage}">
                                                    <img src="https://via.placeholder.com/258x200/e0e0e0/999?text=${product.name}" alt="${product.name}" style="width: 100%; height: 100%; object-fit: cover;">
                                                </c:if>
                                            </div>
                                            <div class="bnh-phu-th-h-ni-gi-500g-parent" style="flex: 1; display: flex; flex-direction: column; padding: 8px; width: 100%; box-sizing: border-box;">
                                                <b class="bnh-phu-th" style="flex-shrink: 0; margin-bottom: 6px;">${product.name}</b>
                                                <c:choose>
                                                    <c:when test="${product.salePrice != 0 && product.salePrice < product.price}">
                                                        <div style="display: flex; align-items: center; gap: 8px; justify-content: center; margin-bottom: 8px; flex-shrink: 0;">
                                                            <span style="font-size: 16px; font-weight: 600; color: #ff6a1a;">
                                                                <fmt:formatNumber value="${product.salePrice}" type="number" maxFractionDigits="0" />đ
                                                            </span>
                                                            <span style="font-size: 13px; color: #999; text-decoration: line-through;">
                                                                <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0" />đ
                                                            </span>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div style="font-size: 16px; font-weight: 600; color: #ff6a1a; margin-bottom: 8px; flex-shrink: 0;">
                                                            <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0" />đ
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <form action="/add-product-to-cart/${product.id}" method="post" style="margin-top: auto; width: 258px; margin-left: 8px; margin-right: 8px;">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                                    <button type="submit" class="button7" onmouseover="this.style.backgroundColor='#ff6a1a'; this.style.color='white';" onmouseout="this.style.backgroundColor='white'; this.style.color='#1f2937';" style="background-color: white; color: #1f2937; border: 1px solid #e5e7eb; padding: 10px 16px; border-radius: 6px; font-size: 14px; font-weight: 600; cursor: pointer; transition: all 0.3s ease; width: 100%;">
                                                        <span>Thêm vào giỏ hàng</span>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        </c:if>
                                    </c:forEach>
                                </section>
                                <c:if test="${!empty products}">
                                    <div style="display: flex; justify-content: center; margin-top: 12px; margin-bottom: 0; gap: 6px;">
                                        <c:if test="${currentPage > 1}">
                                            <a href="/product?page=${currentPage - 1}" style="width: 32px; height: 32px; border: 1px solid #d9d9d9; display: flex; align-items: center; justify-content: center; border-radius: 4px; text-decoration: none; color: #212337; font-size: 14px;">
                                                &laquo;
                                            </a>
                                        </c:if>
                                        <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${(loop.index + 1) == currentPage}">
                                                    <button style="width: 32px; height: 32px; background-color: #ff6a1a; border: 1px solid #ff6a1a; color: white; border-radius: 4px; font-weight: 600; cursor: default; font-size: 14px; padding: 0; display: flex; align-items: center; justify-content: center;">
                                                        ${loop.index + 1}
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/product?page=${loop.index + 1}" style="width: 32px; height: 32px; border: 1px solid #d9d9d9; display: flex; align-items: center; justify-content: center; border-radius: 4px; text-decoration: none; color: #212337; font-size: 14px;">
                                                        ${loop.index + 1}
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${currentPage < totalPages}">
                                            <a href="/product?page=${currentPage + 1}" style="width: 32px; height: 32px; border: 1px solid #d9d9d9; display: flex; align-items: center; justify-content: center; border-radius: 4px; text-decoration: none; color: #212337; font-size: 14px;">
                                                &raquo;
                                            </a>
                                        </c:if>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Flash Sale Section -->
        <section class="homepage-inner" style="min-height: auto; padding-bottom: 0;">
            <div class="special-offer-wrapper" style="background-image: url('/resources/images/content/FooterSection.png'); background-size: 100% auto; background-position: center top; background-repeat: no-repeat; background-attachment: scroll; padding: 50px 10px 16px 180px;">
                <div class="special-offer">
                    <section class="special-offer2">
                        <div class="text-description5">
                            <div class="text-description6">
                                <div class="text-description7">
                                    <div class="caption2" style="background-color: rgba(116, 155, 63, 0.3);">
                                        <h3 class="u-i-c" style="color: #749b3f;">Ưu đãi đặc biệt</h3>
                                    </div>
                                </div>
                                <h1 class="flash-sale2" style="color: #1f2937;">Flash Sale</h1>
                            </div>
                            <h2 class="gim-gi-ln-container" style="color: #1f2937;">
                                <span>Giảm giá lên tới </span>
                                <span class="off" style="color: #ff7a3d; font-weight: bold;">80% OFF</span>
                            </h2>
                        </div>
                        <div class="countdown" style="color: #212337; align-items: flex-start; gap: 24px; margin-bottom: 16px;">
                            <div class="countdown2" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                <h2 class="countdown-delimiters" style="position: static; margin: 0;">03</h2>
                                <div class="ngy-wrapper" style="padding: 0; justify-content: center;"><div class="ngy" style="position: static;">Ngày</div></div>
                            </div>
                            <div class="countdown3" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                <h2 class="h2" style="position: static; margin: 0;">18</h2>
                                <div class="gi-wrapper" style="padding: 0; justify-content: center;"><div class="gi" style="position: static;">Giờ</div></div>
                            </div>
                            <div class="countdown2" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                <h2 class="countdown-delimiters" style="position: static; margin: 0;">54</h2>
                                <div class="pht-wrapper" style="padding: 0; justify-content: center;"><div class="pht" style="position: static;">Phút</div></div>
                            </div>
                            <div class="countdown3" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                <h2 class="h2" style="position: static; margin: 0;">21</h2>
                                <div class="ngy-wrapper" style="padding: 0; justify-content: center;"><div class="ma" style="position: static;">Mùa</div></div>
                            </div>
                        </div>
                    </section>
                    <button class="button16" style="background-color: #176d38; margin-top: 8px;">
                        <b class="code-fruit28-container">
                            <span class="code">CODE : </span>
                            <span class="fruit28" style="color: #ffeb3b; font-weight: bold;">FRUIT28</span>
                        </b>
                    </button>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="../layout/footer.jsp" />
    </div>

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
        function toggleDropdown(event, menuId) {
            event.stopPropagation();
            const menu = document.getElementById(menuId);
            menu.style.display = menu.style.display === 'none' ? 'block' : 'none';
        }
        
        function selectLocation(element, dropdownId) {
            const value = element.textContent;
            const dropdown = document.querySelector('.' + dropdownId);
            dropdown.querySelector('span:last-child').textContent = value;
            document.getElementById('location-menu').style.display = 'none';
        }
        
        function selectSort(element, dropdownId) {
            const value = element.textContent;
            const dropdown = document.querySelector('.' + dropdownId);
            dropdown.querySelector('span:last-child').textContent = value;
            document.getElementById('sort-menu').style.display = 'none';
        }
        
        document.addEventListener('click', function() {
            document.getElementById('location-menu').style.display = 'none';
            document.getElementById('sort-menu').style.display = 'none';
        });
        
        document.querySelector('.location-dropdown')?.addEventListener('click', function(e) { e.stopPropagation(); });
        document.querySelector('.sort-dropdown')?.addEventListener('click', function(e) { e.stopPropagation(); });
    </script>

</body>

</html>