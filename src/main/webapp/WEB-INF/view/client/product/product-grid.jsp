<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div id="shopProductGrid">
    <section class="card2" style="display: grid; grid-template-columns: repeat(4, 282px); gap: 24px 24px; width: 1200px; margin: 24px auto 16px auto;">
        <c:forEach var="product" items="${products}" varStatus="loop">
            <c:if test="${loop.index < 21}">
                <div class="product-cadt js-product-card" role="link" tabindex="0" data-href="/product/${product.id}"
                    aria-label="Xem chi tiết ${product.name}"
                    style="width: 282px; height: 343px; display: flex; flex-direction: column;">
                    <div class="product-img-container bg-icon" style="width: 258px; height: 200px; margin: 0 auto;">
                        <c:if test="${not empty product.firstImage}">
                            <img src="/products/${product.firstImage}" alt="${product.name}"
                                onerror="this.src='https://via.placeholder.com/258x200/e0e0e0/999?text=${product.name}'"
                                style="width: 100%; height: 100%; object-fit: cover;">
                        </c:if>
                        <c:if test="${empty product.firstImage}">
                            <img src="https://via.placeholder.com/258x200/e0e0e0/999?text=${product.name}" alt="${product.name}"
                                style="width: 100%; height: 100%; object-fit: cover;">
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
                <c:url var="prevPageUrl" value="/product">
                    <c:param name="page" value="${currentPage - 1}" />
                    <c:if test="${not empty selectedCategory}">
                        <c:param name="category" value="${selectedCategory}" />
                    </c:if>
                    <c:if test="${not empty selectedSort}">
                        <c:param name="sort" value="${selectedSort}" />
                    </c:if>
                    <c:if test="${not empty selectedProvinceId}">
                        <c:param name="province" value="${selectedProvinceId}" />
                    </c:if>
                    <c:if test="${not empty selectedName}">
                        <c:param name="name" value="${selectedName}" />
                    </c:if>
                    <c:if test="${not empty selectedMinPrice}">
                        <c:param name="minPrice" value="${selectedMinPrice}" />
                    </c:if>
                    <c:if test="${not empty selectedMaxPrice}">
                        <c:param name="maxPrice" value="${selectedMaxPrice}" />
                    </c:if>
                </c:url>
                <a href="${prevPageUrl}" class="shop-pagination-link" style="width: 32px; height: 32px; border: 1px solid #d9d9d9; display: flex; align-items: center; justify-content: center; border-radius: 4px; text-decoration: none; color: #212337; font-size: 14px;">
                    &laquo;
                </a>
            </c:if>

            <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                <c:url var="pageUrl" value="/product">
                    <c:param name="page" value="${loop.index + 1}" />
                    <c:if test="${not empty selectedCategory}">
                        <c:param name="category" value="${selectedCategory}" />
                    </c:if>
                    <c:if test="${not empty selectedSort}">
                        <c:param name="sort" value="${selectedSort}" />
                    </c:if>
                    <c:if test="${not empty selectedProvinceId}">
                        <c:param name="province" value="${selectedProvinceId}" />
                    </c:if>
                    <c:if test="${not empty selectedName}">
                        <c:param name="name" value="${selectedName}" />
                    </c:if>
                    <c:if test="${not empty selectedMinPrice}">
                        <c:param name="minPrice" value="${selectedMinPrice}" />
                    </c:if>
                    <c:if test="${not empty selectedMaxPrice}">
                        <c:param name="maxPrice" value="${selectedMaxPrice}" />
                    </c:if>
                </c:url>

                <c:choose>
                    <c:when test="${(loop.index + 1) == currentPage}">
                        <button style="width: 32px; height: 32px; background-color: #ff6a1a; border: 1px solid #ff6a1a; color: white; border-radius: 4px; font-weight: 600; cursor: default; font-size: 14px; padding: 0; display: flex; align-items: center; justify-content: center;">
                            ${loop.index + 1}
                        </button>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}" class="shop-pagination-link" style="width: 32px; height: 32px; border: 1px solid #d9d9d9; display: flex; align-items: center; justify-content: center; border-radius: 4px; text-decoration: none; color: #212337; font-size: 14px;">
                            ${loop.index + 1}
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <c:url var="nextPageUrl" value="/product">
                    <c:param name="page" value="${currentPage + 1}" />
                    <c:if test="${not empty selectedCategory}">
                        <c:param name="category" value="${selectedCategory}" />
                    </c:if>
                    <c:if test="${not empty selectedSort}">
                        <c:param name="sort" value="${selectedSort}" />
                    </c:if>
                    <c:if test="${not empty selectedProvinceId}">
                        <c:param name="province" value="${selectedProvinceId}" />
                    </c:if>
                    <c:if test="${not empty selectedName}">
                        <c:param name="name" value="${selectedName}" />
                    </c:if>
                    <c:if test="${not empty selectedMinPrice}">
                        <c:param name="minPrice" value="${selectedMinPrice}" />
                    </c:if>
                    <c:if test="${not empty selectedMaxPrice}">
                        <c:param name="maxPrice" value="${selectedMaxPrice}" />
                    </c:if>
                </c:url>
                <a href="${nextPageUrl}" class="shop-pagination-link" style="width: 32px; height: 32px; border: 1px solid #d9d9d9; display: flex; align-items: center; justify-content: center; border-radius: 4px; text-decoration: none; color: #212337; font-size: 14px;">
                    &raquo;
                </a>
            </c:if>
        </div>
    </c:if>
</div>
