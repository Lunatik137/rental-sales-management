<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  /* Main Header - White */
  .main-header {
    background: white;
    padding: 20px 0;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
    animation: slideDown 0.5s ease-out;
  }

  @keyframes slideDown {
    from {
      transform: translateY(-100%);
      opacity: 0;
    }
    to {
      transform: translateY(0);
      opacity: 1;
    }
  }

  .main-header-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 30px;
    height: 70px;
  }

  .logo {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 28px;
    font-weight: bold;
    color: #667eea;
    text-decoration: none;
    transition: transform 0.3s;
    height: 100%;
  }

  .logo:hover {
    transform: scale(1.05);
  }

  .logo-icon {
    font-size: 32px;
    animation: bounce 2s infinite;
  }

  @keyframes bounce {
    0%,
    100% {
      transform: translateY(0);
    }
    50% {
      transform: translateY(-5px);
    }
  }

  .search-bar {
    flex: 1;
    position: relative;
    max-width: 600px;
    display: flex;
    align-items: center;
  }

  .search-bar input {
    width: 100%;
    padding: 12px 50px 12px 20px;
    border: 2px solid #e0e0e0;
    border-radius: 30px;
    font-size: 14px;
    transition: all 0.3s;
    line-height: normal;
    box-sizing: border-box;
    height: 44px;
    vertical-align: middle;
  }

  .search-bar input:focus {
    outline: none;
    border-color: #667eea;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
  }

  .search-bar button {
    position: absolute;
    right: 5px;
    top: 50%;
    transform: translateY(-50%);
    background: #667eea;
    color: white;
    border: none;
    padding: 8px 20px;
    border-radius: 25px;
    cursor: pointer;
    transition: all 0.3s;
  }

  .search-bar button:hover {
    background: #5568d3;
    transform: translateY(-50%) scale(1.05);
  }

  .admin-login-btn {
    padding: 10px 20px;
    background: #667eea;
    color: white;
    text-decoration: none;
    border-radius: 25px;
    font-size: 14px;
    font-weight: bold;
    transition: all 0.3s;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    white-space: nowrap;
    height: 44px;
    box-sizing: border-box;
  }

  .admin-login-btn:hover {
    background: #5568d3;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
  }

  /* Navigation Bar - Blue */
  .nav-bar {
    background: #667eea;
    padding: 0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }

  .nav-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .nav-menu {
    display: flex;
    gap: 0;
    justify-content: center;
  }

  .nav-menu a {
    color: white;
    text-decoration: none;
    padding: 15px 25px;
    display: block;
    transition: all 0.3s;
    position: relative;
    font-weight: 500;
  }

  .nav-menu a::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%) scaleX(0);
    width: 80%;
    height: 3px;
    background: white;
    transition: transform 0.3s;
  }

  .nav-menu a:hover::after {
    transform: translateX(-50%) scaleX(1);
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

<!-- Main Header -->
<div class="main-header">
  <div class="main-header-content">
    <a href="home" class="logo">
      <span class="logo-icon">📦</span>
      <span>ChoThuêĐồDùng</span>
    </a>

    <form method="GET" action="products" class="search-bar">
      <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm..." />
      <button type="submit">🔍</button>
    </form>

    <a href="admin/login.jsp" class="admin-login-btn">Đăng nhập Admin</a>
  </div>
</div>

<!-- Navigation Bar -->
<div class="nav-bar">
  <div class="nav-content">
    <nav class="nav-menu">
      <a href="home">Trang chủ</a>
      <a href="products">Sản phẩm</a>
      <a href="about.jsp">Giới thiệu</a>
      <a href="contact.jsp">Liên hệ</a>
    </nav>
  </div>
</div>
