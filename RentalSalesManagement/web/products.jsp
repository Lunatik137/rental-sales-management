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
            text-align: center;
        }

        .page-header h1 {
            font-size: 36px;
            color: #2f3542;
            margin-bottom: 10px;
        }

        .page-subtitle {
            color: #666;
            font-size: 16px;
        }

        .filters {
            background: white;
            padding: 25px;
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
            color: #333;
        }

        .filter-group select,
        .filter-group input {
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .filter-group select:focus,
        .filter-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        .filter-group input[type="text"] {
            flex: 1;
            min-width: 250px;
        }

        .btn-search {
            padding: 12px 30px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: background 0.3s, transform 0.2s;
        }

        .btn-search:hover {
            background: #5568d3;
            transform: translateY(-2px);
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
        }

        .product-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            position: relative;
            animation: slideUp 0.5s ease-out;
            animation-fill-mode: both;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .product-card:nth-child(1) { animation-delay: 0.1s; }
        .product-card:nth-child(2) { animation-delay: 0.2s; }
        .product-card:nth-child(3) { animation-delay: 0.3s; }
        .product-card:nth-child(4) { animation-delay: 0.4s; }

        .product-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
        }

        .product-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
            background: linear-gradient(135deg, #f0f0f0 0%, #e0e0e0 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 64px;
            position: relative;
        }

        .product-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: #dc3545;
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 11px;
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
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            margin-bottom: 12px;
            font-weight: bold;
        }

        .type-sale {
            background: #e6f6ed;
            color: #1d6a35;
        }

        .type-rental {
            background: #dcefff;
            color: #0f5aa0;
        }

        .type-both {
            background: #fff3d9;
            color: #8b5a00;
        }

        .product-info h3 {
            margin: 0 0 10px 0;
            color: #2f3542;
            font-size: 18px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height: 54px;
        }

        .product-rating {
            color: #ffc107;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .product-price {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }

        .price-item {
            flex: 1;
            min-width: 100px;
        }

        .price-label {
            font-size: 11px;
            color: #999;
            text-transform: uppercase;
            margin-bottom: 4px;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        .price-value {
            font-size: 20px;
            font-weight: bold;
            color: #0b6fd1;
        }

        .stock-info {
            font-size: 12px;
            margin-bottom: 12px;
            padding: 8px 12px;
            border-radius: 6px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .stock-available {
            background: #e6f6ed;
            color: #1d6a35;
        }

        .stock-low {
            background: #fff3d9;
            color: #8b5a00;
        }

        .stock-out {
            background: #fbe3e3;
            color: #b02a37;
        }

        .view-btn {
            display: block;
            width: 90%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            margin-top: auto;
        }

        .view-btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }

        .view-btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .view-btn:hover {
            background: linear-gradient(135deg, #5568d3 0%, #6a3d8f 100%);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .no-products {
            text-align: center;
            padding: 80px 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .no-products h3 {
            color: #666;
            margin-bottom: 10px;
            font-size: 24px;
        }

        .no-products p {
            color: #999;
            font-size: 16px;
        }

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
            padding: 10px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
            display: inline-block;
        }

        .pagination a {
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
        }

        .pagination a:hover {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        }

        .pagination .active {
            background: #667eea;
            color: white;
            border: 2px solid #667eea;
        }

        .pagination .disabled {
            background: #f0f0f0;
            color: #999;
            border: 2px solid #e0e0e0;
            cursor: not-allowed;
            pointer-events: none;
        }

        .pagination-info {
            text-align: center;
            margin-top: 20px;
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1>Tất Cả Sản Phẩm</h1>
            <p class="page-subtitle">Khám phá bộ sưu tập sản phẩm đa dạng của chúng tôi</p>
        </div>

        <!-- Filters -->
        <div class="filters">
            <form method="GET" action="products" class="filter-group">
                <div>
                    <label>Danh mục:</label>
                    <select name="category" onchange="this.form.submit()">
                        <option value="">Tất cả danh mục</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id}"
                                <c:if test="${selectedCategoryId == category.id}">selected</c:if>>
                                ${category.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div style="flex: 1;">
                    <input type="text" name="keyword" placeholder="🔍 Tìm kiếm sản phẩm..." 
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
                                <c:if test="${product.stock <= 5 && product.stock > 0}">
                                    <span class="product-badge">Sắp hết</span>
                                </c:if>
                                <c:if test="${product.stock == 0}">
                                    <span class="product-badge" style="background: #6c757d;">Hết hàng</span>
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
                                        <c:when test="${product.type == 'sale'}">Chỉ bán</c:when>
                                        <c:when test="${product.type == 'rental'}">Chỉ thuê</c:when>
                                        <c:otherwise>Bán & Thuê</c:otherwise>
                                    </c:choose>
                                </span>
                                <h3>${product.name}</h3>
                                <div class="product-rating">⭐⭐⭐⭐⭐</div>
                                
                                <c:if test="${product.stock <= 10 && product.stock > 0}">
                                    <div class="stock-info stock-low">
                                        <span>⚠</span>
                                        <span>Sắp hết (${product.stock})</span>
                                    </div>
                                </c:if>
                                <c:if test="${product.stock == 0}">
                                    <div class="stock-info stock-out">
                                        <span>✗</span>
                                        <span>Hết hàng</span>
                                    </div>
                                </c:if>

                                <div class="product-price">
                                    <c:if test="${product.type == 'sale' || product.type == 'both'}">
                                        <div class="price-item">
                                            <div class="price-label">GIÁ BÁN</div>
                                            <div class="price-value">
                                                <c:choose>
                                                    <c:when test="${product.salePrice != null && product.salePrice > 0}">
                                                        <fmt:formatNumber value="${product.salePrice}" type="number" /> ₫
                                                    </c:when>
                                                    <c:otherwise>-</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${product.type == 'rental' || product.type == 'both'}">
                                        <div class="price-item">
                                            <div class="price-label">THUÊ/NGÀY</div>
                                            <div class="price-value">
                                                <c:choose>
                                                    <c:when test="${product.rentalPrice != null && product.rentalPrice > 0}">
                                                        <fmt:formatNumber value="${product.rentalPrice}" type="number" /> ₫
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

        <!-- Pagination -->
        <c:if test="${totalPages > 1}">
            <div class="pagination">
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a href="products?page=${currentPage - 1}<c:if test='${selectedCategoryId != null}'>&category=${selectedCategoryId}</c:if><c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">‹ Trước</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">‹ Trước</span>
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
                        <a href="products?page=${currentPage + 1}<c:if test='${selectedCategoryId != null}'>&category=${selectedCategoryId}</c:if><c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">Sau ›</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">Sau ›</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="pagination-info">
                Trang ${currentPage} / ${totalPages} - Tổng ${totalProducts} sản phẩm
            </div>
        </c:if>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>
