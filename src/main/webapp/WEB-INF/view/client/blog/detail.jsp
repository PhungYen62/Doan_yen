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

        .blog-detail-wrap {
            display: flex;
            justify-content: center;
            width: 100%;
            padding: 24px 20px 80px 20px;
        }

        .blog-detail-container {
            width: 100%;
            max-width: 880px;
        }

        .blog-detail-title {
            margin: 10px 0 0 0;
            font-size: 34px;
            color: #212337;
            font-weight: 800;
            text-align: center;
            line-height: 1.25;
        }

        .blog-detail-date {
            display: inline-block;
            margin: 10px auto 0;
            padding: 4px 12px;
            font-size: 12px;
            font-weight: 700;
            color: #749b3f;
            background-color: #e8f3d6;
            border-radius: 6px;
        }

        .blog-detail-image {
            margin-top: 16px;
            width: 100%;
            border-radius: 22px;
            overflow: hidden;
        }

        .blog-detail-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        .blog-detail-intro {
            margin-top: 14px;
            font-size: 16px;
            color: #666;
            line-height: 1.8;
        }

        .blog-section {
            margin-top: 18px;
        }

        .blog-section h2 {
            margin: 0 0 10px 0;
            font-size: 16px;
            font-weight: 800;
            color: #212337;
        }

        .blog-section p {
            margin: 0 0 12px 0;
            font-size: 16px;
            color: #666;
            line-height: 1.85;
        }

        .blog-section ul {
            margin: 0 0 12px 18px;
            padding: 0;
        }

        .blog-section li {
            font-size: 16px;
            color: #666;
            line-height: 1.8;
            margin-bottom: 6px;
        }

        .blog-breadcrumb {
            text-align: center;
            font-size: 12px;
            color: #212337;
            margin-top: 8px;
        }

        .blog-breadcrumb a {
            text-decoration: none;
            color: #ff6a1a;
            font-weight: 700;
        }

        .blog-breadcrumb span {
            color: #212337;
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

                <div class="blog-detail-wrap">
                    <div class="blog-detail-container">

                        <div class="blog-breadcrumb">
                            <a href="${contextPath}/">Trang chủ</a>
                            <span> / </span>
                            <a href="${contextPath}/blog">Blog</a>
                            <span> / </span>
                            <span>${post.title}</span>
                        </div>

                        <h1 class="blog-detail-title">${post.title}</h1>

                        <div style="text-align:center;">
                            <span class="blog-detail-date">${post.dateLabel}</span>
                        </div>

                        <div class="blog-detail-image">
                            <img src="${contextPath}${post.imagePath}" alt="${post.title}">
                        </div>

                        <p class="blog-detail-intro">${post.intro}</p>

                        <c:forEach var="sec" items="${post.sections}">
                            <div class="blog-section">
                                <h2>${sec.heading}</h2>

                                <c:forEach var="p" items="${sec.paragraphs}">
                                    <p>${p}</p>
                                </c:forEach>

                                <c:if test="${not empty sec.bullets}">
                                    <ul>
                                        <c:forEach var="b" items="${sec.bullets}">
                                            <li>${b}</li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </div>
                        </c:forEach>

                    </div>
                </div>

            </div>
        </div>
    </main>

    <jsp:include page="../layout/footer.jsp" />
</div>

</body>
</html>
