<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String requestURI = request.getRequestURI();
    String currentPage = "";
    
    if (requestURI.contains("home") || requestURI.endsWith("/") || requestURI.endsWith("index.jsp")) {
        currentPage = "home";
    } else if (requestURI.contains("about")) {
        currentPage = "about";
    } else if (requestURI.contains("products")) {
        currentPage = "products";
    } else if (requestURI.contains("contact")) {
        currentPage = "contact";
    }
%>

<style>
    /* Top Bar - Green */
    .top-bar {
        background: #28a745;
        color: white;
        padding: 8px 0;
        font-size: 13px;
    }

    .top-bar-content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .top-bar-left {
        display: flex;
        gap: 20px;
        align-items: center;
    }

    .top-bar-right {
        display: flex;
        gap: 15px;
        align-items: center;
    }

    .top-bar a {
        color: white;
        text-decoration: none;
        transition: opacity 0.3s;
    }

    .top-bar a:hover {
        opacity: 0.8;
    }

    /* Main Header - Dark Blue */
    .main-header {
        background: #1e3a5f;
        color: white;
        padding: 15px 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .main-header-content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 30px;
    }

    .logo {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 28px;
        font-weight: bold;
        color: white;
        text-decoration: none;
        transition: transform 0.3s;
    }

    .logo:hover {
        transform: scale(1.05);
    }

    .search-bar {
        flex: 1;
        max-width: 500px;
        position: relative;

        display: flex;
        align-items: center;

        margin: 0 !important;
        padding: 0 !important;
    }

    .search-bar input {
        width: 100%;
        height: 44px;
        line-height: 44px;
        padding: 0 52px 0 20px;
        border: none;
        border-radius: 25px;
        font-size: 14px;
    }
    
    .search-bar input:focus {
        outline: none;
        box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.2);
    }

    .search-bar button {
        position: absolute;
        right: 6px;
        top: 50%;
        transform: translateY(-50%);
        height: 36px;
        padding: 0 16px;
        border: none;
        border-radius: 18px;
        cursor: pointer;
    }

    .search-bar button:hover {
        background: #5568d3;
    }

    .header-actions {
        display: flex;
        gap: 20px;
        align-items: center;
    }

    .header-action {
        display: flex;
        align-items: center;
        gap: 8px;
        color: white;
        text-decoration: none;
        font-size: 14px;
        transition: opacity 0.3s;
    }

    .header-action:hover {
        opacity: 0.8;
    }

    .header-action-icon {
        font-size: 20px;
    }

    /* Navigation Bar - Blue */
    .nav-bar {
        background: #2563eb;
        padding: 0;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .nav-content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        align-items: center;
        gap: 0;
    }

    .category-btn {
        background: #1e40af;
        color: white;
        padding: 15px 25px;
        border: none;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 10px;
        transition: background 0.3s;
    }

    .category-btn:hover {
        background: #1e3a8a;
    }

    .nav-menu {
        display: flex;
        gap: 0;
        flex: 1;
        justify-content: center;
    }

    .nav-menu a {
        color: white;
        text-decoration: none;
        padding: 15px 45px;
        display: block;
        transition: all 0.3s;
        position: relative;
        font-weight: 500;
        overflow: hidden;
    }

    .nav-menu a::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        width: 0;
        height: 3px;
        background: white;
        transition: all 0.3s ease;
        transform: translateX(-50%);
    }

    .nav-menu a:hover::after {
        width: 100%;
    }

    .nav-menu a.active::after {
        width: 100%;
    }

    .nav-menu a:hover {
        background: rgba(255, 255, 255, 0.1);
    }

    @media (max-width: 768px) {
        .main-header-content {
            flex-wrap: wrap;
        }

        .search-bar {
            order: 3;
            width: 100%;
        }

        .nav-menu {
            flex-wrap: wrap;
        }
    }
</style>

<!-- Top Bar -->
<div class="top-bar">
    <div class="top-bar-content">
        <div class="top-bar-left">
            <span>Giờ mở cửa: 08:30 - 21:00 các ngày trong tuần</span>
        </div>
        <div class="top-bar-right">
        </div>
    </div>
</div>

<!-- Main Header -->
<div class="main-header">
    <div class="main-header-content">
        <a href="home" class="logo">
            <span>DIGITECH</span>
        </a>

        <form method="GET" action="products" class="search-bar">
            <input type="text" name="keyword" placeholder="Tìm kiếm..." />
            <button type="submit">🔍</button>
        </form>

        <div class="header-actions">
            <a href="tel:19006750" class="header-action">
                <span class="header-action-icon">📞</span>
                <span>Có mua hàng<br>1900 6750</span>
            </a>
            <a href="admin/login.jsp" class="header-action">
                <span class="header-action-icon">👤</span>
                <span>Tài khoản<br>đăng nhập</span>
            </a>
            <a href="#" class="header-action">
                <span class="header-action-icon">🛒</span>
                <span>Giỏ hàng</span>
            </a>
        </div>
    </div>
</div>

<!-- Navigation Bar -->
<div class="nav-bar">
    <div class="nav-content">
        <nav class="nav-menu">
            <a href="home" class="<%= currentPage.equals("home") ? "active" : "" %>">Trang chủ</a>
            <a href="about.jsp" class="<%= currentPage.equals("about") ? "active" : "" %>">Giới thiệu</a>
            <a href="products" class="<%= currentPage.equals("products") ? "active" : "" %>">Sản phẩm</a>
            <a href="contact.jsp" class="<%= currentPage.equals("contact") ? "active" : "" %>">Liên hệ</a>
        </nav>
    </div>
</div>
