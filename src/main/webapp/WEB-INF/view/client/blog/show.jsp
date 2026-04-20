<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Food - Blog</title>

    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />

    <!-- CSS giống các trang trước (Shop) -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/global.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

    <style>
        html, body {
            font-family: 'Inter', sans-serif;
        }

        h1, h2, h3, h4, h5, h6,
        p, span, a, li, label,
        b, strong,
        button, input, select, textarea {
            font-family: 'Inter', sans-serif !important;
        }

        body {
            padding-top: 135px;
            margin: 0;
            font-family: 'Inter', sans-serif;
            font-size: 16px;
            background-color: #ffffff;
        }

        /* Dùng lại style giống phần Blog ở trang chủ */
        .blog-img-container {
            width: 100%;
            height: 210px;
            background: #f0f0f0;
            border-radius: var(--br-16);
            overflow: hidden;
        }

        .blog-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.18s ease;
        }

        /* Cho list page hiển thị 9 bài (wrap) nhưng vẫn giữ nguyên cấu trúc/class */
        .our-blog {
            height: auto;
            padding: 24px 20px 70px 20px;
            width: 100%;
        }

        .our-products2 {
            width: 100%;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        .blog2 {
            flex-wrap: wrap;
            justify-content: center;
            width: 100%;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
            align-items: stretch;
        }

        .blog3 {
            width: 384px;
            height: 100%;
            display: flex;
            flex-direction: column;
            transition: transform 0.18s ease, box-shadow 0.18s ease;
            background: var(--White);
            border-radius: var(--br-20);
            overflow: hidden;
            padding: var(--padding-16);
            text-align: left;
        }

        .blog3:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-drop-1);
        }

        .blog3:hover .blog-img-container img {
            transform: scale(1.03);
        }

        .blog3 .download-app {
            width: 100%;
            flex: 1;
            display: flex;
            flex-direction: column;
            padding: 0;
        }

        .blog3 .text-description5 {
            width: 100%;
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            text-align: left;
        }

        .blog3 .blog-post-title {
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            line-clamp: 3;
            overflow: hidden;
            font-size: var(--fs-16);
            line-height: var(--lh-24);
            min-height: calc(var(--lh-24) * 3);
            width: 100%;
            max-width: 100%;
            word-break: break-word;
        }

        .blog3 .blog-date {
            width: 100%;
            max-width: 100%;
            text-align: left;
        }

        .read-more-text {
            font-size: var(--fs-16);
            line-height: var(--lh-24);
        }

        .blog3 .read-more-container {
            margin-top: auto;
            align-self: flex-start;
        }

        /* Read-more trên trang blog là link nhưng giữ đúng style */
        a.read-more-container {
            text-decoration: none;
            background-color: transparent;
            outline: none;
        }

        a.read-more-container:hover,
        a.read-more-container:focus,
        a.read-more-container:focus-visible {
            text-decoration: none;
            background-color: transparent;
            box-shadow: none;
            outline: none;
        }
    </style>
</head>

<body>

<div class="shop" style="gap: 0; justify-content: flex-start; align-items: stretch;">
    <jsp:include page="../layout/header.jsp" />

    <main class="shop-inner">
        <div class="frame-group" style="gap: 0;">
            <div class="frame-container" style="gap: 0;">

                <!-- Banner + breadcrumb giống Shop -->
                <div class="text-description-wrapper" style="background-image: url('${contextPath}/images/content/Bgcontent.png'); background-size: cover; background-position: center; background-repeat: no-repeat; aspect-ratio: 1445 / 199; min-height: 199px; display: flex; align-items: center; justify-content: center; padding: 0 20px; margin: 0; width: 100vw; margin-left: calc(-50vw + 50%); position: relative;">
                    <div class="text-description" style="text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 8px; position: relative; z-index: 1;">
                        <h2 class="page-title" style="color: #212337; font-size: 48px; font-weight: 700; margin-bottom: 8px;">Blog</h2>
                        <div class="breadcrumb" style="color: #212337; font-size: 16px; letter-spacing: 0.5px;">
                            <span>Trang chủ</span>
                            <span class="ca-hng2" style="color: #ff6a1a;"> / Blog</span>
                        </div>
                    </div>
                </div>

                <!-- Nội dung Blog như ảnh (9 bài) -->
                <div class="our-blog">
                    <section class="our-products2">
                        <div class="caption2">
                            <h3 class="u-i-c" style="font-size: 16px; font-weight: 600; color: var(--Green);">Blog của chúng tôi</h3>
                        </div>
                        <div class="text-description4" style="gap: 8px;">
                            <h2 class="c-sn-vng" style="color: var(--Black); margin: 0;">Fresh Food Blog</h2>
                            <div class="blog-description" style="margin: 0;">
                                Chào mừng đến với Blog Fresh Food, nguồn thông tin hữu ích cho mọi thứ liên quan đến nông sản tươi, ăn uống lành mạnh và cảm hứng ẩm thực.
                            </div>
                        </div>
                    </section>

                    <div class="blog2">
                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog1.jpg" alt="Blog 1">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 23, 2024</div>
                                    <b class="blog-post-title">Khám phá những món ngon theo mùa: Hướng dẫn về những món tươi ngon nhất hiện nay</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/1">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>

                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog2.jpg" alt="Blog 2">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 21, 2024</div>
                                    <b class="blog-post-title">Bí quyết tạo nên những món salad ngon miệng và bổ dưỡng</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/2">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>

                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog3.jpg" alt="Blog 3">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 19, 2024</div>
                                    <b class="blog-post-title">Nghệ thuật chuẩn bị bữa ăn: Làm thế nào để tiết kiệm thời gian và ăn uống lành mạnh suốt cả tuần</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/3">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>

                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog4.jpg" alt="Blog 4">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 17, 2024</div>
                                    <b class="blog-post-title">Niềm vui mùa thu hoạch: Tôn vinh sự trù phú của mùa vụ</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/4">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>

                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog5.jpg" alt="Blog 5">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 15, 2024</div>
                                    <b class="blog-post-title">Từ hạt giống đến bàn ăn: Cách thu hoạch những sản phẩm tốt nhất từ khu vườn của bạn</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/5">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>

                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog6.jpg" alt="Blog 6">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 13, 2024</div>
                                    <b class="blog-post-title">Hướng dẫn dành cho người mới bắt đầu về cách thu hoạch thành công: Mẹo và thủ thuật</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/6">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>

                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog7.jpg" alt="Blog 7">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 11, 2024</div>
                                    <b class="blog-post-title">Ăn theo mùa: Vì sao thực phẩm theo mùa luôn ngon và tốt cho sức khỏe hơn?</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/7">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>

                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog8.jpg" alt="Blog 8">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 09, 2024</div>
                                    <b class="blog-post-title">Bảo quản rau củ đúng cách: Giữ độ tươi lâu hơn trong tủ lạnh</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/8">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>

                        <section class="blog3">
                            <div class="blog-img-container">
                                <img src="${contextPath}/images/blog/blog9.jpg" alt="Blog 9">
                            </div>
                            <div class="download-app">
                                <div class="text-description5">
                                    <div class="blog-date">May 07, 2024</div>
                                    <b class="blog-post-title">Gợi ý thực đơn xanh: 5 món nhanh gọn từ rau củ cho ngày bận rộn</b>
                                </div>
                                <a class="read-more-container" href="${contextPath}/blog/9">
                                    <b class="read-more-text">Đọc thêm -&gt;</b>
                                </a>
                            </div>
                        </section>
                    </div>
                </div>

            </div>
        </div>
    </main>

    <jsp:include page="../layout/footer.jsp" />
</div>

</body>
</html>
