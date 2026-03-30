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
                <title>Register</title>
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
                                    <div class="col-lg-7">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Create Account</h3>
                                            </div>
                                            <div class="card-body">
                                                <form:form method="post" action="/register"
                                                    modelAttribute="registerUser">
                                                    <c:set var="errorPassword">
                                                        <form:errors path="confirmPassword"
                                                            cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>

                                                    <c:set var="errorFirstName">
                                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <form:input
                                                                    class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                                                    type="text" placeholder="Enter your first name"
                                                                    path="firstName" />
                                                                <label for="inputFirstName">First name</label>
                                                                ${errorFirstName}
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating">
                                                                <form:input class="form-control" type="text"
                                                                    placeholder="Enter your last name"
                                                                    path="lastName" />
                                                                <label for="inputLastName">Last name</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <form:input
                                                            class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                            type="email" placeholder="name@example.com" path="email" />
                                                        <label>Email address</label>
                                                        ${errorEmail}
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <form:input
                                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                                    type="password" placeholder="Create a password"
                                                                    path="password" />
                                                                <label>Password</label>
                                                                ${errorPassword}
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <form:input class="form-control" type="password"
                                                                    placeholder="Confirm password"
                                                                    path="confirmPassword" />
                                                                <label>Confirm Password</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block">
                                                                Create Account
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form:form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/login">Have an account? Go to login</a>
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
                                <form:form method="post" action="/register" modelAttribute="registerUser">
                                    <c:set var="errorPassword">
                                        <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorPassword1">
                                        <form:errors path="password" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </c:set>

                                    <c:set var="errorFirstName">
                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                    </c:set>
                                    <div
                                        class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
                                        <p class="fw-bold text-center " style="font-size: 28px">Đăng ký tài khoản</p>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input
                                                    class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                                    type="text" placeholder="Enter your first name" path="firstName" />
                                                <label for="inputFirstName">First name</label>
                                                ${errorFirstName}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <form:input class="form-control" type="text"
                                                    placeholder="Enter your last name" path="lastName" />
                                                <label for="inputLastName">Last name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <form:input class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                            type="email" placeholder="name@example.com" path="email" />
                                        <label>Email address</label>
                                        ${errorEmail}
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input
                                                    class="form-control ${not empty errorPassword1 ? 'is-invalid' : ''}"
                                                    type="password" placeholder="Create a password" path="password" />
                                                <label>Password</label>
                                                ${errorPassword1}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input
                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                    type="password" placeholder="Confirm password"
                                                    path="confirmPassword" />
                                                <label>Confirm Password</label>
                                                ${errorPassword}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <button class="btn btn-primary btn-block">
                                                Đăng ký tài khoản
                                            </button>
                                            <p class="small fw-bold mt-2 pt-1 mb-0">Bạn đã có tài khoản? <a
                                                    href="/login" class="">Đăng nhập</a></p>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                </section>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>