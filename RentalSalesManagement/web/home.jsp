<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        /* Hero Slider Section */
        .hero-slider {
            position: relative;
            height: 500px;
            overflow: hidden;
            touch-action: pan-y;
        }

        .hero-slides {
            display: flex;
            width: 400%;
            height: 100%;
            transition: transform 0.6s cubic-bezier(0.4, 0, 0.2, 1);
            will-change: transform;
        }

        .hero-slide {
            width: 25%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            position: relative;
            background-size: cover;
            background-position: center;
            flex-shrink: 0;
        }

        .hero-slide:nth-child(1) {
            background-image: url('https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1200&h=500&fit=crop');
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.8) 0%, rgba(118, 75, 162, 0.8) 100%),
                        url('https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1200&h=500&fit=crop');
            background-size: cover;
            background-position: center;
        }

        .hero-slide:nth-child(2) {
            background-image: url('https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=1200&h=500&fit=crop');
            background: linear-gradient(135deg, rgba(240, 147, 251, 0.8) 0%, rgba(245, 87, 108, 0.8) 100%),
                        url('https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=1200&h=500&fit=crop');
            background-size: cover;
            background-position: center;
        }

        .hero-slide:nth-child(3) {
            background-image: url('https://images.unsplash.com/photo-1556911220-bff31c812dba?w=1200&h=500&fit=crop');
            background: linear-gradient(135deg, rgba(79, 172, 254, 0.8) 0%, rgba(0, 242, 254, 0.8) 100%),
                        url('https://images.unsplash.com/photo-1556911220-bff31c812dba?w=1200&h=500&fit=crop');
            background-size: cover;
            background-position: center;
        }

        .hero-slide:nth-child(4) {
            background-image: url('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=1200&h=500&fit=crop');
            background: linear-gradient(135deg, rgba(67, 233, 123, 0.8) 0%, rgba(56, 249, 215, 0.8) 100%),
                        url('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=1200&h=500&fit=crop');
            background-size: cover;
            background-position: center;
        }

        .hero-slide::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 1;
            max-width: 800px;
            padding: 0 20px;
            animation: fadeInUp 1s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero-content h1 {
            font-size: 48px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            animation: fadeInUp 1s ease-out 0.2s both;
        }

        .hero-content p {
            font-size: 20px;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
            animation: fadeInUp 1s ease-out 0.4s both;
        }

        .hero-btn {
            padding: 15px 40px;
            background: white;
            color: #667eea;
            text-decoration: none;
            border-radius: 30px;
            font-size: 18px;
            font-weight: bold;
            display: inline-block;
            transition: all 0.3s;
            animation: fadeInUp 1s ease-out 0.6s both;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .hero-btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        .hero-nav {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(255, 255, 255, 0.3);
            color: white;
            border: none;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            font-size: 24px;
            cursor: pointer;
            z-index: 10;
            transition: all 0.3s;
            backdrop-filter: blur(10px);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-nav:hover {
            background: rgba(255, 255, 255, 0.5);
            transform: translateY(-50%) scale(1.1);
        }

        .hero-nav:active {
            transform: translateY(-50%) scale(0.95);
        }

        .hero-nav.prev {
            left: 20px;
        }

        .hero-nav.next {
            right: 20px;
        }

        @media (max-width: 768px) {
            .hero-nav {
                width: 40px;
                height: 40px;
                font-size: 20px;
            }
            .hero-nav.prev {
                left: 10px;
            }
            .hero-nav.next {
                right: 10px;
            }
        }

        .hero-dots {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
            z-index: 10;
        }

        .hero-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: all 0.3s;
        }

        .hero-dot.active {
            background: white;
            transform: scale(1.3);
        }

        /* Feature Icons Section */
        .features {
            background: white;
            padding: 40px 0;
            border-bottom: 1px solid #e0e0e0;
        }

        .features-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .feature-item {
            text-align: center;
        }

        .feature-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .feature-item h3 {
            color: #667eea;
            margin-bottom: 10px;
        }

        .feature-item p {
            color: #666;
            font-size: 14px;
        }

        /* Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Section Title */
        .section-title {
            text-align: center;
            font-size: 36px;
            margin-bottom: 40px;
            color: #2f3542;
            position: relative;
            padding-bottom: 15px;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #667eea;
        }

        /* Categories Grid */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
            margin-bottom: 60px;
        }

        .category-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            color: inherit;
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }

        .category-image {
            width: 100%;
            height: 150px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 64px;
            background-size: cover;
            background-position: center;
            position: relative;
            overflow: hidden;
        }

        .category-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
            position: absolute;
            top: 0;
            left: 0;
        }

        .category-image:has(img) {
            background: none;
        }

        .category-card:hover .category-image img {
            transform: scale(1.1);
        }

        .category-info {
            padding: 20px;
            text-align: center;
        }

        .category-info h3 {
            color: #2f3542;
            margin: 0;
            font-size: 16px;
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
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
        }

        .add-to-cart-btn:hover {
            background: #5568d3;
        }

        /* Promotional Banners */
        .promo-banners {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }

        .promo-banner {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px;
            border-radius: 10px;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .promo-banner::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        }

        .promo-banner h3 {
            font-size: 28px;
            margin-bottom: 15px;
            position: relative;
            z-index: 1;
        }

        .promo-banner p {
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }

        .promo-btn {
            background: white;
            color: #667eea;
            padding: 12px 30px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            position: relative;
            z-index: 1;
            transition: transform 0.3s;
        }

        .promo-btn:hover {
            transform: scale(1.05);
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
            font-size: 32px;
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
    </style>
</head>
<body>
    <!-- Hero Slider Section -->
    <div class="hero-slider">
        <div class="hero-slides">
            <div class="hero-slide">
                <div class="hero-content">
                    <h1>Cửa hàng một điểm đến cho mọi thứ bạn yêu thích!</h1>
                    <p>Cho thuê và bán đồ dùng chất lượng cao với giá cả hợp lý</p>
                    <a href="products" class="hero-btn">Mua sắm ngay</a>
                </div>
            </div>
            <div class="hero-slide">
                <div class="hero-content">
                    <h1>Giảm giá lên đến 50%</h1>
                    <p>Ưu đãi đặc biệt cho khách hàng mới - Đừng bỏ lỡ!</p>
                    <a href="products" class="hero-btn">Khám phá ngay</a>
                </div>
            </div>
            <div class="hero-slide">
                <div class="hero-content">
                    <h1>Giao hàng miễn phí</h1>
                    <p>Miễn phí vận chuyển cho đơn hàng trên 500.000đ</p>
                    <a href="products" class="hero-btn">Xem sản phẩm</a>
                </div>
            </div>
            <div class="hero-slide">
                <div class="hero-content">
                    <h1>Sản phẩm chất lượng cao</h1>
                    <p>Đảm bảo uy tín và chất lượng tốt nhất cho khách hàng</p>
                    <a href="products" class="hero-btn">Tìm hiểu thêm</a>
                </div>
            </div>
        </div>
        <button class="hero-nav prev" id="prevBtn">‹</button>
        <button class="hero-nav next" id="nextBtn">›</button>
        <div class="hero-dots">
            <span class="hero-dot active" data-slide="0"></span>
            <span class="hero-dot" data-slide="1"></span>
            <span class="hero-dot" data-slide="2"></span>
            <span class="hero-dot" data-slide="3"></span>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let currentSlide = 0;
            const slides = document.querySelectorAll('.hero-slide');
            const dots = document.querySelectorAll('.hero-dot');
            const slidesContainer = document.querySelector('.hero-slides');
            const slider = document.querySelector('.hero-slider');
            
            if (!slidesContainer || !slider || slides.length === 0) {
                console.error('Banner slider elements not found');
                return;
            }
            
            let slideInterval;
            let isTransitioning = false;
            
            // Touch/swipe variables
            let touchStartX = 0;
            let touchEndX = 0;
            let isDragging = false;
            let startX = 0;
            let scrollLeft = 0;

            function showSlide(n, smooth = true) {
                if (isTransitioning) return;
                
                if (n >= slides.length) currentSlide = 0;
                else if (n < 0) currentSlide = slides.length - 1;
                else currentSlide = n;
                
                if (!smooth) {
                    slidesContainer.style.transition = 'none';
                } else {
                    slidesContainer.style.transition = 'transform 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
                }
                
                slidesContainer.style.transform = `translateX(-${currentSlide * 25}%)`;
                
                // Animate content
                slides.forEach((slide, index) => {
                    const content = slide.querySelector('.hero-content');
                    if (content) {
                        if (index === currentSlide) {
                            content.style.opacity = '0';
                            content.style.transform = 'translateY(30px)';
                            setTimeout(() => {
                                content.style.transition = 'all 0.6s ease-out';
                                content.style.opacity = '1';
                                content.style.transform = 'translateY(0)';
                            }, 50);
                        } else {
                            content.style.opacity = '0';
                            content.style.transform = 'translateY(30px)';
                        }
                    }
                });
                
                dots.forEach((dot, index) => {
                    dot.classList.toggle('active', index === currentSlide);
                });
                
                if (smooth) {
                    isTransitioning = true;
                    setTimeout(() => {
                        isTransitioning = false;
                    }, 600);
                }
            }

            // Button event listeners
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            
            if (prevBtn) {
                prevBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    if (isTransitioning) return;
                    currentSlide--;
                    if (currentSlide < 0) currentSlide = slides.length - 1;
                    showSlide(currentSlide);
                    resetInterval();
                });
            }
            
            if (nextBtn) {
                nextBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    if (isTransitioning) return;
                    currentSlide++;
                    if (currentSlide >= slides.length) currentSlide = 0;
                    showSlide(currentSlide);
                    resetInterval();
                });
            }
            
            // Dot event listeners
            dots.forEach((dot, index) => {
                dot.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    if (isTransitioning) return;
                    currentSlide = index;
                    showSlide(currentSlide);
                    resetInterval();
                });
            });

            function resetInterval() {
                clearInterval(slideInterval);
                slideInterval = setInterval(() => {
                    if (!isDragging) {
                        currentSlide++;
                        showSlide(currentSlide);
                    }
                }, 5000);
            }

            // Touch events for mobile swipe
            slider.addEventListener('touchstart', (e) => {
                touchStartX = e.touches[0].clientX;
                isDragging = true;
                clearInterval(slideInterval);
            }, { passive: true });

            slider.addEventListener('touchmove', (e) => {
                if (!isDragging) return;
                touchEndX = e.touches[0].clientX;
                const diff = touchStartX - touchEndX;
                
                // Calculate temporary transform during drag
                const currentTransform = -currentSlide * 25;
                const dragOffset = (diff / slider.offsetWidth) * 100;
                const newTransform = currentTransform + dragOffset;
                
                slidesContainer.style.transition = 'none';
                slidesContainer.style.transform = `translateX(${newTransform}%)`;
            }, { passive: true });

            slider.addEventListener('touchend', () => {
                if (!isDragging) return;
                isDragging = false;
                
                const diff = touchStartX - touchEndX;
                const threshold = 50; // Minimum swipe distance
                
                if (Math.abs(diff) > threshold) {
                    if (diff > 0) {
                        // Swipe left - next slide
                        changeSlide(1);
                    } else {
                        // Swipe right - previous slide
                        changeSlide(-1);
                    }
                } else {
                    // Not enough swipe, return to current slide
                    showSlide(currentSlide);
                }
                
                resetInterval();
            }, { passive: true });

            // Mouse drag support for desktop
            slider.addEventListener('mousedown', (e) => {
                isDragging = true;
                startX = e.pageX - slider.offsetLeft;
                scrollLeft = currentSlide * 25;
                clearInterval(slideInterval);
                slider.style.cursor = 'grabbing';
            });

            slider.addEventListener('mouseleave', () => {
                if (isDragging) {
                    isDragging = false;
                    showSlide(currentSlide);
                    resetInterval();
                    slider.style.cursor = 'grab';
                }
            });

            slider.addEventListener('mouseup', () => {
                if (isDragging) {
                    isDragging = false;
                    showSlide(currentSlide);
                    resetInterval();
                    slider.style.cursor = 'grab';
                }
            });

            slider.addEventListener('mousemove', (e) => {
                if (!isDragging) return;
                e.preventDefault();
                const x = e.pageX - slider.offsetLeft;
                const walk = (x - startX) / slider.offsetWidth * 100;
                const newTransform = -scrollLeft + walk;
                
                slidesContainer.style.transition = 'none';
                slidesContainer.style.transform = `translateX(${newTransform}%)`;
            });

            // Set cursor style
            slider.style.cursor = 'grab';

            // Initialize first slide
            showSlide(0, false);
            
            // Auto slide
            resetInterval();
            
            // Pause on hover
            slider.addEventListener('mouseenter', () => {
                clearInterval(slideInterval);
            });
            
            slider.addEventListener('mouseleave', () => {
                resetInterval();
            });
        });
    </script>

    <!-- Feature Icons -->
    <div class="features">
        <div class="features-container">
            <div class="feature-item">
                <div class="feature-icon">🚚</div>
                <h3>Giao hàng miễn phí</h3>
                <p>Miễn phí vận chuyển cho đơn hàng trên 500.000đ</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">🔒</div>
                <h3>Thanh toán an toàn</h3>
                <p>Bảo mật thông tin thanh toán 100%</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">⭐</div>
                <h3>Sản phẩm chất lượng</h3>
                <p>Đảm bảo chất lượng tốt nhất</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">💬</div>
                <h3>Hỗ trợ 24/7</h3>
                <p>Luôn sẵn sàng hỗ trợ bạn</p>
            </div>
        </div>
    </div>

    <!-- Promotional Banners -->
    <div class="container">
        <div class="promo-banners">
            <div class="promo-banner">
                <h3>Tiết kiệm thêm 33%</h3>
                <p>Cho đơn hàng của bạn</p>
                <a href="products" class="promo-btn">Mua ngay</a>
            </div>
            <div class="promo-banner" style="background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);">
                <h3>Giao hàng nhanh</h3>
                <p>Nhận hàng trong 24h</p>
                <a href="products" class="promo-btn">Xem thêm</a>
            </div>
        </div>
    </div>

    <!-- Categories Section -->
    <div class="container">
        <h2 class="section-title">Mua sắm theo danh mục</h2>
        <div class="categories-grid">
            <c:forEach var="category" items="${categories}">
                <a href="products?category=${category.id}" class="category-card">
                    <div class="category-image">
                        <c:choose>
                            <c:when test="${not empty category.imageUrl}">
                                <img src="${category.imageUrl}" alt="${category.name}" />
                            </c:when>
                            <c:otherwise>
                                📦
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="category-info">
                        <h3>${category.name}</h3>
                    </div>
                </a>
            </c:forEach>
        </div>

        <!-- Featured Products -->
        <h2 class="section-title">Sản phẩm nổi bật</h2>
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
    </div>

    <!-- Newsletter Section -->
    <div class="newsletter">
        <div class="newsletter-content">
            <h2>Đăng ký nhận thông tin khuyến mãi!</h2>
            <p>Nhận các ưu đãi đặc biệt và cập nhật sản phẩm mới nhất</p>
            <form class="newsletter-form" method="POST" action="#">
                <input type="email" placeholder="Nhập email của bạn" required>
                <button type="submit">Đăng ký</button>
            </form>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>
