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
    <title>Đăng nhập - Fresh Food</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />

    <style>
        :root {
            --login-orange: #ee7d34;
            --login-orange-hover: #df6f28;
            --login-text: #1f2937;
            --login-muted: #6b7280;
            --login-border: #e5e7eb;
        }

        body.login-view {
            position: relative;
        }

        body.login-view::before {
            content: "";
            position: fixed;
            inset: 0;
            background: rgba(15, 23, 42, 0.32);
            z-index: 1001;
            pointer-events: none;
        }

        .login-page {
            min-height: calc(100vh - 130px);
            background-image: url('/resources/images/content/avatar.png');
            background-size: cover;
            background-position: center;
            padding: 24px 16px 32px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            width: 100%;
            max-width: 420px;
            background: #ffffff;
            border-radius: 6px;
            box-shadow: 0 16px 36px rgba(0, 0, 0, 0.24);
            padding: 22px 18px 18px;
            position: relative;
            z-index: 1002;
        }

        .login-close-btn {
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

        .login-close-btn:hover {
            background: #f3f4f6;
            color: #374151;
        }

        .login-title {
            text-align: center;
            font-size: 36px;
            font-weight: 700;
            color: var(--login-text);
            margin: 2px 0 18px;
            font-family: "Open Sans", sans-serif;
        }

        .login-msg {
            border-radius: 6px;
            font-size: 13px;
            padding: 10px 12px;
            margin-bottom: 12px;
        }

        .login-msg-error {
            background: #fff2f2;
            border: 1px solid #fecaca;
            color: #b91c1c;
        }

        .login-msg-success {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            color: #166534;
        }

        .login-label {
            display: block;
            font-size: 14px;
            color: #374151;
            margin-bottom: 6px;
            font-weight: 500;
        }

        .login-field {
            margin-bottom: 10px;
        }

        .login-input {
            width: 100%;
            height: 46px;
            border: 1px solid var(--login-border);
            border-radius: 4px;
            padding: 0 12px;
            font-size: 14px;
            color: #111827;
            outline: none;
            box-shadow: none;
        }

        .login-input::placeholder {
            color: #9ca3af;
        }

        .login-input:focus {
            border-color: #c9d1da;
        }

        .login-password-wrap {
            position: relative;
        }

        .login-password-wrap .login-input {
            padding-right: 36px;
        }

        .login-password-icon {
            position: absolute;
            top: 50%;
            right: 12px;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 12px;
            pointer-events: none;
        }

        .login-meta-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin: 10px 0 14px;
        }

        .login-remember {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 12px;
            color: var(--login-muted);
            margin: 0;
        }

        .login-remember input {
            width: 13px;
            height: 13px;
            accent-color: var(--login-orange);
        }

        .login-forgot {
            font-size: 12px;
            color: #374151;
            text-decoration: none;
        }

        .login-forgot:hover {
            color: var(--login-orange-hover);
            text-decoration: underline;
        }

        .login-submit {
            width: 100%;
            height: 44px;
            border: 0;
            border-radius: 5px;
            background: var(--login-orange);
            color: #ffffff;
            font-size: 16px;
            font-weight: 500;
            letter-spacing: 0.2px;
            transition: background-color 0.2s ease;
        }

        .login-submit:hover {
            background: var(--login-orange-hover);
            color: #ffffff;
        }

        .login-divider {
            display: flex;
            align-items: center;
            color: #9ca3af;
            font-size: 12px;
            margin: 13px 0;
            gap: 10px;
        }

        .login-divider::before,
        .login-divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: var(--login-border);
        }

        .login-social {
            display: flex;
            gap: 8px;
        }

        .login-social-btn {
            flex: 1;
            height: 38px;
            border: 1px solid var(--login-border);
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

        .login-social-btn:hover {
            border-color: #d1d5db;
            background: #f9fafb;
        }

        .login-social-btn .fa-google {
            color: #ea4335;
        }

        .login-social-btn .fa-facebook-f {
            color: #1877f2;
        }

        .login-register {
            margin: 14px 0 2px;
            text-align: center;
            font-size: 12px;
            color: #4b5563;
        }

        .login-register a {
            color: var(--login-orange-hover);
            text-decoration: none;
            font-weight: 600;
        }

        .login-register a:hover {
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .login-page {
                padding: 16px 12px 24px;
                align-items: flex-start;
            }

            .login-card {
                margin-top: 14px;
                padding: 20px 14px 16px;
            }

            .login-title {
                font-size: 30px;
            }

            .login-submit {
                font-size: 18px;
            }
        }
    </style>
</head>

<body class="login-view">
    <jsp:include page="../layout/header.jsp" />

    <main class="login-page">
        <section class="login-card" aria-label="Form đăng nhập">
            <a href="/" class="login-close-btn" aria-label="Đóng">
                <i class="fas fa-times"></i>
            </a>

            <h1 class="login-title">Đăng nhập</h1>

            <form method="post" action="/login">
                <c:if test="${param.error != null}">
                    <div class="login-msg login-msg-error">Địa chỉ email hoặc mật khẩu không chính xác.</div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="login-msg login-msg-success">Đăng xuất thành công.</div>
                </c:if>

                <div class="login-field">
                    <label class="login-label" for="login-email">Email</label>
                    <input type="email" id="login-email" class="login-input" placeholder="Nhập email" name="username" required />
                </div>

                <div class="login-field">
                    <label class="login-label" for="login-password">Mật khẩu</label>
                    <div class="login-password-wrap">
                        <input type="password" id="login-password" class="login-input" placeholder="Nhập mật khẩu" name="password" required />
                        <span class="login-password-icon"><i class="far fa-eye-slash"></i></span>
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <div class="login-meta-row">
                    <label class="login-remember" for="remember-login">
                        <input type="checkbox" id="remember-login" />
                        <span>Lưu mật khẩu</span>
                    </label>
                    <a href="#" class="login-forgot">Quên mật khẩu</a>
                </div>

                <button type="submit" class="login-submit">Đăng nhập</button>

                <div class="login-divider">Hoặc đăng nhập với</div>

                <div class="login-social">
                    <button type="button" class="login-social-btn">
                        <i class="fab fa-google"></i>
                        <span>Google</span>
                    </button>
                    <button type="button" class="login-social-btn">
                        <i class="fab fa-facebook-f"></i>
                        <span>Facebook</span>
                    </button>
                </div>

                <p class="login-register">Bạn chưa có tài khoản? <a href="/register">Đăng ký mới</a></p>
            </form>
        </section>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
