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
    <title>Đăng ký - Fresh Food</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />

    <style>
        :root {
            --register-orange: #ee7d34;
            --register-orange-hover: #df6f28;
            --register-text: #1f2937;
            --register-muted: #6b7280;
            --register-border: #e5e7eb;
        }

        body.register-view {
            position: relative;
        }

        body.register-view::before {
            content: "";
            position: fixed;
            inset: 0;
            background: rgba(15, 23, 42, 0.32);
            z-index: 1001;
            pointer-events: none;
        }

        .register-page {
            min-height: calc(100vh - 130px);
            background-image: url('/resources/images/content/avatar.png');
            background-size: cover;
            background-position: center;
            padding: 24px 16px 32px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-card {
            width: 100%;
            max-width: 470px;
            background: #ffffff;
            border-radius: 6px;
            box-shadow: 0 16px 36px rgba(0, 0, 0, 0.24);
            padding: 22px 20px 18px;
            position: relative;
            z-index: 1002;
        }

        .register-close-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 28px;
            height: 28px;
            border: 0;
            background: transparent;
            color: #6b7280;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }

        .register-close-btn:hover {
            background: #f3f4f6;
            color: #374151;
        }

        .register-title {
            text-align: center;
            font-size: 40px;
            font-weight: 700;
            color: var(--register-text);
            margin: 2px 0 18px;
            font-family: "Open Sans", sans-serif;
        }

        .register-row {
            display: flex;
            gap: 10px;
        }

        .register-col {
            flex: 1;
            min-width: 0;
        }

        .register-field {
            margin-bottom: 10px;
        }

        .register-label {
            display: block;
            font-size: 14px;
            color: #374151;
            margin-bottom: 6px;
            font-weight: 500;
        }

        .register-input {
            width: 100%;
            height: 46px;
            border: 1px solid var(--register-border);
            border-radius: 6px;
            padding: 0 12px;
            font-size: 14px;
            color: #111827;
            outline: none;
            box-shadow: none;
            background-color: #fff;
        }

        .register-input::placeholder {
            color: #9ca3af;
        }

        .register-input:focus {
            border-color: #c9d1da;
        }

        .register-password-wrap {
            position: relative;
        }

        .register-password-wrap .register-input {
            padding-right: 36px;
        }

        .register-password-icon {
            position: absolute;
            top: 50%;
            right: 12px;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 12px;
            pointer-events: none;
        }

        .register-error {
            display: block;
            margin-top: 6px;
            font-size: 12px;
            color: #dc2626;
        }

        .register-input.is-invalid {
            border-color: #fca5a5;
            background-image: none;
        }

        .register-submit {
            width: 100%;
            height: 44px;
            border: 0;
            border-radius: 6px;
            background: var(--register-orange);
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.2px;
            transition: background-color 0.2s ease;
            margin-top: 6px;
        }

        .register-submit:hover {
            background: var(--register-orange-hover);
            color: #ffffff;
        }

        .register-divider {
            display: flex;
            align-items: center;
            color: #9ca3af;
            font-size: 12px;
            margin: 13px 0;
            gap: 10px;
        }

        .register-divider::before,
        .register-divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: var(--register-border);
        }

        .register-social {
            display: flex;
            gap: 8px;
        }

        .register-social-btn {
            flex: 1;
            height: 38px;
            border: 1px solid var(--register-border);
            border-radius: 6px;
            background: #ffffff;
            color: #374151;
            font-size: 12px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            cursor: pointer;
        }

        .register-social-btn:hover {
            border-color: #d1d5db;
            background: #f9fafb;
        }

        .register-social-btn .fa-google {
            color: #ea4335;
        }

        .register-social-btn .fa-facebook-f {
            color: #1877f2;
        }

        .register-login {
            margin: 14px 0 2px;
            text-align: center;
            font-size: 12px;
            color: #4b5563;
        }

        .register-login a {
            color: var(--register-orange-hover);
            text-decoration: none;
            font-weight: 600;
        }

        .register-login a:hover {
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .register-page {
                padding: 16px 12px 24px;
                align-items: flex-start;
            }

            .register-card {
                margin-top: 14px;
                padding: 20px 14px 16px;
            }

            .register-title {
                font-size: 34px;
            }

            .register-submit {
                font-size: 16px;
            }

            .register-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>

<body class="register-view">
    <jsp:include page="../layout/header.jsp" />

    <main class="register-page">
        <section class="register-card" aria-label="Form đăng ký">
            <a href="/" class="register-close-btn" aria-label="Đóng">
                <i class="fas fa-times"></i>
            </a>

            <h1 class="register-title">Đăng ký</h1>

            <form:form method="post" action="/register" modelAttribute="registerUser">
                <c:set var="errorFirstName">
                    <form:errors path="firstName" cssClass="register-error" />
                </c:set>
                <c:set var="errorLastName">
                    <form:errors path="lastName" cssClass="register-error" />
                </c:set>
                <c:set var="errorEmail">
                    <form:errors path="email" cssClass="register-error" />
                </c:set>
                <c:set var="errorPassword">
                    <form:errors path="password" cssClass="register-error" />
                </c:set>
                <c:set var="errorConfirmPassword">
                    <form:errors path="confirmPassword" cssClass="register-error" />
                </c:set>

                <div class="register-row">
                    <div class="register-col register-field">
                        <label class="register-label" for="register-first-name">Nhập họ</label>
                        <form:input id="register-first-name" path="firstName" type="text"
                            cssClass="register-input ${not empty errorFirstName ? 'is-invalid' : ''}"
                            placeholder="Nhập họ" />
                        ${errorFirstName}
                    </div>
                    <div class="register-col register-field">
                        <label class="register-label" for="register-last-name">Nhập tên</label>
                        <form:input id="register-last-name" path="lastName" type="text"
                            cssClass="register-input ${not empty errorLastName ? 'is-invalid' : ''}"
                            placeholder="Nhập tên" />
                        ${errorLastName}
                    </div>
                </div>

                <div class="register-field">
                    <label class="register-label" for="register-email">Email</label>
                    <form:input id="register-email" path="email" type="email"
                        cssClass="register-input ${not empty errorEmail ? 'is-invalid' : ''}"
                        placeholder="Nhập email" />
                    ${errorEmail}
                </div>

                <div class="register-row">
                    <div class="register-col register-field">
                        <label class="register-label" for="register-password">Mật khẩu</label>
                        <div class="register-password-wrap">
                            <form:password id="register-password" path="password"
                                cssClass="register-input ${not empty errorPassword ? 'is-invalid' : ''}"
                                placeholder="Nhập mật khẩu" />
                            <span class="register-password-icon"><i class="far fa-eye-slash"></i></span>
                        </div>
                        ${errorPassword}
                    </div>
                    <div class="register-col register-field">
                        <label class="register-label" for="register-confirm-password">Xác nhận mật khẩu</label>
                        <div class="register-password-wrap">
                            <form:password id="register-confirm-password" path="confirmPassword"
                                cssClass="register-input ${not empty errorConfirmPassword ? 'is-invalid' : ''}"
                                placeholder="Nhập mật khẩu" />
                            <span class="register-password-icon"><i class="far fa-eye-slash"></i></span>
                        </div>
                        ${errorConfirmPassword}
                    </div>
                </div>

                <button type="submit" class="register-submit">Đăng ký</button>

                <div class="register-divider">Hoặc đăng nhập với</div>

                <div class="register-social">
                    <button type="button" class="register-social-btn">
                        <i class="fab fa-google"></i>
                        <span>Google</span>
                    </button>
                    <button type="button" class="register-social-btn">
                        <i class="fab fa-facebook-f"></i>
                        <span>Facebook</span>
                    </button>
                </div>

                <p class="register-login">Bạn đã có tài khoản? <a href="/login">Đăng nhập</a></p>
            </form:form>
        </section>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
