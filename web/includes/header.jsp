<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    header {
        width: 100%;
        background-color: rgba(0, 0, 0, 0.9);
        color: white;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .header-logo {
        display: flex;
        align-items: center;
        font-size: 22px;
        font-weight: bold;
    }

    .logo-icon {
        margin-right: 10px;
        font-size: 28px;
    }

    .logo-text {
        color: #ffd700;
    }

    .header-menu {
        display: flex;
        gap: 25px;
    }

    .header-menu a {
        color: white;
        text-decoration: none;
        font-size: 16px;
        padding: 6px 10px;
        transition: color 0.3s ease;
    }

    .header-menu a:hover {
        color: #ffd700;
    }

    .header-links {
        display: flex;
        gap: 15px;
        align-items: center;
    }

    .btn {
        padding: 8px 18px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 15px;
        min-width: 80px;
        text-align: center;
        transition: background-color 0.3s ease;
    }

    .btn-login {
        background-color: #ffd700;
        color: black;
    }

    .btn-login:hover {
        background-color: #e6c200;
    }
</style>

<header>
    <div class="header-logo">
        <span class="logo-icon">📦</span>
        <a href="home" style="text-decoration: none; color: inherit;">
            <span class="logo-text">Cho Thuê Đồ Dùng</span>
        </a>
    </div>

    <nav class="header-menu">
        <a href="home">Trang chủ</a>
        <a href="products">Sản phẩm</a>
        <a href="about.jsp">Giới thiệu</a>
        <a href="contact.jsp">Liên hệ</a>
    </nav>

    <div class="header-links">
        <a href="admin/login.jsp" class="btn btn-login">Đăng nhập Admin</a>
    </div>
</header>

