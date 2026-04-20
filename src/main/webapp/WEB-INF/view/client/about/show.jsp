<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Food - Về chúng tôi</title>

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

        body {
            padding-top: 135px;
            margin: 0;
            font-size: 16px;
            background: var(--White);
            color: var(--Black);
        }

        .about-page {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 52px;
            padding: 28px 20px 0 20px;
        }

        .about-container {
            width: 100%;
            max-width: 1200px;
        }

        .about-hero {
            display: grid;
            grid-template-columns: 1.1fr 1fr;
            gap: 48px;
            align-items: center;
        }

        .about-hero-image {
            width: 100%;
            border-radius: 8px;
            overflow: hidden;
            background: transparent;
            box-shadow: none;
        }

        .about-hero-image img {
            width: 100%;
            height: auto;
            display: block;
            object-fit: cover;
        }

        .about-kicker {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 4px 12px;
            border-radius: 8px;
            background: var(--color-olivedrab-300);
            color: var(--Green);
            font-weight: 600;
            font-size: 16px;
        }

        .about-title {
            margin: 10px 0 10px 0;
            font-size: 48px;
            line-height: 1.2;
            font-weight: 600;
            color: var(--Black);
        }

        .about-desc {
            margin: 0;
            color: var(--Grey-100);
            line-height: 1.8;
            font-size: 16px;
            text-align: left;
        }

        .about-desc + .about-desc {
            margin-top: 12px;
        }

        .why-wrap {
            padding-top: 10px;
        }

        .why-title {
            margin: 16px 0 0 0;
            text-align: center;
            font-size: 48px;
            font-weight: 600;
            color: var(--Black);
        }

        .why-sub {
            margin: 12px auto 0 auto;
            text-align: center;
            max-width: 720px;
            color: var(--Grey-100);
            line-height: 1.7;
            font-size: 16px;
        }

        .why-cards {
            margin-top: 22px;
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 16px;
        }

        .why-card {
            border: var(--border-1);
            border-radius: 8px;
            background: var(--White);
            padding-top: 4px;
            padding-right: 16px;
            padding-bottom: 20px;
            padding-left: 20px;
            box-shadow: var(--Shadow-xs);
            text-align: left;
        }

        .why-icon {
            width: 36px;
            height: 36px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: var(--color-orangered-200);
            color: var(--Primary);
            margin-top: 0;
            margin-bottom: 6px;
        }

        .why-icon i {
            font-size: 16px;
            line-height: 1;
        }

        .why-card h3 {
            margin: 0;
            font-size: 16px;
            font-weight: 800;
            color: var(--Black);
        }

        .why-card p {
            margin: 4px 0 0 0;
            color: var(--Grey-100);
            line-height: 1.75;
            font-size: 16px;
        }

        .team-kicker {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 4px 12px;
            border-radius: 8px;
            background: var(--color-olivedrab-300);
            color: var(--Green);
            font-weight: 600;
            font-size: 16px;
            margin: 0 auto;
        }

        .team-title {
            margin: 16px 0 0 0;
            text-align: center;
            font-size: 48px;
            font-weight: 600;
            color: var(--Black);
        }

        .team-sub {
            margin: 12px auto 0 auto;
            text-align: center;
            max-width: 720px;
            color: var(--Grey-100);
            line-height: 1.7;
            font-size: 16px;
        }

        .team-grid {
            margin-top: 20px;
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 16px;
        }

        .team-card {
            border: var(--border-1);
            border-radius: 8px;
            overflow: hidden;
            background: var(--White);
            box-shadow: var(--Shadow-xs);
            display: flex;
            flex-direction: column;
        }

        .team-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            display: block;
            background: var(--Grey-20);
        }

        .team-info {
            padding: 16px;
            text-align: center;
        }

        .team-name {
            margin: 0;
            font-size: 16px;
            font-weight: 800;
            color: var(--Black);
        }

        .team-role {
            margin: 6px 0 0 0;
            font-size: 16px;
            color: var(--Grey-100);
        }

        @media (max-width: 1024px) {
            .about-hero { grid-template-columns: 1fr; }
            .team-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
            .why-cards { grid-template-columns: 1fr; }
        }

        @media (max-width: 640px) {
            .team-grid { grid-template-columns: 1fr; }
            .about-title { font-size: 32px; }
            .why-title, .team-title { font-size: 28px; }
        }
    </style>
</head>

<body>
<div class="shop" style="gap: 0; justify-content: flex-start; align-items: stretch;">
    <jsp:include page="../layout/header.jsp" />

    <main class="shop-inner">
        <div class="frame-group" style="gap: 0;">
            <div class="frame-container" style="gap: 0;">

                <!-- Banner + breadcrumb giống các trang khác -->
                <div class="text-description-wrapper" style="background-image: url('${contextPath}/images/content/Bgcontent.png'); background-size: cover; background-position: center; background-repeat: no-repeat; aspect-ratio: 1445 / 199; min-height: 199px; display: flex; align-items: center; justify-content: center; padding: 0 20px; margin: 0; width: 100vw; margin-left: calc(-50vw + 50%); position: relative;">
                    <div class="text-description" style="text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 8px; position: relative; z-index: 1;">
                        <h2 class="page-title" style="color: #212337; font-size: 48px; font-weight: 700; margin-bottom: 8px;">Về chúng tôi</h2>
                        <div class="breadcrumb" style="color: #212337; font-size: 16px; letter-spacing: 0.5px;">
                            <span>Trang chủ</span>
                            <span class="ca-hng2" style="color: #ff6a1a;"> / Về chúng tôi</span>
                        </div>
                    </div>
                </div>

                <div class="about-page">
                    <div class="about-container">
                        <section class="about-hero">
                            <div class="about-hero-image">
                                <img src="${contextPath}/images/aboutUs/Image.png" alt="Về chúng tôi">
                            </div>

                            <div>
                                <div class="about-kicker">Về chúng tôi</div>
                                <h1 class="about-title">Chào mừng đến Fresh Food</h1>

                                <p class="about-desc">
                                    Chào mừng đến với Fresh Food, nguồn cung cấp rau quả tươi ngon chất lượng hàng đầu đến từ vườn của bạn. Chúng tôi tự hào mang đến những sản phẩm được tuyển chọn kỹ lưỡng và đảm bảo an toàn.
                                </p>
                                <p class="about-desc">
                                    Với sứ mệnh kết nối nông sản tươi đến mọi nhà, chúng tôi tập trung vào trải nghiệm mua sắm tiện lợi, minh bạch nguồn gốc và chất lượng ổn định. Sản phẩm của chúng tôi được chăm sóc theo tiêu chuẩn vệ sinh, kiểm soát nghiêm ngặt và đóng gói cẩn thận.
                                </p>
                                <p class="about-desc">
                                    Tại Fresh Food, sứ mệnh của chúng tôi là định nghĩa lại trải nghiệm mua sắm thực phẩm bằng cách cung cấp các loại rau củ ngon, lành mạnh và bền vững.
                                </p>
                            </div>
                        </section>
                    </div>

                    <div class="about-container why-wrap">
                        <div class="team-kicker">Tại sao chọn chúng tôi</div>
                        <h2 class="why-title">Tại sao chọn Fresh Food?</h2>
                        <p class="why-sub">
                            Các sản phẩm tươi sống của chúng tôi được chọn kỹ lưỡng và đảm bảo chất lượng về hương vị tự nhiên. Chúng tôi ưu tiên sự tươi ngon để bạn có bữa ăn ngon miệng mỗi ngày.
                        </p>

                        <div class="why-cards">
                            <div class="why-card">
                                <div class="why-icon"><i class="fas fa-crown"></i></div>
                                <h3>Chất lượng</h3>
                                <p>Sản phẩm được chọn lọc kỹ, giữ độ tươi ngon và hương vị tự nhiên.</p>
                            </div>
                            <div class="why-card">
                                <div class="why-icon"><i class="fas fa-truck"></i></div>
                                <h3>Vận chuyển</h3>
                                <p>Giao hàng nhanh, đóng gói cẩn thận để sản phẩm đến tay bạn luôn tươi.</p>
                            </div>
                            <div class="why-card">
                                <div class="why-icon"><i class="fas fa-headset"></i></div>
                                <h3>Dịch vụ khách hàng</h3>
                                <p>Hỗ trợ tận tâm, phản hồi nhanh, ưu tiên trải nghiệm mua sắm của bạn.</p>
                            </div>
                        </div>
                    </div>

                    <div class="about-container">
                        <div style="display:flex; flex-direction:column; align-items:center;">
                            <div class="team-kicker">Team của chúng tôi</div>
                            <h2 class="team-title">Gặp gỡ đội ngũ của chúng tôi</h2>
                            <p class="team-sub">Hãy cùng tìm hiểu về những con người tạo nên Fresh Food, những người luôn sẵn sàng mang đến chất lượng đáng tin cậy cho bạn.</p>
                        </div>

                        <div class="team-grid">
                            <div class="team-card">
                                <img src="${contextPath}/images/aboutUs/ab4.jpg" alt="Thành viên 1">
                                <div class="team-info">
                                    <p class="team-name">James Patel</p>
                                    <p class="team-role">Founder &amp; CEO</p>
                                </div>
                            </div>
                            <div class="team-card">
                                <img src="${contextPath}/images/aboutUs/ab6.jpg" alt="Thành viên 2">
                                <div class="team-info">
                                    <p class="team-name">Michael Sanchez</p>
                                    <p class="team-role">Customer Support Specialist</p>
                                </div>
                            </div>
                            <div class="team-card">
                                <img src="${contextPath}/images/aboutUs/ab2.jpg" alt="Thành viên 3">
                                <div class="team-info">
                                    <p class="team-name">Robert Fox</p>
                                    <p class="team-role">Head of Operations</p>
                                </div>
                            </div>
                            <div class="team-card">
                                <img src="${contextPath}/images/aboutUs/ab.jpg" alt="Thành viên 4">
                                <div class="team-info">
                                    <p class="team-name">Tom Jhon</p>
                                    <p class="team-role">Customer Service Manager</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </main>

    <jsp:include page="../layout/footer.jsp" />
</div>

</body>
</html>
