<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%
    // Kiểm tra đăng nhập
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
    
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
    
    String keyword = (String) request.getAttribute("keyword");
    if (keyword != null) {
        products = productDAO.searchProducts(keyword);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Sản phẩm</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; }
        .header {
            background: #667eea;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .toolbar {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background: #667eea;
            color: white;
        }
        .btn-primary:hover { background: #5568d3; }
        .btn-danger { background: #dc3545; color: white; }
        .btn-danger:hover { background: #c82333; }
        .btn-warning { background: #ffc107; color: #333; }
        .btn-warning:hover { background: #e0a800; }
        .search-box {
            display: flex;
            gap: 10px;
        }
        .search-box input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        th {
            background: #667eea;
            color: white;
        }
        tr:hover { background: #f8f9fa; }
        .status-active { color: green; font-weight: bold; }
        .status-inactive { color: red; font-weight: bold; }
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .message-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Quản lý Sản phẩm</h2>
        <a href="dashboard" style="color: white;">← Về Dashboard</a>
    </div>
    
    <div class="container">
        <% if (request.getParameter("message") != null) { %>
            <div class="message message-success">
                <% 
                    String msg = request.getParameter("message");
                    if (msg.equals("add_success")) out.print("Thêm sản phẩm thành công!");
                    else if (msg.equals("update_success")) out.print("Cập nhật sản phẩm thành công!");
                    else if (msg.equals("delete_success")) out.print("Xóa sản phẩm thành công!");
                %>
            </div>
        <% } %>
        
        <div class="toolbar">
            <a href="products?action=add" class="btn btn-primary">+ Thêm sản phẩm mới</a>
            <form method="GET" action="products" class="search-box">
                <input type="hidden" name="action" value="search">
                <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm..." 
                       value="<%= keyword != null ? keyword : "" %>">
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            </form>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Danh mục</th>
                    <th>Loại</th>
                    <th>Giá bán</th>
                    <th>Giá thuê</th>
                    <th>Tồn kho</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <% if (products.isEmpty()) { %>
                    <tr>
                        <td colspan="9" style="text-align: center; padding: 30px;">
                            Không có sản phẩm nào
                        </td>
                    </tr>
                <% } else { %>
                    <% for (Product p : products) { %>
                        <tr>
                            <td><%= p.getId() %></td>
                            <td><%= p.getName() %></td>
                            <td><%= p.getCategory() != null ? p.getCategory().getName() : "N/A" %></td>
                            <td>
                                <% 
                                    String type = p.getType();
                                    if (type.equals("sale")) out.print("Bán");
                                    else if (type.equals("rental")) out.print("Thuê");
                                    else if (type.equals("both")) out.print("Bán & Thuê");
                                %>
                            </td>
                            <td><%= p.getSalePrice() != null ? String.format("%,.0f", p.getSalePrice()) : "-" %> đ</td>
                            <td><%= p.getRentalPrice() != null ? String.format("%,.0f", p.getRentalPrice()) : "-" %> đ/ngày</td>
                            <td><%= p.getStock() %></td>
                            <td class="<%= p.isStatus() ? "status-active" : "status-inactive" %>">
                                <%= p.isStatus() ? "Hoạt động" : "Ngừng" %>
                            </td>
                            <td>
                                <a href="products?action=edit&id=<%= p.getId() %>" class="btn btn-warning">Sửa</a>
                                <a href="products?action=delete&id=<%= p.getId() %>" 
                                   class="btn btn-danger" 
                                   onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">Xóa</a>
                            </td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>

