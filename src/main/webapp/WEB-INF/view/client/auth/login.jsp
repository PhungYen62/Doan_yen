<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Login - FarmFresh</title>
                <link href="css/style.css" rel="stylesheet" />
                <link href="css/bootstrap.min.css" rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    .divider:after,
                    .divider:before {
                        content: "";
                        flex: 1;
                        height: 1px;
                        background: #eee;
                    }

                    .h-custom {
                        height: calc(100% - 73px);
                    }

                    @media (max-width: 450px) {
                        .h-custom {
                            height: 100%;
                        }
                    }
                </style>
            </head>

            <body class="">
                <!-- <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Login</h3>
                                            </div>
                                            <div class="card-body">
                                                <form method="post" action="/login">
                                                    <c:if test="${param.error != null}">
                                                        <div class="my-2" style="color: red;">Invalid email or password.
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${param.logout != null}">
                                                        <div class="my-2" style="color: green;">Logout success.
                                                        </div>
                                                    </c:if>

                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="email"
                                                            placeholder="name@example.com" name="username" />
                                                        <label>Email address</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="password"
                                                            placeholder="Password" name="password" />
                                                        <label>Password</label>
                                                    </div>
                                                    <div>
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />

                                                    </div>

                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block">
                                                                Login
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/register">Need an account? Sign up!</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>

                </div> -->
                <section class="vh-100">
                    <div class="container-fluid h-custom">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-md-9 col-lg-6 col-xl-5">
                                <img src="/img/hero-img-1.png" class="img-fluid" alt="Sample image">
                            </div>
                            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                                <form method="post" action="/login">
                                    <div
                                        class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
                                        <p class="fw-bold text-center " style="font-size: 28px">Đăng nhập</p>
                                    </div>


                                    <c:if test="${param.error != null}">
                                        <div class="my-2" style="color: red;">Địa chỉ email hoặc mật khẩu không chính
                                            xác.
                                        </div>
                                    </c:if>
                                    <c:if test="${param.logout != null}">
                                        <div class="my-2" style="color: green;">Đăng xuất thành công.
                                        </div>
                                    </c:if>
                                    <!-- Email input -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label>Địa chỉ Email</label>
                                        <input type="email" id="form3Example3" class="form-control form-control-lg"
                                            placeholder="Nhập địa chỉ email" name="username" />
                                    </div>

                                    <!-- Password input -->
                                    <div data-mdb-input-init class="form-outline mb-3">
                                        <label>Mật khẩu</label>
                                        <input type="password" id="form3Example4" class="form-control form-control-lg"
                                            placeholder="Mật khẩu" name="password" />
                                    </div>
                                    <div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <!-- Checkbox -->
                                        <div class="form-check mb-0">
                                            <input class="form-check-input me-2" type="checkbox" value=""
                                                id="form2Example3" />
                                            <label class="form-check-label" for="form2Example3">
                                                Lưu thông tin
                                            </label>
                                        </div>
                                        <a href="#!" class="text-body">Quên mật khẩu?</a>
                                    </div>

                                    <div class="text-center text-lg-start mt-4 pt-2">
                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
                                            style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                                        <p class="small fw-bold mt-2 pt-1 mb-0">Bạn chưa có tài khoản? <a
                                                href="/register" class="">Đăng ký</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </section>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>


            </html>