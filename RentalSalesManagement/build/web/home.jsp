<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Cho Thuê Đồ Dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background-color: #f5f6fa;
            color: #2f3542;
        }

        .hero {
            height: 500px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
        }

        .hero-content h1 {
            font-size: 48px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero-content p {
            font-size: 20px;
            margin-bottom: 30px;
        }

        .hero-btn {
            padding: 15px 40px;
            background: #ffd700;
            color: #333;
            text-decoration: none;
            border-radius: 30px;
            font-size: 18px;
            font-weight: bold;
            display: inline-block;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .hero-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .section-title {
            text-align: center;
            font-size: 36px;
            margin-bottom: 40px;
            color: #2f3542;
        }

        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 60px;
        }

        .category-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            color: inherit;
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }

        .category-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .category-card h3 {
            color: #667eea;
            margin-bottom: 10px;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }

        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
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
            font-size: 48px;
        }

        .product-info {
            padding: 20px;
        }

        .product-info h3 {
            margin: 0 0 10px 0;
            color: #2f3542;
            font-size: 18px;
        }

        .product-info p {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-price {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .price-item {
            flex: 1;
        }

        .price-label {
            font-size: 12px;
            color: #999;
        }

        .price-value {
            font-size: 18px;
            font-weight: bold;
            color: #667eea;
        }

        .product-type {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            margin-bottom: 10px;
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

        .view-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background: #667eea;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .view-btn:hover {
            background: #5568d3;
        }

        .view-all {
            text-align: center;
            margin-top: 40px;
        }

        .view-all-btn {
            padding: 15px 40px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-size: 18px;
            font-weight: bold;
            display: inline-block;
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hero">
        <div class="hero-content">
            <h1>Cho Thuê Đồ Dùng</h1>
            <p>Giải pháp tiết kiệm cho mọi nhu cầu của bạn</p>
            <a href="products" class="hero-btn">Xem Sản Phẩm</a>
        </div>
    </div>

    <!-- Categories Section -->
    <div class="container">
        <h2 class="section-title">Danh Mục Sản Phẩm</h2>
        <div class="categories">
            <c:forEach var="category" items="${categories}">
                <a href="products?category=${category.id}" class="category-card">
                    <div class="category-icon">📦</div>
                    <h3>${category.name}</h3>
                    <p>${category.description}</p>
                </a>
            </c:forEach>
        </div>

        <!-- Featured Products Section -->
        <h2 class="section-title">Sản Phẩm Nổi Bật</h2>
        <div class="products-grid">
            <c:forEach var="product" items="${featuredProducts}">
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
                    </div>
                    <div class="product-info">
                        <span class="product-type 
                            <c:choose>
                                <c:when test="${product.type == 'sale'}">type-sale</c:when>
                                <c:when test="${product.type == 'rental'}">type-rental</c:when>
                                <c:otherwise>type-both</c:otherwise>
                            </c:choose>">
                            <c:choose>
                                <c:when test="${product.type == 'sale'}">Chỉ bán</c:when>
                                <c:when test="${product.type == 'rental'}">Chỉ thuê</c:when>
                                <c:otherwise>Bán & Thuê</c:otherwise>
                            </c:choose>
                        </span>
                        <h3>${product.name}</h3>
                        <p>${product.description}</p>
                        <div class="product-price">
                            <c:if test="${product.type == 'sale' || product.type == 'both'}">
                                <div class="price-item">
                                    <div class="price-label">Giá bán</div>
                                    <div class="price-value">
                                        <c:choose>
                                            <c:when test="${product.salePrice != null && product.salePrice > 0}">
                                                ${product.salePrice} đ
                                            </c:when>
                                            <c:otherwise>-</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${product.type == 'rental' || product.type == 'both'}">
                                <div class="price-item">
                                    <div class="price-label">Giá thuê/ngày</div>
                                    <div class="price-value">
                                        <c:choose>
                                            <c:when test="${product.rentalPrice != null && product.rentalPrice > 0}">
                                                ${product.rentalPrice} đ
                                            </c:when>
                                            <c:otherwise>-</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <a href="products?action=detail&id=${product.id}" class="view-btn">Xem chi tiết</a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="view-all">
            <a href="products" class="view-all-btn">Xem Tất Cả Sản Phẩm</a>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>

