<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Map Dac San Viet Nam</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
        integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />

    <style>
        :root {
            --ink: #17352f;
            --green: #2f6f54;
            --gold: #c98b2e;
            --sand: #f6f1e7;
            --panel: rgba(255, 252, 245, 0.94);
            --line: rgba(23, 53, 47, 0.12);
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding-top: 130px;
            font-family: 'Be Vietnam Pro', sans-serif;
            color: var(--ink);
            background:
                radial-gradient(circle at top left, rgba(201, 139, 46, 0.12), transparent 24%),
                linear-gradient(180deg, #f8f5ee 0%, var(--sand) 100%);
        }

        .map-page {
            width: 100%;
            margin: 0;
            padding: 0 0 40px;
        }

        .map-story {
            position: relative;
            min-height: 230vh;
        }

        .map-stage {
            position: sticky;
            top: 130px;
            width: 100vw;
            height: calc(100vh - 130px);
            margin-left: calc(50% - 50vw);
            overflow: hidden;
        }

        #vietnam-map {
            width: 100%;
            height: 100%;
            background:
                radial-gradient(circle at top, rgba(201, 139, 46, 0.10), transparent 34%),
                linear-gradient(180deg, #f8f3e8 0%, #efe7d8 100%);
        }

        .map-overlay {
            position: absolute;
            inset: 0;
            display: grid;
            grid-template-columns: 2fr 1fr;
            align-items: start;
            gap: 36px;
            padding: 18px max(0px, calc((100vw - 1480px) / 2 + 0px)) 24px;
            pointer-events: none;
        }

        .map-spacer {
            min-height: 1px;
        }

        .info-panel {
            width: 100%;
            max-width: 440px; /* Thêm max-width để giới hạn độ rộng của panel, giúp panel cách xa map hơn */
            justify-self: end;
            max-height: calc(100vh - 182px);
            overflow: auto;
            border-radius: 28px;
            background: var(--panel);
            border: 1px solid var(--line);
            box-shadow: 0 24px 50px rgba(23, 53, 47, 0.10);
            pointer-events: auto;
            backdrop-filter: blur(8px);
        }

        .info-panel-body {
            padding: 22px 22px 24px;
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .panel-kicker {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 14px;
            border-radius: 999px;
            background: rgba(47, 111, 84, 0.10);
            color: var(--green);
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            backdrop-filter: blur(8px);
        }

        .province-name {
            margin: 0;
            font-size: 30px;
            line-height: 1.06;
            font-weight: 800;
        }

        .section-title {
            margin: 0 0 10px;
            font-size: 17px;
            font-weight: 800;
        }

        .product-list,
        .marker-list {
            display: grid;
            gap: 12px;
        }

        .product-card {
            display: grid;
            grid-template-columns: 78px minmax(0, 1fr);
            gap: 12px;
            padding: 12px;
            border-radius: 18px;
            background: #fff;
            border: 1px solid rgba(23, 53, 47, 0.08);
            text-decoration: none;
            color: inherit;
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
        }

        .product-card:hover {
            transform: translateY(-2px);
            border-color: rgba(47, 111, 84, 0.28);
            box-shadow: 0 14px 30px rgba(23, 53, 47, 0.08);
        }

        .product-card img {
            width: 78px;
            height: 78px;
            border-radius: 14px;
            object-fit: cover;
            background: #f0e9dc;
        }

        .product-card h4 {
            margin: 0 0 6px;
            font-size: 15px;
            font-weight: 800;
        }

        .product-card p {
            margin: 0 0 8px;
            font-size: 12px;
            line-height: 1.55;
            color: rgba(23, 53, 47, 0.72);
        }

        .product-price {
            color: var(--green);
            font-size: 13px;
            font-weight: 800;
        }

        .empty-state {
            color: rgba(23, 53, 47, 0.72);
            line-height: 1.55;
            font-size: 13px;
        }

        .empty-state {
            padding: 16px;
            border-radius: 16px;
            background: rgba(23, 53, 47, 0.05);
        }

        .leaflet-control-container {
            display: none;
        }

        .leaflet-popup-content-wrapper {
            border-radius: 16px;
            font-family: 'Be Vietnam Pro', sans-serif;
        }

        .leaflet-popup-content {
            margin: 12px 14px;
        }

        .leaflet-tooltip {
            padding: 6px 10px;
            border-radius: 999px;
            border: none;
            box-shadow: 0 10px 22px rgba(23, 53, 47, 0.16);
            font-family: 'Be Vietnam Pro', sans-serif;
            font-size: 11px;
            font-weight: 700;
            color: var(--ink);
        }

        .leaflet-container:focus,
        .leaflet-container a:focus,
        .leaflet-container path:focus,
        .leaflet-interactive:focus {
            outline: none !important;
        }

        @media (max-width: 1100px) {
            .map-story {
                min-height: auto;
            }

            .map-stage {
                position: relative;
                top: auto;
                width: 100%;
                height: auto;
                margin-left: 0;
                overflow: visible;
            }

            #vietnam-map {
                height: 72vh;
                min-height: 620px;
            }

            .map-overlay {
                position: relative;
                inset: auto;
                display: grid;
                grid-template-columns: 1fr;
                gap: 18px;
                padding: 18px 16px 0;
            }

            .info-panel {
                width: 100%;
                max-width: none;
                max-height: none;
            }
        }

        @media (max-width: 640px) {
            body {
                padding-top: 118px;
            }

            #vietnam-map {
                height: 68vh;
                min-height: 460px;
            }

            .map-overlay {
                padding-left: 14px;
                padding-right: 14px;
            }
        }
    </style>
</head>

<body>
    <jsp:include page="../layout/header.jsp" />

    <main class="map-page">
        <section class="map-story">
            <div class="map-stage">
                <div id="vietnam-map"></div>

                <div class="map-overlay">
                    <div class="map-spacer" aria-hidden="true"></div>

                    <aside class="info-panel">
                        <div class="info-panel-body">
                            <section>
                                <div class="panel-kicker">
                                    <i class="fas fa-pepper-hot"></i>
                                    <span>Chi Tiet Tinh</span>
                                </div>
                            </section>

                            <section>
                                <h2 class="province-name" id="province-name">Chon mot tinh tren ban do</h2>
                            </section>

                            <section>
                                <h3 class="section-title">Đặc sản</h3>
                                <div class="product-list" id="province-products">
                                    <div class="empty-state">Chua co tinh nao duoc chon.</div>
                                </div>
                            </section>

                        </div>
                    </aside>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="../layout/footer.jsp" />

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
        crossorigin=""></script>
    <script>
        const provinceData = ${provinceDataJson};
        const map = L.map('vietnam-map', {
            minZoom: 5,
            maxZoom: 12,
            zoomControl: false,
            attributionControl: false,
            dragging: false,
            scrollWheelZoom: false,
            doubleClickZoom: false,
            boxZoom: false,
            keyboard: false,
            touchZoom: false
        }).setView([16.8, 106.2], 6);

        const provinceNameEl = document.getElementById('province-name');
        const provinceProductsEl = document.getElementById('province-products');

        const defaultStyle = {
            color: '#ffffff',
            weight: 1.2,
            fillColor: '#7ca96e',
            fillOpacity: 0.74
        };

        const hoverStyle = {
            color: '#ffffff',
            weight: 1.2,
            fillColor: '#c98b2e',
            fillOpacity: 0.88
        };

        const liveMarkers = [];
        let geoJsonLayer = null;
        let activeLayer = null;
        let mapBounds = null;
        let fixedStoryZoom = null;
        const mapStoryEl = document.querySelector('.map-story');

        function formatPrice(value) {
            if (value == null) return '';
            return new Intl.NumberFormat('vi-VN').format(value) + 'd';
        }

        function resetLiveMarkers() {
            liveMarkers.forEach(function (marker) {
                map.removeLayer(marker);
            });
            liveMarkers.length = 0;
        }

        function renderProducts(products) {
            provinceProductsEl.innerHTML = '';
            if (!products || products.length === 0) {
                provinceProductsEl.innerHTML = '<div class="empty-state">Tinh nay chua co san pham nao duoc gan trong co so du lieu.</div>';
                return;
            }

            products.forEach(function (product) {
                const card = document.createElement('a');
                card.className = 'product-card';
                card.href = '/product/' + product.id;

                const image = product.image ? '/products/' + product.image : '/resources/images/header/logo.png';
                const shortDesc = product.shortDesc ? product.shortDesc : 'Chua co mo ta ngan.';
                const price = product.salePrice && product.salePrice > 0 ? product.salePrice : product.price;

                card.innerHTML =
                    '<img src="' + image + '" alt="' + product.name + '" onerror="this.src=\'/resources/images/header/logo.png\'">' +
                    '<div>' +
                        '<h4>' + product.name + '</h4>' +
                        '<p>' + shortDesc + '</p>' +
                        '<div class="product-price">' + formatPrice(price) + '</div>' +
                    '</div>';
                provinceProductsEl.appendChild(card);
            });
        }

        function renderMarkers(markers) {
            resetLiveMarkers();

            if (!markers || markers.length === 0) {
                return;
            }

            markers.forEach(function (marker) {
                const circle = L.circleMarker([marker.latitude, marker.longitude], {
                    radius: 8,
                    color: marker.color || '#176d38',
                    fillColor: marker.color || '#176d38',
                    fillOpacity: 0.9,
                    weight: 2
                }).bindPopup(
                    '<strong>' + marker.title + '</strong><br>' +
                    '<span>' + (marker.description ? marker.description : 'Chua co mo ta.') + '</span>'
                );

                circle.addTo(map);
                liveMarkers.push(circle);
            });
        }

        function updateProvincePanel(featureId) {
            const data = provinceData[featureId];
            if (!data) {
                provinceNameEl.textContent = 'Tinh chua duoc anh xa';
                provinceProductsEl.innerHTML = '<div class="empty-state">Chua co san pham de hien thi.</div>';
                resetLiveMarkers();
                return;
            }

            provinceNameEl.textContent = data.name;
            renderProducts(data.products || []);
            renderMarkers(data.markers || []);
        }

        function clearActiveLayer() {
            if (activeLayer && geoJsonLayer) {
                geoJsonLayer.resetStyle(activeLayer);
                activeLayer = null;
            }
        }

        function activateLayer(layer) {
            clearActiveLayer();
            activeLayer = layer;
            layer.setStyle(hoverStyle);
            if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                layer.bringToFront();
            }
        }

        function clamp(value, min, max) {
            return Math.max(min, Math.min(max, value));
        }

        function lerp(start, end, progress) {
            return start + (end - start) * progress;
        }

        function getScrollProgress() {
            if (!mapStoryEl) return 0;
            const headerOffset = 130;
            const rect = mapStoryEl.getBoundingClientRect();
            const totalScrollable = Math.max(1, mapStoryEl.offsetHeight - (window.innerHeight - headerOffset));
            const travelled = clamp((-rect.top) + headerOffset, 0, totalScrollable);
            return travelled / totalScrollable;
        }

        function updateStoryCamera() {
            if (!mapBounds) {
                return;
            }

            if (window.innerWidth <= 1100) {
                map.fitBounds(mapBounds, { padding: [18, 18] });
                return;
            }

            const progress = getScrollProgress();
            const latSpan = mapBounds.getNorth() - mapBounds.getSouth();
            const lngSpan = mapBounds.getEast() - mapBounds.getWest();
            const centerLng = (mapBounds.getEast() + mapBounds.getWest()) / 2;

            // Đã đổi dấu trừ (-) thành cộng (+) để đẩy tâm camera sang phải, từ đó ép bản đồ hiển thị sang lề trái
            const northFocus = {
                lat: mapBounds.getNorth() - latSpan * 0.15,
                lng: centerLng + lngSpan * 0.18 
            };

            const southFocus = {
                lat: mapBounds.getSouth() + latSpan * 0.16,
                lng: centerLng + lngSpan * 0.15 
            };

            map.setView([
                lerp(northFocus.lat, southFocus.lat, progress),
                lerp(northFocus.lng, southFocus.lng, progress)
            ], fixedStoryZoom, { animate: false });
        }

        fetch('/data/vietnam-provinces.json')
            .then(function (response) { return response.json(); })
            .then(function (geoJson) {
                geoJsonLayer = L.geoJSON(geoJson, {
                    style: defaultStyle,
                    onEachFeature: function (feature, layer) {
                        const featureId = feature.properties ? feature.properties.id : null;
                        const featureName = feature.properties ? feature.properties.name : 'Khong ro ten';

                        layer.bindTooltip(featureName, {
                            sticky: true,
                            direction: 'top',
                            opacity: 0.92
                        });

                        layer.on({
                            mouseover: function () {
                                activateLayer(layer);
                                if (featureId) {
                                    updateProvincePanel(featureId);
                                }
                            },
                            click: function () {
                                activateLayer(layer);
                                if (featureId) {
                                    updateProvincePanel(featureId);
                                }
                            }
                        });
                    }
                }).addTo(map);

                const bounds = geoJsonLayer.getBounds();
                if (bounds.isValid()) {
                    mapBounds = bounds;
                    map.fitBounds(bounds, { padding: [40, 60] });
                    fixedStoryZoom = Math.min(9.95, map.getZoom() + 1.2);
                    map.setMinZoom(fixedStoryZoom);
                    map.setMaxZoom(fixedStoryZoom);
                    updateStoryCamera();
                    window.addEventListener('scroll', updateStoryCamera, { passive: true });
                    window.addEventListener('resize', function () {
                        map.invalidateSize();
                        updateStoryCamera();
                    });
                }
            })
            .catch(function () {
                provinceNameEl.textContent = 'Khong tai duoc du lieu ban do';
                provinceDescriptionEl.textContent = 'Kiem tra lai file /data/vietnam-provinces.json va ResourceHandler cua project.';
            });
    </script>
</body>

</html>
