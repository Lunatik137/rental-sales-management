<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} - DIGITECH</title>
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
            padding: 20px;
        }

        /* Breadcrumbs */
        .breadcrumbs {
            margin: 20px 0;
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

        /* Product Detail Section */
        .product-detail-section {
            background: white;
            border-radius: 8px;
            padding: 30px;
            margin-bottom: 30px;
        }

        .product-main {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            margin-bottom: 40px;
        }

        /* Product Images */
        .product-images {
            display: flex;
            gap: 15px;
        }

        .product-thumbnails {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .thumbnail {
            width: 80px;
            height: 80px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            cursor: pointer;
            overflow: hidden;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: border-color 0.3s;
        }

        .thumbnail:hover,
        .thumbnail.active {
            border-color: #667eea;
        }

        .thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-main-image {
            flex: 1;
            height: 500px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-main-image img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        /* Product Info */
        .product-info {
            padding-left: 20px;
        }

        .product-title {
            font-size: 28px;
            font-weight: bold;
            color: #2f3542;
            margin: 0 0 15px 0;
            line-height: 1.4;
        }

        .product-brand {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }

        .product-brand a {
            color: #667eea;
            text-decoration: none;
            margin-left: 10px;
        }

        .product-brand a:hover {
            text-decoration: underline;
        }

        .product-price-section {
            margin: 25px 0;
        }

        .current-price {
            font-size: 32px;
            font-weight: bold;
            color: #dc3545;
            margin-bottom: 10px;
        }

        .vat-info {
            font-size: 13px;
            color: #999;
            margin-bottom: 20px;
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            gap: 15px;
            margin: 25px 0;
        }

        .quantity-label {
            font-size: 14px;
            font-weight: 600;
            color: #2f3542;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            overflow: hidden;
        }

        .quantity-btn {
            width: 40px;
            height: 40px;
            border: none;
            background: #f5f6fa;
            cursor: pointer;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.3s;
        }

        .quantity-btn:hover {
            background: #e0e0e0;
        }

        .quantity-input {
            width: 60px;
            height: 40px;
            border: none;
            text-align: center;
            font-size: 16px;
            font-weight: 600;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 25px;
        }

        .btn-buy-now {
            background: #dc3545;
            color: white;
            padding: 16px 30px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: block;
            transition: background 0.3s;
        }

        .btn-buy-now:hover {
            background: #c82333;
        }

        .btn-rent-now {
            background: #667eea;
            color: white;
            padding: 16px 30px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: block;
            transition: background 0.3s;
        }

        .btn-rent-now:hover {
            background: #5568d3;
        }

        .btn-buy-now-subtitle {
            font-size: 12px;
            font-weight: normal;
            margin-top: 5px;
            opacity: 0.9;
        }

        .btn-add-cart {
            background: #667eea;
            color: white;
            padding: 14px 30px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: block;
            transition: background 0.3s;
        }

        .btn-add-cart:hover {
            background: #5568d3;
        }

        /* Description and News Section */
        .description-news-section {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
            margin-top: 40px;
        }

        .description-tabs {
            background: white;
            border-radius: 8px;
            padding: 25px;
        }

        .tab-buttons {
            display: flex;
            gap: 10px;
            border-bottom: 2px solid #e0e0e0;
            margin-bottom: 20px;
        }

        .tab-btn {
            padding: 12px 20px;
            background: none;
            border: none;
            border-bottom: 3px solid transparent;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            color: #666;
            transition: all 0.3s;
        }

        .tab-btn.active {
            color: #667eea;
            border-bottom-color: #667eea;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .description-content h3 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #2f3542;
        }

        .description-content p {
            line-height: 1.8;
            color: #666;
            margin-bottom: 15px;
        }

        .description-content img {
            max-width: 100%;
            height: auto;
            border-radius: 6px;
            margin: 15px 0;
        }

        .view-more-btn {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            margin-top: 10px;
            display: inline-block;
        }

        .view-more-btn:hover {
            text-decoration: underline;
        }

        /* Featured News */
        .featured-news {
            background: white;
            border-radius: 8px;
            padding: 25px;
        }

        .featured-news h3 {
            font-size: 18px;
            margin-bottom: 20px;
            color: #2f3542;
            font-weight: bold;
        }

        .news-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .news-item {
            display: flex;
            gap: 12px;
            text-decoration: none;
            color: inherit;
            transition: transform 0.3s;
        }

        .news-item:hover {
            transform: translateX(5px);
        }

        .news-thumbnail {
            width: 80px;
            height: 80px;
            border-radius: 6px;
            overflow: hidden;
            background: #f0f0f0;
            flex-shrink: 0;
        }

        .news-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .news-content {
            flex: 1;
        }

        .news-title {
            font-size: 14px;
            font-weight: 600;
            color: #2f3542;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        /* Similar Products */
        .similar-products-section {
            background: white;
            border-radius: 8px;
            padding: 30px;
            margin-top: 30px;
        }

        .similar-products-section h2 {
            font-size: 24px;
            margin-bottom: 25px;
            color: #2f3542;
            font-weight: bold;
        }

        .similar-products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }

        .similar-product-card {
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            color: inherit;
        }

        .similar-product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .similar-product-image {
            width: 100%;
            height: 180px;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .similar-product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .similar-product-info {
            padding: 15px;
        }

        .similar-product-name {
            font-size: 14px;
            font-weight: 600;
            color: #2f3542;
            margin-bottom: 10px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height: 40px;
        }

        .similar-product-price {
            font-size: 16px;
            font-weight: bold;
            color: #dc3545;
        }

        /* Newsletter */
        .newsletter-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 8px;
            padding: 40px;
            text-align: center;
            color: white;
            margin: 40px 0;
        }

        .newsletter-section h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .newsletter-section p {
            font-size: 14px;
            opacity: 0.9;
            margin-bottom: 25px;
        }

        .newsletter-form {
            display: flex;
            gap: 10px;
            max-width: 500px;
            margin: 0 auto;
        }

        .newsletter-input {
            flex: 1;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
        }

        .newsletter-btn {
            padding: 12px 30px;
            background: white;
            color: #667eea;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .newsletter-btn:hover {
            transform: scale(1.05);
        }

        /* Scroll to top button */
        .scroll-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            font-size: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            transition: all 0.3s;
            z-index: 1000;
        }

        .scroll-to-top:hover {
            background: #5568d3;
            transform: translateY(-5px);
        }

        @media (max-width: 968px) {
            .product-main {
                grid-template-columns: 1fr;
            }

            .description-news-section {
                grid-template-columns: 1fr;
            }

            .product-images {
                flex-direction: column-reverse;
            }

            .product-thumbnails {
                flex-direction: row;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${product == null}">
                <div class="product-detail-section">
                    <h1>Sản phẩm không tồn tại</h1>
                    <a href="products" class="btn-add-cart">Quay lại danh sách</a>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Breadcrumbs -->
                <div class="breadcrumbs">
                    <a href="home">Trang chủ</a> &gt; 
                    <c:if test="${not empty product.category and not empty product.category.name}">
                        <a href="products?category=${product.categoryId}">${product.category.name}</a> &gt; 
                    </c:if>
                    ${product.name}
                </div>

                <!-- Product Detail Section -->
                <div class="product-detail-section">
                    <div class="product-main">
                        <!-- Product Images -->
                        <div class="product-images">
                            <div class="product-thumbnails">
                                <div class="thumbnail active">
                            <c:choose>
                                <c:when test="${not empty product.imageUrl}">
                                            <img src="${product.imageUrl}" alt="${product.name}" onclick="changeMainImage(this.src)">
                                </c:when>
                                <c:otherwise>
                                            📦
                                </c:otherwise>
                            </c:choose>
                        </div>
                                <!-- Additional thumbnails can be added here -->
                            </div>
                            <div class="product-main-image">
                                <c:choose>
                                    <c:when test="${not empty product.imageUrl}">
                                        <img src="${product.imageUrl}" alt="${product.name}" id="mainProductImage">
                                    </c:when>
                                    <c:otherwise>
                                        <div style="font-size: 120px;">📦</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            </div>

                        <!-- Product Info -->
                        <div class="product-info">
                            <h1 class="product-title">${product.name}</h1>
                            
                            <div class="product-brand">
                                <c:if test="${not empty product.category and not empty product.category.name}">
                                    Thương hiệu: ${product.category.name}
                                </c:if>
                            </div>

                            <div class="product-price-section">
                                <div class="current-price">
                                            <c:choose>
                                        <c:when test="${product.type == 'sale' || product.type == 'both'}">
                                            <c:if test="${product.salePrice != null && product.salePrice > 0}">
                                                <fmt:formatNumber value="${product.salePrice}" type="number" />₫
                                            </c:if>
                                        </c:when>
                                        <c:when test="${product.type == 'rental' || product.type == 'both'}">
                                            <c:if test="${product.rentalPrice != null && product.rentalPrice > 0}">
                                                <fmt:formatNumber value="${product.rentalPrice}" type="number" />₫
                                            </c:if>
                                                </c:when>
                                            </c:choose>
                                        </div>
                            </div>

                            <div class="quantity-selector">
                                <span class="quantity-label">Số lượng:</span>
                                <div class="quantity-controls">
                                    <button class="quantity-btn" onclick="decreaseQuantity()">-</button>
                                    <input type="number" id="quantity" class="quantity-input" value="1" min="1" max="${product.stock}">
                                    <button class="quantity-btn" onclick="increaseQuantity()">+</button>
                                    </div>
                            </div>

                            <div class="action-buttons">
                                <c:if test="${product.stock > 0}">
                                    <c:if test="${product.type == 'sale' || product.type == 'both'}">
                                        <a href="order?productId=${product.id}&type=sale&quantity=1" class="btn-buy-now" onclick="updateQuantityInLink(this);">
                                            MUA NGAY
                                            <div class="btn-buy-now-subtitle">Giao hàng tận nơi hoặc nhận tại cửa hàng</div>
                                        </a>
                                    </c:if>
                                    <c:if test="${product.type == 'rental' || product.type == 'both'}">
                                        <a href="order?productId=${product.id}&type=rental&quantity=1" class="btn-rent-now" onclick="updateQuantityInLink(this);">
                                            THUÊ NGAY
                                            <div class="btn-buy-now-subtitle">Giao hàng tận nơi hoặc nhận tại cửa hàng</div>
                                        </a>
                                    </c:if>
                                    <a href="#" class="btn-add-cart" onclick="addToCart(); return false;">THÊM VÀO GIỎ HÀNG</a>
                                </c:if>
                                <c:if test="${product.stock <= 0}">
                                    <button class="btn-buy-now" disabled style="opacity: 0.6; cursor: not-allowed;">
                                        HẾT HÀNG
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- Description and News Section -->
                    <div class="description-news-section">
                        <div class="description-tabs">
                            <div class="tab-buttons">
                                <button class="tab-btn active" onclick="switchTab('details')">Thông tin chi tiết sản phẩm</button>
                            </div>
                            <div id="detailsTab" class="tab-content active">
                                <div class="description-content">
                                    <h3>Giới thiệu về ${product.name}</h3>
                                    <c:if test="${not empty product.description}">
                                        <p>${product.description}</p>
                                    </c:if>
                                    <c:if test="${not empty product.imageUrl}">
                                        <img src="${product.imageUrl}" alt="${product.name}">
                                    </c:if>
                                    <a href="#" class="view-more-btn">Xem thêm</a>
                                </div>
                            </div>
                        </div>

                        <div class="featured-news">
                            <h3>Tin nổi bật</h3>
                            <div class="news-list">
                                <a href="#" class="news-item">
                                    <div class="news-thumbnail">
                                        <img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=150&h=150&fit=crop" alt="News">
                                    </div>
                                    <div class="news-content">
                                        <div class="news-title">Đánh Giá Fujifilm X-T5: Quay 6K Trên Thiết Kế Siêu Cổ Điển</div>
                                    </div>
                                </a>
                                <a href="#" class="news-item">
                                    <div class="news-thumbnail">
                                        <img src="https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=150&h=150&fit=crop" alt="News">
                                    </div>
                                    <div class="news-content">
                                        <div class="news-title">So Sánh Insta360 Flow Và DJI Osmo Mobile 6: Đi Tìm Chiếc Gimbal Điện Thoại Quốc Dân</div>
                                    </div>
                                </a>
                                <a href="#" class="news-item">
                                    <div class="news-thumbnail">
                                        <img src="https://images.unsplash.com/photo-1581833971358-2c8b550f87b3?w=150&h=150&fit=crop" alt="News">
                                    </div>
                                    <div class="news-content">
                                        <div class="news-title">Hướng Dẫn Chọn Máy Ảnh Cho Người Mới Bắt Đầu</div>
                                    </div>
                                </a>
                                <a href="#" class="news-item">
                                    <div class="news-thumbnail">
                                        <img src="https://images.unsplash.com/photo-1611078489935-0eeefcd7baed?w=150&h=150&fit=crop" alt="News">
                                    </div>
                                    <div class="news-content">
                                        <div class="news-title">Top 5 Camera Action Tốt Nhất 2024</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Similar Products Section -->
                <c:if test="${not empty similarProducts}">
                    <div class="similar-products-section">
                        <h2>SẢN PHẨM CÙNG LOẠI</h2>
                        <div class="similar-products-grid">
                            <c:forEach var="similar" items="${similarProducts}">
                                <a href="products?action=detail&id=${similar.id}" class="similar-product-card">
                                    <div class="similar-product-image">
                            <c:choose>
                                            <c:when test="${not empty similar.imageUrl}">
                                                <img src="${similar.imageUrl}" alt="${similar.name}">
                                </c:when>
                                <c:otherwise>
                                                <div style="font-size: 64px; display: flex; align-items: center; justify-content: center; height: 100%;">📦</div>
                                </c:otherwise>
                            </c:choose>
                                    </div>
                                    <div class="similar-product-info">
                                        <div class="similar-product-name">${similar.name}</div>
                                        <div class="similar-product-price">
                                            <c:choose>
                                                <c:when test="${similar.type == 'sale' || similar.type == 'both'}">
                                                    <c:if test="${similar.salePrice != null && similar.salePrice > 0}">
                                                        <fmt:formatNumber value="${similar.salePrice}" type="number" />₫
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${similar.type == 'rental' || similar.type == 'both'}">
                                                    <c:if test="${similar.rentalPrice != null && similar.rentalPrice > 0}">
                                                        <fmt:formatNumber value="${similar.rentalPrice}" type="number" />₫
                                                    </c:if>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>

                <!-- Newsletter Section -->
                <div class="newsletter-section">
                    <h2>ĐĂNG KÝ ĐỂ NHẬN TIN TỨC KHUYẾN MÃI MỚI NHẤT</h2>
                    <p>Đừng bỏ lỡ hàng ngàn sản phẩm và các chương trình khuyến mại khác</p>
                    <form class="newsletter-form" onsubmit="return false;">
                        <input type="email" class="newsletter-input" placeholder="Nhập email của bạn" required>
                        <button type="submit" class="newsletter-btn">GỬI</button>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Scroll to Top Button -->
    <button class="scroll-to-top" onclick="scrollToTop()" id="scrollToTopBtn" style="display: none;">↑</button>

    <jsp:include page="includes/footer.jsp" />

    <script>
        // Change main image when thumbnail is clicked
        function changeMainImage(src) {
            document.getElementById('mainProductImage').src = src;
            // Update active thumbnail
            document.querySelectorAll('.thumbnail').forEach(thumb => {
                thumb.classList.remove('active');
            });
            event.target.closest('.thumbnail').classList.add('active');
        }

        // Quantity controls
        function increaseQuantity() {
            const input = document.getElementById('quantity');
            const max = parseInt(input.getAttribute('max'));
            const current = parseInt(input.value);
            if (current < max) {
                input.value = current + 1;
            }
        }

        function decreaseQuantity() {
            const input = document.getElementById('quantity');
            const current = parseInt(input.value);
            if (current > 1) {
                input.value = current - 1;
            }
        }

        // Tab switching
        function switchTab(tabName) {
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            document.getElementById(tabName + 'Tab').classList.add('active');
            event.target.classList.add('active');
        }

        // Update quantity in link before navigation
        function updateQuantityInLink(link) {
            const quantity = document.getElementById('quantity').value;
            const currentHref = link.getAttribute('href');
            if (currentHref.indexOf('quantity=') > -1) {
                link.href = currentHref.replace(/quantity=\d+/, 'quantity=' + quantity);
            } else {
                link.href = currentHref + '&quantity=' + quantity;
            }
        }

        // Add to cart (placeholder)
        function addToCart() {
            const quantity = document.getElementById('quantity').value;
            alert('Chức năng giỏ hàng đang được phát triển. Số lượng: ' + quantity);
        }

        // Scroll to top
        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Show/hide scroll to top button
        window.addEventListener('scroll', function() {
            const scrollBtn = document.getElementById('scrollToTopBtn');
            if (window.pageYOffset > 300) {
                scrollBtn.style.display = 'flex';
            } else {
                scrollBtn.style.display = 'none';
            }
        });
    </script>
</body>
</html>
