<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>User</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">

            <!-- Favicon -->
            <link href="img/favicon.ico" rel="icon">

            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
                rel="stylesheet">

            <!-- Icon Font Stylesheet -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <!-- Libraries Stylesheet -->
            <link href="/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
            <link href="/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

            <!-- Customized Bootstrap Stylesheet -->
            <link href="/admin/css/bootstrap.min.css" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="/admin/css/style.css" rel="stylesheet">
        </head>

        <body>
            <div class="container-fluid position-relative bg-white d-flex p-0">
                <!-- Spinner Start -->
                <div id="spinner"
                    class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
                <!-- Spinner End -->


                <!-- Sidebar Start -->
                <jsp:include page="../layout/sidebar.jsp" />
                <!-- Sidebar End -->


                <!-- Content Start -->
                <div class="content">
                    <!-- Navbar Start -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- Navbar End -->


                    <!-- Recent Sales Start -->
                    <div class="container-fluid pt-5 px-4">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Show All</h6>
                                <a href="/admin/user/create">Create</a>
                            </div>
                            <div class="table-responsive">
                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr class="text-dark">
                                            <th scope="col">ID</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">FullName</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Province</th>
                                            <th scope="col">District</th>
                                            <th scope="col">Ward</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${users1}">

                                            <tr>
                                                <th>${user.id}</th>
                                                <td>${user.email}</td>
                                                <td>${user.fullName}</td>
                                                <td>${user.phone}</td>
                                                <td>${user.province}</td>
                                                <td>${user.district}</td>
                                                <td>${user.ward}</td>

                                                <td>${user.role.name}</td>

                                                <td>
                                                    <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                                                    <a href="/admin/user/update/${user.id}"
                                                        class="btn btn-warning  mx-2">Update</a>
                                                    <a href="/admin/user/delete/${user.id}"
                                                        class="btn btn-danger">Delete</a>
                                                </td>
                                            </tr>

                                        </c:forEach>

                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                    <!-- Recent Sales End -->


                    <div class="pt-4">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                    href="/admin/user?page=${currentPage-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                <li class="page-item">
                                    <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                        href="/admin/user?page=${loop.index + 1}">${loop.index
                                        + 1}
                                    </a>
                                </li>
                            </c:forEach>

                            <li class="page-item">
                                <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                    href="/admin/user?page=${currentPage + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </div>


                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Footer End -->
                </div>
                <!-- Content End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
            </div>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="/admin/lib/chart/chart.min.js"></script>
            <script src="/admin/lib/easing/easing.min.js"></script>
            <script src="/admin/lib/waypoints/waypoints.min.js"></script>
            <script src="/admin/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="/admin/lib/tempusdominus/js/moment.min.js"></script>
            <script src="/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

            <!-- Template Javascript -->
            <script src="/admin/js/main.js"></script>
        </body>

        </html>