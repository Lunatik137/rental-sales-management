<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản Phẩm - Cho Thuê Đồ Dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background-color: #f5f6fa;
            color: #2f3542;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .page-header {
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-size: 36px;
            color: #2f3542;
            margin-bottom: 10px;
        }

        .filters {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .filter-group {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            align-items: center;
        }

        .filter-group label {
            font-weight: bold;
            color: #666;
        }

        .filter-group select,
        .filter-group input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .filter-group input[type="text"] {
            flex: 1;
            min-width: 200px;
        }

        .btn-search {
            padding: 10px 20px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-search:hover {
            background: #5568d3;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
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

        .stock-info {
            font-size: 12px;
            color: #666;
            margin-bottom: 10px;
        }

        .stock-available {
            color: #28a745;
        }

        .stock-low {
            color: #ffc107;
        }

        .stock-out {
            color: #dc3545;
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

        .no-products {
            text-align: center;
            padding: 60px 20px;
            background: white;
            border-radius: 10px;
        }

        .no-products h3 {
            color: #666;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1>Tất Cả Sản Phẩm</h1>
        </div>

        <!-- Filters -->
        <div class="filters">
            <form method="GET" action="products" class="filter-group">
                <div>
                    <label>Danh mục:</label>
                    <select name="category" onchange="this.form.submit()">
                        <option value="">Tất cả</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id}" 
                                <c:if test="${selectedCategoryId == category.id}">selected</c:if>>
                                ${category.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div style="flex: 1;">
                    <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm..." 
                           value="${keyword != null ? keyword : ''}">
                </div>
                <button type="submit" class="btn-search">Tìm kiếm</button>
            </form>
        </div>

        <!-- Products Grid -->
        <c:choose>
            <c:when test="${empty products}">
                <div class="no-products">
                    <h3>Không tìm thấy sản phẩm nào</h3>
                    <p>Vui lòng thử lại với từ khóa hoặc danh mục khác.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="products-grid">
                    <c:forEach var="product" items="${products}">
                        <div class="product-card">
                            <div class="product-image">
                                <c:choose>
                                    <c:when test="${not empty product.imageUrl}">
                                        <img src="${product.imageUrl}" alt="${product.name}" 
                                             style="width: 100%; height: 100%; object-fit: cover;">
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
                                
                                <div class="stock-info">
                                    <c:choose>
                                        <c:when test="${product.stock > 10}">
                                            <span class="stock-available">✓ Còn hàng (${product.stock})</span>
                                        </c:when>
                                        <c:when test="${product.stock > 0}">
                                            <span class="stock-low">⚠ Sắp hết (${product.stock})</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="stock-out">✗ Hết hàng</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="product-price">
                                    <c:if test="${product.type == 'sale' || product.type == 'both'}">
                                        <div class="price-item">
                                            <div class="price-label">Giá bán</div>
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
                                            <div class="price-label">Giá thuê/ngày</div>
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
                                <a href="products?action=detail&id=${product.id}" class="view-btn">Xem chi tiết</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>

