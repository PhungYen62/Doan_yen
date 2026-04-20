<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <form class="d-none d-md-flex ms-4">
                <input class="form-control border-0" type="search" placeholder="Tìm kiếm">
            </form>
            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link position-relative" data-bs-toggle="dropdown">
                        <i class="fa fa-bell me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Thông báo</span>
                    </a>
                    <!-- Badge hiển thị số -->
                    <span
                        class="position-absolute fw-bold rounded-circle d-flex align-items-center justify-content-center text-danger px-1"
                        style="top: 10px; left: 50px; height: 20px; min-width: 20px;">
                        ${sessionScope.sumOrder}
                    </span>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="/avatar/${sessionScope.avatar}" alt=""
                            style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">
                            <c:out value="${sessionScope.fullName}" />
                        </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <form method="post" action="/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button class="dropdown-item">Đăng xuất</button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
