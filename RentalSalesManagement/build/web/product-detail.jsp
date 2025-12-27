<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} - Cho Thuê Đồ Dùng</title>
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

        .product-detail {
            background: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .product-header {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            margin-bottom: 40px;
        }

        .product-image-large {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 10px;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 120px;
        }

        .product-info-detail h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #2f3542;
        }

        .product-type-badge {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 20px;
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

        .price-section {
            margin: 30px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }

        .price-item-large {
            margin-bottom: 15px;
        }

        .price-label-large {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }

        .price-value-large {
            font-size: 28px;
            font-weight: bold;
            color: #667eea;
        }

        .stock-status {
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .stock-available {
            background: #d4edda;
            color: #155724;
        }

        .stock-low {
            background: #fff3cd;
            color: #856404;
        }

        .stock-out {
            background: #f8d7da;
            color: #721c24;
        }

        .description-section {
            margin-top: 40px;
        }

        .description-section h2 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #2f3542;
        }

        .description-section p {
            line-height: 1.8;
            color: #666;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: all 0.3s;
        }

        .btn-primary {
            background: #667eea;
            color: white;
        }

        .btn-primary:hover {
            background: #5568d3;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background: #5a6268;
        }

        .btn:disabled {
            background: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${product == null}">
                <div class="product-detail">
                    <h1>Sản phẩm không tồn tại</h1>
                    <a href="products" class="btn btn-secondary">Quay lại danh sách</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="product-detail">
                    <div class="product-header">
                        <div>
                            <c:choose>
                                <c:when test="${not empty product.imageUrl}">
                                    <img src="${product.imageUrl}" alt="${product.name}" class="product-image-large">
                                </c:when>
                                <c:otherwise>
                                    <div class="product-image-large">📦</div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="product-info-detail">
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
                            <h1>${product.name}</h1>
                            
                            <div class="stock-status 
                                <c:choose>
                                    <c:when test="${product.stock > 10}">stock-available</c:when>
                                    <c:when test="${product.stock > 0}">stock-low</c:when>
                                    <c:otherwise>stock-out</c:otherwise>
                                </c:choose>">
                                <c:choose>
                                    <c:when test="${product.stock > 10}">
                                        ✓ Còn hàng (${product.stock} sản phẩm)
                                    </c:when>
                                    <c:when test="${product.stock > 0}">
                                        ⚠ Sắp hết hàng (${product.stock} sản phẩm)
                                    </c:when>
                                    <c:otherwise>
                                        ✗ Hết hàng
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="price-section">
                                <c:if test="${product.type == 'sale' || product.type == 'both'}">
                                    <div class="price-item-large">
                                        <div class="price-label-large">Giá bán</div>
                                        <div class="price-value-large">
                                            <c:choose>
                                                <c:when test="${product.salePrice != null && product.salePrice > 0}">
                                                    <fmt:formatNumber value="${product.salePrice}" type="number" /> đ
                                                </c:when>
                                                <c:otherwise>Liên hệ</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${product.type == 'rental' || product.type == 'both'}">
                                    <div class="price-item-large">
                                        <div class="price-label-large">Giá thuê/ngày</div>
                                        <div class="price-value-large">
                                            <c:choose>
                                                <c:when test="${product.rentalPrice != null && product.rentalPrice > 0}">
                                                    <fmt:formatNumber value="${product.rentalPrice}" type="number" /> đ
                                                </c:when>
                                                <c:otherwise>Liên hệ</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:if>
                            </div>

                            <div class="action-buttons">
                                <c:if test="${product.stock > 0}">
                                    <c:if test="${product.type == 'sale' || product.type == 'both'}">
                                        <a href="order?productId=${product.id}&type=sale" class="btn btn-primary">Đặt mua</a>
                                    </c:if>
                                    <c:if test="${product.type == 'rental' || product.type == 'both'}">
                                        <a href="order?productId=${product.id}&type=rental" class="btn btn-primary">Đặt thuê</a>
                                    </c:if>
                                </c:if>
                                <a href="products" class="btn btn-secondary">Quay lại</a>
                            </div>
                        </div>
                    </div>

                    <div class="description-section">
                        <h2>Mô tả sản phẩm</h2>
                        <p>
                            <c:choose>
                                <c:when test="${not empty product.description}">
                                    ${product.description}
                                </c:when>
                                <c:otherwise>
                                    Sản phẩm chất lượng cao, đảm bảo uy tín. Vui lòng liên hệ để biết thêm chi tiết.
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>

