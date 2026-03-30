<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                                        <img src="/products/${product.firstImage}" class="img-fluid w-100 rounded-top"
                                            alt="">
                                    </a>
                                </div>

                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                    <a href="/product/${product.id}">
                                        <h4>${product.name}</h4>
                                    </a>
                                    <p>${product.shortDesc}</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <div class="d-flex justify-content-between align-items-center flex-wrap">
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
                                        </div>
                                        <form action="/add-product-to-cart/${product.id}" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

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
                                <a href="?page=${currentPage - 1}" class="rounded">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </c:if>
                            <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">

                                <a class="${(loop.index + 1) eq currentPage ? 'active rounded' : 'rounded'}"
                                    href="/product?page=${loop.index + 1}">${loop.index
                                    + 1}
                                </a>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <a href="?page=${currentPage + 1}" class="rounded">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </c:if>

                        </div>
                    </div>
                </c:otherwise>
            </c:choose>