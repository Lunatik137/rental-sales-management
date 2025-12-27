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
            background: radial-gradient(circle at 20% 20%, #f1f6ff 0, #f8fbff 40%, #f0f4ff 100%);
            color: #0f172a;
        }

        .container { max-width: 1200px; margin: 0 auto; padding: 30px 20px 60px; }
        .product-detail { background: #ffffff; border-radius: 20px; padding: 32px; box-shadow: 0 18px 44px rgba(15, 79, 145, 0.08); border: 1px solid rgba(15, 140, 230, 0.1); }
        .product-header { display: grid; grid-template-columns: 1.1fr 1fr; gap: 28px; margin-bottom: 20px; }
        .product-image-large { width: 100%; height: 400px; object-fit: cover; border-radius: 18px; background: linear-gradient(135deg, #dfeeff, #c1dfff); display: flex; align-items: center; justify-content: center; font-size: 120px; color: #0b6fd1; box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.55); }
        .product-info-detail h1 { font-size: 30px; margin: 0 0 10px; color: #0f2d4f; font-weight: 800; }
        .product-rating-detail { color: #ffc107; font-size: 16px; margin-bottom: 15px; }
        .product-type-badge { display: inline-block; padding: 8px 16px; border-radius: 10px; font-size: 14px; margin-bottom: 16px; font-weight: 700; }
        .type-sale { background: #e6f6ed; color: #1d6a35; }
        .type-rental { background: #dcefff; color: #0f5aa0; }
        .type-both { background: #fff3d9; color: #8b5a00; }
        .price-section { margin: 20px 0; padding: 18px; background: #f8fbff; border-radius: 14px; border: 1px solid rgba(15, 140, 230, 0.1); }
        .price-item-large { margin-bottom: 12px; }
        .price-label-large { font-size: 13px; color: #7086a3; margin-bottom: 5px; }
        .price-value-large { font-size: 26px; font-weight: 800; color: #0b6fd1; }
        .stock-status { padding: 14px; border-radius: 12px; margin-bottom: 14px; font-weight: 700; }
        .stock-available { background: #e6f6ed; color: #1d6a35; }
        .stock-low { background: #fff3d9; color: #8b5a00; }
        .stock-out { background: #fbe3e3; color: #b02a37; }
        .description-section { margin-top: 20px; }
        .description-section h2 { font-size: 22px; margin-bottom: 10px; color: #0f2d4f; font-weight: 800; }
        .description-section p { line-height: 1.8; color: #63788e; }
        .action-buttons { display: flex; gap: 12px; margin-top: 16px; flex-wrap: wrap; }
        .btn { padding: 14px 26px; border: none; border-radius: 12px; font-size: 15px; font-weight: 800; cursor: pointer; text-decoration: none; display: inline-block; text-align: center; transition: all 0.3s; }
        .btn-primary { background: linear-gradient(120deg, #0f8ce6, #0a6fcc); color: white; box-shadow: 0 14px 28px rgba(15, 140, 230, 0.25); }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 18px 36px rgba(15, 140, 230, 0.35); }
        .btn-secondary { background: #e7eff7; color: #0f2d4f; }
        .btn-secondary:hover { background: #d6e6f5; }
        .btn:disabled { background: #ccc; cursor: not-allowed; }
        @media (max-width: 900px) { .product-header { grid-template-columns: 1fr; } .product-image-large { height: 320px; } }
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
                            <div class="product-rating-detail">⭐⭐⭐⭐⭐ (4.8/5) - 128 đánh giá</div>
                            
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
                        <c:if test="${not empty product.category and not empty product.category.name}">
                            <p style="color: #7086a3; font-size: 14px; margin-bottom: 10px;">
                                <strong>Danh mục:</strong> ${product.category.name}
                            </p>
                        </c:if>
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

                    <!-- Similar Products Section -->
                    <c:if test="${not empty similarProducts}">
                        <div class="description-section" style="margin-top: 40px;">
                            <h2>Sản phẩm tương tự</h2>
                            <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 20px; margin-top: 20px;">
                                <c:forEach var="similar" items="${similarProducts}">
                                    <a href="products?action=detail&id=${similar.id}" style="text-decoration: none; color: inherit;">
                                        <div style="background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.1); transition: transform 0.3s;">
                                            <div style="width: 100%; height: 150px; background: linear-gradient(135deg, #dfeeff, #c1dfff); display: flex; align-items: center; justify-content: center; font-size: 48px;">
                                                <c:choose>
                                                    <c:when test="${not empty similar.imageUrl}">
                                                        <img src="${similar.imageUrl}" alt="${similar.name}" style="width: 100%; height: 100%; object-fit: cover;">
                                                    </c:when>
                                                    <c:otherwise>📦</c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div style="padding: 15px;">
                                                <h3 style="margin: 0 0 10px; font-size: 14px; color: #0f2d4f; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; min-height: 40px;">
                                                    ${similar.name}
                                                </h3>
                                                <div style="font-size: 16px; font-weight: bold; color: #0b6fd1;">
                                                    <c:choose>
                                                        <c:when test="${similar.salePrice != null && similar.salePrice > 0}">
                                                            <fmt:formatNumber value="${similar.salePrice}" type="number" /> đ
                                                        </c:when>
                                                        <c:when test="${similar.rentalPrice != null && similar.rentalPrice > 0}">
                                                            <fmt:formatNumber value="${similar.rentalPrice}" type="number" /> đ/ngày
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${similar.price}" type="number" /> đ
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>

