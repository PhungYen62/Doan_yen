<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8">
            <title>Tỉnh/Thành</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">

            <link href="img/favicon.ico" rel="icon">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                rel="stylesheet">

            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <link href="/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
            <link href="/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

            <link href="/admin/css/bootstrap.min.css" rel="stylesheet">
            <link href="/admin/css/style.css" rel="stylesheet">
        </head>

        <body>
            <div class="container-fluid position-relative bg-white d-flex p-0">
                <div id="spinner"
                    class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                        <span class="sr-only">Đang tải...</span>
                    </div>
                </div>

                <jsp:include page="../layout/sidebar.jsp" />

                <div class="content">
                    <jsp:include page="../layout/header.jsp" />

                    <div class="container-fluid pt-5 px-4">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Danh sách tỉnh/thành</h6>
                                <a href="/admin/province/create">Thêm mới</a>
                            </div>
                            <div class="row g-3 mb-4" data-filter-toolbar data-target="#admin-province-table">
                                <div class="col-md-12">
                                    <label class="form-label text-start d-block">Tìm kiếm</label>
                                    <input type="search" class="form-control" data-filter-search
                                        placeholder="Tìm theo mã hoặc tên tỉnh/thành">
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table id="admin-province-table" class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr class="text-dark">
                                            <th scope="col">ID</th>
                                            <th scope="col">Mã</th>
                                            <th scope="col">Tên tỉnh/thành</th>
                                            <th scope="col">Ngày tạo</th>
                                            <th scope="col">Ngày cập nhật</th>
                                            <th scope="col">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="province" items="${provinces}">
                                            <tr>
                                                <th>${province.id}</th>
                                                <td>${province.code}</td>
                                                <td>${province.name}</td>
                                                <td>${province.createdAt}</td>
                                                <td>${province.updatedAt}</td>
                                                <td>
                                                    <a href="/admin/province/${province.id}"
                                                        class="btn btn-success">Xem</a>
                                                    <a href="/admin/province/update/${province.id}"
                                                        class="btn btn-warning mx-2">Cập nhật</a>
                                                    <a href="/admin/province/delete/${province.id}"
                                                        class="btn btn-danger">Xóa</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty provinces}">
                                            <tr>
                                                <td colspan="6" class="text-center text-muted">
                                                    Chưa có tỉnh/thành nào.
                                                </td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="pt-4">
                        <c:if test="${totalPages > 0}">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                        href="/admin/province?page=${currentPage-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                    <li class="page-item">
                                        <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                            href="/admin/province?page=${loop.index + 1}">${loop.index + 1}
                                        </a>
                                    </li>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                        href="/admin/province?page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </c:if>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />
                </div>

                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
            </div>

            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="/admin/lib/chart/chart.min.js"></script>
            <script src="/admin/lib/easing/easing.min.js"></script>
            <script src="/admin/lib/waypoints/waypoints.min.js"></script>
            <script src="/admin/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="/admin/lib/tempusdominus/js/moment.min.js"></script>
            <script src="/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
            <script src="/admin/js/main.js"></script>
        </body>

        </html>



