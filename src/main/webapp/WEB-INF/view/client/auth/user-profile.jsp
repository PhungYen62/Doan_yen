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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <link href="/css/style.css" rel="stylesheet">
</head>

<body>

    <div id="spinner"
        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <jsp:include page="../layout/header.jsp" />
    <style>
        .profile-container {
            max-width: 1200px;
            margin: 0 auto;
            margin-top: 20px;
            margin-bottom: 40px;
            background: transparent;
            border-radius: 0;
            box-shadow: none;
            padding: 20px 0;
        }
        .profile-sidebar {
            background: #fff;
            border-radius: 10px;
            padding: 18px;
            min-width: 270px;
            max-width: 300px;
            height: 100%;
            box-shadow: none;
            border: 1px solid #e6f0dd;
        }
        .profile-sidebar .user-info {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 8px;
            padding: 6px 8px;
            background: transparent;
            position: relative;
        }
        .profile-sidebar .user-info::after {
            content: "";
            display: block;
            height: 1px;
            background: #e6e6e6;
            width: 100%;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: -10px;
            border-radius: 1px;
            opacity: 0.95;
        }
        .profile-sidebar .user-info .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #c7e2b1;
            flex-shrink: 0;
        }
        .profile-sidebar .user-info .user-name {
            font-weight: 600;
            color: #374029;
            margin-left: 6px;
            font-size: 16px;
        }
        .profile-sidebar .sidebar-section {
            margin-bottom: 18px;
        }
        .profile-sidebar .sidebar-section-title {
            font-size: 15px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            padding: 6px 8px;
        }
        .profile-sidebar .sidebar-link {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 12px;
            color: #333;
            border-radius: 6px;
            text-decoration: none;
            font-size: 15px;
            margin-bottom: 6px;
            transition: background 0.15s, color 0.15s;
        }
        .profile-sidebar .sidebar-link.active {
            background: transparent;
            color: #333;
            font-weight: 400;
            font-size: 15px;
        }
        .profile-sidebar .sidebar-link.active i {
            color: #333;
        }
        .profile-sidebar .sidebar-link:hover {
            background: #749b3f;
            color: #fff;
        }
        .profile-sidebar .sidebar-link:hover i,
        .profile-sidebar .sidebar-link:focus i,
        .profile-sidebar .sidebar-link.active:hover i {
            color: #fff;
        }
        .profile-main {
            padding: 0 40px;
            flex: 1;
        }
        .profile-avatar {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 18px;
            gap: 8px;
        }
        .profile-avatar img {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #c7e2b1;
            cursor: pointer;
        }
        .profile-avatar label {
            margin-top: 8px;
            font-size: 13px;
            color: #749b3f;
            cursor: pointer;
        }
        .profile-title {
            font-size: 32px;
            font-weight: 700;
            color: #3d4b2c;
            margin-bottom: 18px;
            text-align: left;
        }
        .profile-form label {
            font-weight: 500;
            color: #333;
        }
        .profile-form .form-control {
            border-radius: 6px;
            border: 1px solid #d1d5db;
            margin-bottom: 16px;
            background: #ffffff;
            padding: 10px 12px;
            color: #1f2937;
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
        }
        .profile-form .form-control:focus {
            border-color: #749b3f;
            box-shadow: none;
            outline: none;
        }
        .profile-form .btn {
            background: #749b3f;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 8px 28px;
            font-weight: 600;
        }
        .profile-form .btn:hover {
            background: #5f7f33;
        }
        .profile-main a:hover {
            color: #5f7f33;
        }
        .order-status-filter {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 14px;
        }
        .order-status-filter .status-filter-btn {
            background: #ffffff;
            border: 1px solid #cfd4dc;
            border-radius: 8px;
            color: #6b7280;
            font-family: "Inter", sans-serif;
            font-size: 14px;
            font-weight: 600;
            padding: 6px 14px;
            line-height: 1.25;
            transition: all 0.2s ease;
        }
        .order-status-filter .status-filter-btn:hover,
        .order-status-filter .status-filter-btn:focus {
            background: #749b3f;
            border-color: #749b3f;
            color: #ffffff;
            box-shadow: none;
        }
        .order-history-actions .order-action-btn,
        .order-history-actions .order-action-btn:link,
        .order-history-actions .order-action-btn:visited,
        .order-history-actions .order-action-btn:focus {
            display: inline-block;
            border-radius: 8px;
            font-family: "Inter", sans-serif;
            font-size: 12px;
            font-weight: 600;
            line-height: 1.25;
            padding: 6px 12px;
            background-color: #ffffff;
            border: 1px solid #ff7a2a;
            color: #ff7a2a;
            text-decoration: none;
            transition: all 0.2s ease;
        }
        .order-history-actions .order-action-btn:hover,
        .order-history-actions .order-action-btn:active {
            background-color: #ff7a2a;
            border-color: #ff7a2a;
            color: #ffffff;
            box-shadow: none;
        }
    </style>


    <div class="profile-container d-flex gap-4">
        <!-- Sidebar Navigation -->
        <div class="profile-sidebar nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <div class="user-info mb-4">
                <img class="user-avatar" src="/avatar/${user.avatar}" alt="Avatar" onerror="this.src='/resources/images/header/logo.png'" />
                <span class="user-name">${user.fullName}</span>
            </div>
            
            <div class="sidebar-section-title">Quản lý đơn hàng</div>
            <a class="nav-link sidebar-link mb-3" id="v-pills-orders-tab" data-bs-toggle="pill" data-bs-target="#v-pills-orders" type="button" role="tab" aria-controls="v-pills-orders" aria-selected="false" style="cursor: pointer;"><i class="fas fa-box"></i> Đơn hàng</a>
            
            <div class="sidebar-section-title">Quản lý tài khoản</div>
            <a class="nav-link sidebar-link active" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="true" style="cursor: pointer;"><i class="fas fa-user"></i> Tài khoản</a>
            <a class="nav-link sidebar-link" id="v-pills-vouchers-tab" data-bs-toggle="pill" data-bs-target="#v-pills-vouchers" type="button" role="tab" aria-controls="v-pills-vouchers" aria-selected="false" style="cursor: pointer;"><i class="fas fa-ticket-alt"></i> Voucher của tôi</a>
        </div>

        <!-- Main Content Area -->
        <div class="profile-main tab-content w-100" id="v-pills-tabContent">
            
            <!-- Profile Tab -->
            <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <div class="profile-title">Thông tin tài khoản</div>
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <div class="profile-avatar">
                    <img src="/avatar/${user.avatar}" alt="Avatar" onerror="this.src='https://via.placeholder.com/90x90?text=Avatar'" />
                    <label for="avatarFile" class="choose-avatar">Chọn ảnh đại diện</label>
                </div>
                <form:form modelAttribute="user" method="post" action="/user/update" enctype="multipart/form-data" class="profile-form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <form:input path="id" type="hidden" />
                    <form:input path="email" type="hidden" />
                    <div class="mb-2">
                        <label>Họ và tên:</label>
                        <form:input path="fullName" cssClass="form-control" />
                        <form:errors path="fullName" cssClass="text-danger" />
                    </div>
                    <div class="mb-2">
                        <label>Số điện thoại:</label>
                        <form:input path="phone" cssClass="form-control" />
                        <form:errors path="phone" cssClass="text-danger" />
                    </div>
                    <div class="mb-2">
                        <label>Tỉnh/Thành phố:</label>
                        <form:input path="province" cssClass="form-control" />
                    </div>
                    <div class="mb-2">
                        <label>Quận/Huyện:</label>
                        <form:input path="district" cssClass="form-control" />
                    </div>
                    <div class="mb-2">
                        <label>Phường/Xã:</label>
                        <form:input path="ward" cssClass="form-control" />
                    </div>
                    <div class="mb-2">
                        <label>Địa chỉ chi tiết:</label>
                        <form:input path="address_detail" cssClass="form-control" />
                    </div>
                    <div class="mb-2">
                        <input id="avatarFile" type="file" name="avatarFile" class="form-control" style="display:none;" />
                    </div>
                    <button type="submit" class="btn" style="background: #749b3f; color: white;">Cập nhật</button>
                </form:form>
            </div>

            <!-- Orders Tab -->
            <div class="tab-pane fade" id="v-pills-orders" role="tabpanel" aria-labelledby="v-pills-orders-tab">
                <div class="profile-title">Lịch sử mua hàng</div>
                <div class="order-status-filter">
                    <button type="button" class="btn btn-sm status-filter-btn <c:if test="${selectedStatus eq 'ALL'}">filter-active</c:if>" data-status="ALL">Tất cả</button>
                    <button type="button" class="btn btn-sm status-filter-btn <c:if test="${selectedStatus eq 'PENDING'}">filter-active</c:if>" data-status="PENDING">Chờ thanh toán</button>
                    <button type="button" class="btn btn-sm status-filter-btn <c:if test="${selectedStatus eq 'SHIPPING'}">filter-active</c:if>" data-status="SHIPPING">Đang giao</button>
                    <button type="button" class="btn btn-sm status-filter-btn <c:if test="${selectedStatus eq 'COMPLETE'}">filter-active</c:if>" data-status="COMPLETE">Hoàn thành</button>
                    <button type="button" class="btn btn-sm status-filter-btn <c:if test="${selectedStatus eq 'CANCEL'}">filter-active</c:if>" data-status="CANCEL">Đã hủy</button>
                </div>

                <c:if test="${empty orders}">
                    <div class="alert alert-light">Bạn chưa có đơn hàng nào.</div>
                </c:if>

                <c:forEach var="order" items="${orders}">
                    <div class="mb-4" style="background:#f6f7f8;padding:18px;border-radius:12px;">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3 gap-2">
                            <div>
                                <div style="font-weight:700;color:#333;">Mã đơn: #${order.id}</div>
                                <div style="font-size:13px;color:#666;">Ngày đặt: ${order.createdAtFormatted}</div>
                            </div>
                            <div style="text-align:right;min-width:160px;">
                                <div style="font-weight:700;color:#749b3f;">
                                    <c:choose>
                                        <c:when test="${order.status == 'PENDING'}">Chờ thanh toán</c:when>
                                        <c:when test="${order.status == 'SHIPPING'}">Đang giao</c:when>
                                        <c:when test="${order.status == 'COMPLETE'}">Hoàn thành</c:when>
                                        <c:when test="${order.status == 'CANCEL'}">Đã hủy</c:when>
                                        <c:otherwise>${order.status}</c:otherwise>
                                    </c:choose>
                                </div>
                                <div style="font-size:13px;color:#666;">Tổng đơn: <fmt:formatNumber type="number" value="${order.totalPrice}"/> đ</div>
                            </div>
                        </div>
                        <c:forEach var="od" items="${order.orderDetails}">
                            <div class="mb-3" style="display:flex;align-items:center;gap:14px;padding:12px 0;border-bottom:1px solid #e3e8ef;">
                                <img src="/products/${od.product.firstImage}" alt="${od.product.name}" style="width:72px;height:72px;border-radius:8px;object-fit:cover;" onerror="this.src='/resources/images/header/logo.png'" />
                                <div style="flex:1;min-width:0;">
                                    <div style="font-weight:600;color:#333;">${od.product.name}</div>
                                    <div style="color:#666;font-size:13px;">Số lượng: x${od.quantity}</div>
                                </div>
                                <div style="text-align:right;min-width:140px;">
                                    <div style="color:#ff6b24;font-weight:700;margin-bottom:8px;"><fmt:formatNumber type="number" value="${od.price}" /> đ</div>
                                    <div class="order-history-actions">
                                        <a href="/product/${od.product.id}" class="order-action-btn me-2">Mua lại</a>
                                        <a href="${pageContext.request.contextPath}/contact" class="order-action-btn">Đánh giá</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>

            <!-- Vouchers Tab -->
            <div class="tab-pane fade" id="v-pills-vouchers" role="tabpanel" aria-labelledby="v-pills-vouchers-tab">
                <div class="profile-title">Voucher của tôi</div>
                <!-- Mockup Vouchers -->
                <div class="row">
                    <!-- Fake Voucher 1 -->
                    <div class="col-md-6 mb-3">
                        <div style="border: 2px dashed #749b3f; border-radius: 12px; padding: 15px; display: flex; align-items: center; background-color: #f9fdf5;">
                            <div style="font-size: 32px; color: #749b3f; margin-right: 15px;">
                                <i class="fas fa-ticket-alt"></i>
                            </div>
                            <div style="flex-grow: 1;">
                                <h5 style="margin-bottom: 5px; color: #374029; font-weight: bold;">GIẢM 50K</h5>
                                <div style="font-size: 13px; color: #666;">Đơn tối thiểu 300K</div>
                                <div style="font-size: 12px; color: #e74c3c;">HSD: 31/12/2026</div>
                            </div>
                            <div>
                                <button class="btn btn-sm" style="background:#749b3f; color:white; border-radius: 6px; font-weight: bold;">Lưu</button>
                            </div>
                        </div>
                    </div>
                    <!-- Fake Voucher 2 -->
                    <div class="col-md-6 mb-3">
                        <div style="border: 2px dashed #ff7a2a; border-radius: 12px; padding: 15px; display: flex; align-items: center; background-color: #fff9f5;">
                            <div style="font-size: 32px; color: #ff7a2a; margin-right: 15px;">
                                <i class="fas fa-shipping-fast"></i>
                            </div>
                            <div style="flex-grow: 1;">
                                <h5 style="margin-bottom: 5px; color: #b84b0f; font-weight: bold;">FREESHIP</h5>
                                <div style="font-size: 13px; color: #666;">Giảm tối đa 30K phí vận chuyển</div>
                                <div style="font-size: 12px; color: #e74c3c;">HSD: Sắp hết hạn</div>
                            </div>
                            <div>
                                <button class="btn btn-sm" style="background:#ff7a2a; color:white; border-radius: 6px; font-weight: bold;">Lưu</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>

    <script src="/js/main.js"></script>
    
    <script>
        $(document).ready(function() {
            $('.status-filter-btn').on('click', function(e) {
                e.preventDefault();
                var status = $(this).data('status');
                window.location.href = '/user/profile?status=' + status;
            });

            if (window.location.search.indexOf('status=') !== -1) {
                var ordersTab = document.getElementById('v-pills-orders-tab');
                var profileTab = document.getElementById('v-pills-profile-tab');
                var ordersPane = document.getElementById('v-pills-orders');
                var profilePane = document.getElementById('v-pills-profile');
                if (ordersTab && profileTab && ordersPane && profilePane) {
                    ordersTab.classList.add('active');
                    profileTab.classList.remove('active');
                    ordersPane.classList.add('show', 'active');
                    profilePane.classList.remove('show', 'active');
                }
            }
        });

        // Preview selected avatar
        (function(){
            const fileInput = document.getElementById('avatarFile');
            const img = document.querySelector('.profile-avatar img');
            
            if(!fileInput || !img) return;

            fileInput.addEventListener('change', function(e){
                const f = this.files && this.files[0];
                if(!f) return;
                try { 
                    img.src = URL.createObjectURL(f); 
                } catch(err) {
                    console.error("Lỗi preview ảnh:", err);
                }
            });
        })();
    </script>
</body>

</html>
