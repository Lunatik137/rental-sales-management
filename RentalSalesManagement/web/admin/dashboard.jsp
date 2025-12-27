<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.ProductDAO" %>
<%@ page import="DAO.CategoryDAO" %>
<%@ page import="java.util.List" %>
<%
    // Kiểm tra đăng nhập
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    
    int totalProducts = productDAO.getAllProducts().size();
    int totalCategories = categoryDAO.getAllCategories().size();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Quản lý Bán và Thuê Đồ</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .header {
            background: #667eea;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            font-size: 24px;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .logout-btn {
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
        }
        .logout-btn:hover {
            background: rgba(255,255,255,0.3);
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .stat-card h3 {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .stat-card .number {
            font-size: 36px;
            font-weight: bold;
            color: #667eea;
        }
        .menu {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .menu h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }
        .menu-item {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            text-decoration: none;
            color: #333;
            text-align: center;
            transition: all 0.3s;
        }
        .menu-item:hover {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
        }
        .menu-item h3 {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Quản lý Bán và Thuê Đồ</h1>
        <div class="user-info">
            <span>Xin chào, <%= session.getAttribute("username") %></span>
            <a href="logout" class="logout-btn">Đăng xuất</a>
        </div>
    </div>
    
    <div class="container">
        <div class="stats"> 
            <div class="stat-card">
                <h3>Tổng sản phẩm</h3>
                <div class="number"><%= totalProducts %></div>
            </div>
            <div class="stat-card">
                <h3>Tổng danh mục</h3>
                <div class="number"><%= totalCategories %></div>
            </div>
        </div>
        
        <div class="menu">
            <h2>Quản lý hệ thống</h2>
            <div class="menu-grid">
                <a href="products" class="menu-item">
                    <h3>Quản lý Sản phẩm</h3>
                    <p>Thêm, sửa, xóa sản phẩm</p>
                </a>
                <a href="categories" class="menu-item">
                    <h3>Quản lý Danh mục</h3>
                    <p>Thêm, sửa, xóa danh mục</p>
                </a>
                <a href="orders" class="menu-item">
                    <h3>Quản lý Đơn hàng</h3>
                    <p>Xem và quản lý đơn hàng</p>
                </a>
                <a href="customers" class="menu-item">
                    <h3>Quản lý Khách hàng</h3>
                    <p>Xem danh sách khách hàng</p>
                </a>
            </div>
        </div>
    </div>
</body>
</html>

