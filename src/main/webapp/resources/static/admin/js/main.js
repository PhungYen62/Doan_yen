(function ($) {
    "use strict";

    function normalizeText(value) {
        return (value || "")
            .toString()
            .normalize("NFD")
            .replace(/[\u0300-\u036f]/g, "")
            .toLowerCase()
            .trim();
    }

    function initTableFilters() {
        document.querySelectorAll("[data-filter-toolbar]").forEach(function (toolbar) {
            var tableSelector = toolbar.getAttribute("data-target");
            if (!tableSelector) return;

            var table = document.querySelector(tableSelector);
            if (!table || !table.tBodies.length) return;

            var tbody = table.tBodies[0];
            var rows = Array.from(tbody.querySelectorAll("tr")).filter(function (row) {
                return !row.hasAttribute("data-filter-empty");
            });

            if (!rows.length) return;

            var searchInput = toolbar.querySelector("[data-filter-search]");
            var selects = Array.from(toolbar.querySelectorAll("[data-filter-column]"));
            var emptyRow = tbody.querySelector("[data-filter-empty]");

            if (!emptyRow) {
                emptyRow = document.createElement("tr");
                emptyRow.setAttribute("data-filter-empty", "true");
                emptyRow.style.display = "none";

                var cell = document.createElement("td");
                cell.colSpan = table.querySelectorAll("thead th").length || 1;
                cell.className = "text-center text-muted py-4";
                cell.textContent = "Không có dữ liệu phù hợp với bộ lọc.";
                emptyRow.appendChild(cell);
                tbody.appendChild(emptyRow);
            }

            function matchesSelect(row, select) {
                var expected = normalizeText(select.value);
                if (!expected) return true;

                var columnIndex = parseInt(select.getAttribute("data-filter-column"), 10);
                if (Number.isNaN(columnIndex) || !row.children[columnIndex]) return true;

                var actual = normalizeText(row.children[columnIndex].textContent);
                return actual.indexOf(expected) !== -1;
            }

            function applyFilters() {
                var keyword = searchInput ? normalizeText(searchInput.value) : "";
                var visibleCount = 0;

                rows.forEach(function (row) {
                    var rowText = normalizeText(row.textContent);
                    var matchesKeyword = !keyword || rowText.indexOf(keyword) !== -1;
                    var matchesAllSelects = selects.every(function (select) {
                        return matchesSelect(row, select);
                    });

                    var visible = matchesKeyword && matchesAllSelects;
                    row.style.display = visible ? "" : "none";
                    if (visible) visibleCount++;
                });

                emptyRow.style.display = visibleCount === 0 ? "" : "none";
            }

            if (searchInput) {
                searchInput.addEventListener("input", applyFilters);
            }

            selects.forEach(function (select) {
                select.addEventListener("change", applyFilters);
            });

            applyFilters();
        });
    }

    // Spinner
    setTimeout(function () {
        if ($("#spinner").length > 0) {
            $("#spinner").removeClass("show");
        }
    }, 1);

    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $(".back-to-top").fadeIn("slow");
        } else {
            $(".back-to-top").fadeOut("slow");
        }
    });

    $(".back-to-top").click(function () {
        $("html, body").animate({ scrollTop: 0 }, 1500, "easeInOutExpo");
        return false;
    });

    // Sidebar Toggler
    $(".sidebar-toggler").click(function () {
        $(".sidebar, .content").toggleClass("open");
        return false;
    });

    // Progress Bar
    $(".pg-bar").waypoint(function () {
        $(".progress .progress-bar").each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + "%");
        });
    }, { offset: "80%" });

    // Calendar
    if ($("#calender").length) {
        $("#calender").datetimepicker({
            inline: true,
            format: "L"
        });
    }

    // Testimonials carousel
    if ($(".testimonial-carousel").length) {
        $(".testimonial-carousel").owlCarousel({
            autoplay: true,
            smartSpeed: 1000,
            items: 1,
            dots: true,
            loop: true,
            nav: false
        });
    }

    // Revenue chart on dashboard
    if (document.getElementById("salse-revenue")) {
        $.ajax({
            url: "/api/revenue/last7days",
            method: "GET",
            success: function (data) {
                var labels = data.map(function (item) { return item.day; });
                var totals = data.map(function (item) { return item.total; });
                renderRevenueChart(labels, totals);
            },
            error: function (err) {
                console.error("Lấy dữ liệu thất bại", err);
            }
        });
    }

    function renderRevenueChart(labels, totals) {
        var canvas = document.getElementById("salse-revenue");
        if (!canvas) return;

        var ctx = canvas.getContext("2d");
        new Chart(ctx, {
            type: "line",
            data: {
                labels: labels,
                datasets: [{
                    label: "Doanh thu",
                    data: totals,
                    backgroundColor: "rgba(0, 156, 255, .3)",
                    borderColor: "rgba(0, 156, 255, .9)",
                    fill: true,
                    tension: 0.35
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    initTableFilters();
})(jQuery);
