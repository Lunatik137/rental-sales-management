<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản Phẩm - DIGITECH</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background-color: #f5f6fa;
            color: #2f3542;
        }

        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 20px;
        }

        /* Breadcrumbs */
        .breadcrumbs {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
            font-size: 14px;
            color: #666;
        }

        .breadcrumbs a {
            color: #667eea;
            text-decoration: none;
        }

        .breadcrumbs a:hover {
            text-decoration: underline;
        }

        /* Left Sidebar Filters */
        .sidebar {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            height: fit-content;
            position: sticky;
            top: 100px;
        }

        .filter-section {
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }

        .filter-section:last-child {
            border-bottom: none;
        }

        .filter-section h3 {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #2f3542;
        }

        .filter-checkbox {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 10px;
            cursor: pointer;
        }

        .filter-checkbox input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .filter-checkbox label {
            cursor: pointer;
            font-size: 14px;
            color: #666;
            user-select: none;
        }

        .filter-checkbox:hover label {
            color: #667eea;
        }

        .color-swatches {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 8px;
        }

        .color-swatch {
            width: 40px;
            height: 40px;
            border-radius: 4px;
            border: 2px solid #e0e0e0;
            cursor: pointer;
            transition: all 0.3s;
        }

        .color-swatch:hover {
            transform: scale(1.1);
            border-color: #667eea;
        }

        .color-swatch.selected {
            border-color: #667eea;
            border-width: 3px;
        }

        /* Main Content Area */
        .content-area {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .sort-section {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sort-section label {
            font-size: 14px;
            color: #666;
        }

        .sort-section select {
            padding: 8px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
        }

        .sort-section select:focus {
            outline: none;
            border-color: #667eea;
        }

        /* Promotional Banner */
        .promo-banner-large {
            background: linear-gradient(135deg, #1e3a5f 0%, #2563eb 100%);
            border-radius: 12px;
            padding: 40px;
            margin-bottom: 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .promo-banner-large::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        }

        .promo-banner-content {
            flex: 1;
            z-index: 1;
        }

        .promo-banner-content h2 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .promo-banner-content p {
            font-size: 16px;
            opacity: 0.9;
            margin-bottom: 20px;
        }

        .promo-banner-btn {
            background: white;
            color: #1e3a5f;
            padding: 12px 30px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            transition: transform 0.3s;
        }

        .promo-banner-btn:hover {
            transform: scale(1.05);
        }

        .promo-banner-image {
            flex: 1;
            text-align: right;
            z-index: 1;
        }

        .promo-banner-image img {
            max-width: 100%;
            height: auto;
            max-height: 200px;
            object-fit: contain;
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
        }

        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 64px;
            position: relative;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: #dc3545;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: bold;
        }

        .product-info {
            padding: 20px;
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .product-type-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 11px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .type-sale {
            background: #d4edda;
            color: #155724;
        }

        .type-rental {
            background: #cce5ff;
            color: #004085;
        }

        .type-both {
            background: #fff3cd;
            color: #856404;
        }

        .product-info h3 {
            margin: 0 0 10px 0;
            color: #2f3542;
            font-size: 16px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height: 48px;
        }

        .product-rating {
            color: #ffc107;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .product-price {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }

        .price-item {
            font-size: 14px;
        }

        .price-label {
            font-size: 11px;
            color: #999;
        }

        .price-value {
            font-size: 18px;
            font-weight: bold;
            color: #667eea;
        }

        .add-to-cart-btn {
            width: 90%;
            padding: 12px;
            background: #667eea;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s;
            display: block;
            margin-top: auto;
            align-self: center;
        }

        .add-to-cart-btn:hover {
            background: #5568d3;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 40px;
            padding: 20px 0;
        }

        .pagination a,
        .pagination span {
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            display: inline-block;
            min-width: 40px;
            text-align: center;
        }

        .pagination a {
            background: white;
            color: #667eea;
            border: 1px solid #e0e0e0;
        }

        .pagination a:hover {
            background: #667eea;
            color: white;
            border-color: #667eea;
        }

        .pagination .active {
            background: #667eea;
            color: white;
            border: 1px solid #667eea;
        }

        .pagination .disabled {
            background: #f0f0f0;
            color: #999;
            border: 1px solid #e0e0e0;
            cursor: not-allowed;
            pointer-events: none;
        }

        /* Newsletter Section */
        .newsletter {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 60px 20px;
            text-align: center;
            color: white;
            margin: 60px 0;
        }

        .newsletter-content {
            max-width: 600px;
            margin: 0 auto;
        }

        .newsletter h2 {
            font-size: 28px;
            margin-bottom: 15px;
        }

        .newsletter p {
            font-size: 16px;
            margin-bottom: 30px;
            opacity: 0.9;
        }

        .newsletter-form {
            display: flex;
            gap: 10px;
            max-width: 500px;
            margin: 0 auto;
        }

        .newsletter-form input {
            flex: 1;
            padding: 15px 20px;
            border: none;
            border-radius: 30px;
            font-size: 14px;
        }

        .newsletter-form button {
            padding: 15px 30px;
            background: white;
            color: #667eea;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .newsletter-form button:hover {
            transform: scale(1.05);
        }

        @media (max-width: 968px) {
            .main-content {
                grid-template-columns: 1fr;
            }

            .sidebar {
                position: static;
            }

            .products-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 640px) {
            .products-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <a href="home">Trang chủ</a> > <span>Tất cả sản phẩm</span>
    </div>

    <div class="main-content">
        <!-- Left Sidebar Filters -->
        <aside class="sidebar">
            <form method="GET" action="products" id="filterForm">
                <!-- Product Type Filter -->
                <div class="filter-section">
                    <h3>Loại sản phẩm</h3>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="type-action" name="type" value="rental">
                        <label for="type-action">Camera hành động</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="type-camcorder" name="type" value="rental">
                        <label for="type-camcorder">Máy quay phim</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="type-lens" name="type" value="sale">
                        <label for="type-lens">Ống kính</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="type-camera" name="type" value="sale">
                        <label for="type-camera">Máy ảnh</label>
                    </div>
                </div>

                <!-- Brand Filter -->
                <div class="filter-section">
                    <h3>Thương hiệu</h3>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-dji" name="brand" value="DJI">
                        <label for="brand-dji">DJI</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-gopro" name="brand" value="GoPro">
                        <label for="brand-gopro">Gopro</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-insta360" name="brand" value="Insta360">
                        <label for="brand-insta360">Insta360</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-zcam" name="brand" value="Z Cam">
                        <label for="brand-zcam">Z Cam</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-blackmagic" name="brand" value="Blackmagic">
                        <label for="brand-blackmagic">Blackmagic</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-sony" name="brand" value="Sony">
                        <label for="brand-sony">Sony</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-samyang" name="brand" value="Samyang">
                        <label for="brand-samyang">Samyang</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-nikon" name="brand" value="Nikon">
                        <label for="brand-nikon">Nikon</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="brand-canon" name="brand" value="Canon">
                        <label for="brand-canon">Canon</label>
                    </div>
                </div>

                <!-- Color Filter -->
                <div class="filter-section">
                    <h3>Màu sắc</h3>
                    <div class="color-swatches">
                        <div class="color-swatch" style="background: #ffffff; border: 1px solid #ccc;" data-color="white"></div>
                        <div class="color-swatch" style="background: #f5f5f5;" data-color="light-gray"></div>
                        <div class="color-swatch" style="background: #d3d3d3;" data-color="gray"></div>
                        <div class="color-swatch" style="background: #808080;" data-color="dark-gray"></div>
                        <div class="color-swatch" style="background: #000000;" data-color="black"></div>
                        <div class="color-swatch" style="background: #0000ff;" data-color="blue"></div>
                        <div class="color-swatch" style="background: #0066cc;" data-color="dark-blue"></div>
                        <div class="color-swatch" style="background: #00ff00;" data-color="green"></div>
                        <div class="color-swatch" style="background: #008000;" data-color="dark-green"></div>
                        <div class="color-swatch" style="background: #ffff00;" data-color="yellow"></div>
                        <div class="color-swatch" style="background: #ffa500;" data-color="orange"></div>
                        <div class="color-swatch" style="background: #ff0000;" data-color="red"></div>
                        <div class="color-swatch" style="background: #ff69b4;" data-color="pink"></div>
                        <div class="color-swatch" style="background: #800080;" data-color="purple"></div>
                        <div class="color-swatch" style="background: #8b4513;" data-color="brown"></div>
                        <div class="color-swatch" style="background: #c0c0c0;" data-color="silver"></div>
                    </div>
                </div>

                <!-- Material Filter -->
                <div class="filter-section">
                    <h3>Chất liệu</h3>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="material-metal" name="material" value="metal">
                        <label for="material-metal">Kim loại</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="material-metal-glass" name="material" value="metal-glass">
                        <label for="material-metal-glass">Kim loại và kính</label>
                    </div>
                </div>

                <!-- Price Range Filter -->
                <div class="filter-section">
                    <h3>Chọn mức giá</h3>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="price-under5m" name="price" value="under5m">
                        <label for="price-under5m">Giá dưới 5.000.000₫</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="price-5m-10m" name="price" value="5m-10m">
                        <label for="price-5m-10m">5.000.000₫ - 10.000.000₫</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="price-10m-20m" name="price" value="10m-20m">
                        <label for="price-10m-20m">10.000.000₫ - 20.000.000₫</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="price-20m-50m" name="price" value="20m-50m">
                        <label for="price-20m-50m">20.000.000₫ - 50.000.000₫</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="price-50m-100m" name="price" value="50m-100m">
                        <label for="price-50m-100m">50.000.000₫ - 100.000.000₫</label>
                    </div>
                    <div class="filter-checkbox">
                        <input type="checkbox" id="price-over100m" name="price" value="over100m">
                        <label for="price-over100m">Giá trên 100.000.000₫</label>
                    </div>
        </div>

                <input type="hidden" name="category" value="${selectedCategoryId != null ? selectedCategoryId : ''}">
                <input type="hidden" name="keyword" value="${keyword != null ? keyword : ''}">
            </form>
        </aside>

        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Content Header with Sort -->
            <div class="content-header">
                <div class="sort-section">
                    <label>Sắp xếp theo:</label>
                    <select onchange="window.location.href=this.value">
                        <option value="products?sort=default">Mặc định</option>
                        <option value="products?sort=price-asc">Giá tăng dần</option>
                        <option value="products?sort=price-desc">Giá giảm dần</option>
                        <option value="products?sort=name-asc">Tên A-Z</option>
                        <option value="products?sort=name-desc">Tên Z-A</option>
                    </select>
                </div>
            </div>

            <!-- Promotional Banner -->
            <div class="promo-banner-large">
                <div class="promo-banner-content">
                    <h2>DJI RONIN 4D</h2>
                    <p>The Future Is Rolling</p>
                    <a href="products?keyword=DJI" class="promo-banner-btn">Xem thêm</a>
                </div>
                <div class="promo-banner-image">
                    <img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400&h=300&fit=crop" alt="DJI Ronin 4D" />
                </div>
        </div>

        <!-- Products Grid -->
        <c:choose>
            <c:when test="${empty products}">
                    <div style="text-align: center; padding: 80px 20px;">
                        <h3 style="color: #666;">Không tìm thấy sản phẩm nào</h3>
                        <p style="color: #999;">Vui lòng thử lại với từ khóa hoặc danh mục khác.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="products-grid">
                    <c:forEach var="product" items="${products}">
                        <div class="product-card">
                            <div class="product-image">
                                <c:choose>
                                    <c:when test="${not empty product.imageUrl}">
                                        <img src="${product.imageUrl}" alt="${product.name}" style="width: 100%; height: 100%; object-fit: cover;">
                                    </c:when>
                                    <c:otherwise>
                                        📦
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${product.stock <= 5 && product.stock > 0}">
                                    <span class="product-badge">Sắp hết</span>
                                </c:if>
                            </div>
                            <div class="product-info">
                                <span class="product-type-badge 
                                    <c:choose>
                                        <c:when test="${product.type == 'sale'}">type-sale</c:when>
                                        <c:when test="${product.type == 'rental'}">type-rental</c:when>
                                        <c:otherwise>type-both</c:otherwise>
                                    </c:choose>">
                                    <c:choose>
                                        <c:when test="${product.type == 'sale'}">Bán</c:when>
                                        <c:when test="${product.type == 'rental'}">Thuê</c:when>
                                        <c:otherwise>Bán & Thuê</c:otherwise>
                                    </c:choose>
                                </span>
                                <h3>${product.name}</h3>
                                <c:if test="${not empty product.category and not empty product.category.name}">
                                    <div style="font-size: 12px; color: #999; margin-top: -5px; margin-bottom: 8px; font-weight: 500;">
                                        ${product.category.name}
                                    </div>
                                </c:if>
                                <div class="product-rating">⭐⭐⭐⭐⭐</div>
                                <div class="product-price">
                                    <c:if test="${product.type == 'sale' || product.type == 'both'}">
                                        <div class="price-item">
                                            <div class="price-label">Bán</div>
                                            <div class="price-value">
                                                <c:choose>
                                                    <c:when test="${product.salePrice != null && product.salePrice > 0}">
                                                        <fmt:formatNumber value="${product.salePrice}" type="number" /> đ
                                                    </c:when>
                                                    <c:otherwise>-</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${product.type == 'rental' || product.type == 'both'}">
                                        <div class="price-item">
                                            <div class="price-label">Thuê/ngày</div>
                                            <div class="price-value">
                                                <c:choose>
                                                    <c:when test="${product.rentalPrice != null && product.rentalPrice > 0}">
                                                        <fmt:formatNumber value="${product.rentalPrice}" type="number" /> đ
                                                    </c:when>
                                                    <c:otherwise>-</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                                <a href="products?action=detail&id=${product.id}" class="add-to-cart-btn">Xem chi tiết</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
                <div class="pagination">
                    <c:choose>
                        <c:when test="${currentPage > 1}">
                            <a href="products?page=${currentPage - 1}<c:if test='${selectedCategoryId != null}'>&category=${selectedCategoryId}</c:if><c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">‹</a>
                        </c:when>
                        <c:otherwise>
                            <span class="disabled">‹</span>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span class="active">${i}</span>
                            </c:when>
                            <c:when test="${i <= 3 || i > totalPages - 3 || (i >= currentPage - 1 && i <= currentPage + 1)}">
                                <a href="products?page=${i}<c:if test='${selectedCategoryId != null}'>&category=${selectedCategoryId}</c:if><c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">${i}</a>
                            </c:when>
                            <c:when test="${i == 4 || i == totalPages - 3}">
                                <span>...</span>
                            </c:when>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${currentPage < totalPages}">
                            <a href="products?page=${currentPage + 1}<c:if test='${selectedCategoryId != null}'>&category=${selectedCategoryId}</c:if><c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">›</a>
                        </c:when>
                        <c:otherwise>
                            <span class="disabled">›</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Newsletter Section -->
    <div class="newsletter">
        <div class="newsletter-content">
            <h2>ĐĂNG KÝ ĐỂ NHẬN TIN TỨC KHUYẾN MÃI MỚI NHẤT</h2>
            <p>Bạn hãy để lại email để không bỏ lỡ hàng ngàn sản phẩm và các chương trình khuyến mại khác</p>
            <form class="newsletter-form" method="POST" action="#">
                <input type="email" placeholder="Nhập email của bạn" required>
                <button type="submit">Gửi</button>
            </form>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />

    <script>
        // Filter form submission
        document.querySelectorAll('.filter-checkbox input, .color-swatch').forEach(function(element) {
            element.addEventListener('change', function() {
                document.getElementById('filterForm').submit();
            });
        });

        document.querySelectorAll('.color-swatch').forEach(function(swatch) {
            swatch.addEventListener('click', function() {
                document.querySelectorAll('.color-swatch').forEach(function(s) {
                    s.classList.remove('selected');
                });
                this.classList.add('selected');
                document.getElementById('filterForm').submit();
            });
        });

        // Lazy loading
        document.addEventListener('DOMContentLoaded', function() {
            const lazyImages = document.querySelectorAll('.product-image img');
            
            if ('IntersectionObserver' in window) {
                const imageObserver = new IntersectionObserver(function(entries, observer) {
                    entries.forEach(function(entry) {
                        if (entry.isIntersecting) {
                            const img = entry.target;
                            if (img.dataset.src) {
                                img.src = img.dataset.src;
                                img.removeAttribute('data-src');
                            }
                            observer.unobserve(img);
                        }
                    });
                });

                lazyImages.forEach(function(img) {
                    imageObserver.observe(img);
                });
            }
        });
    </script>
</body>
</html>
