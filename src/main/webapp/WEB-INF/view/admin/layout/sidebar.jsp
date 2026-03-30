<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="/admin" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary">ADMIN</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="/avatar/${sessionScope.avatar}" alt=""
                            style="width: 40px; height: 40px;">
                        <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                        </div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">
                            <c:out value="${sessionScope.fullName}" />
                        </h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="/admin" class="nav-item nav-link ${activePage == 'home' ? 'active' : ''}"><i
                            class="fa fa-tachometer-alt me-2"></i>Thống kê</a>
                    <a href="/admin/user" class="nav-item nav-link ${activePage == 'user' ? 'active' : ''}"><i
                            class="fa fa-users me-2"></i>Người sử dụng</a>
                    <a href="/admin/categories" class="nav-item nav-link ${activePage == 'category' ? 'active' : ''}"><i
                            class="fa fa-list me-2"></i>Danh mục</a>
                    <a href="/admin/product" class="nav-item nav-link ${activePage == 'product' ? 'active' : ''}"><i
                            class="fa fa-cube me-2"></i>Sản
                        phẩm</a>
                    <a href="/admin/order" class="nav-item nav-link ${activePage == 'order' ? 'active' : ''}"><i
                            class="fa fa-shopping-cart me-2"></i>Đơn đặt
                        hàng</a>
                    <a href="/admin/contact" class="nav-item nav-link ${activePage == 'contact' ? 'active' : ''}"><i
                            class="fa fa-comment-dots me-2"></i>Phản
                        hồi</a>

                </div>
            </nav>
        </div>