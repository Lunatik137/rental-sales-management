<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.CategoryDAO" %>
<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
    
    CategoryDAO categoryDAO = new CategoryDAO();
    List<Category> categories = categoryDAO.getAllCategories();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm mới</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; }
        .header {
            background: #667eea;
            color: white;
            padding: 15px 20px;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        textarea {
            height: 100px;
            resize: vertical;
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
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Thêm sản phẩm mới</h2>
    </div>
    
    <div class="container">
        <div class="form-container">
            <form method="POST" action="products">
                <input type="hidden" name="action" value="create">
                
                <div class="form-group">
                    <label>Tên sản phẩm *</label>
                    <input type="text" name="name" required>
                </div>
                
                <div class="form-group">
                    <label>Mô tả</label>
                    <textarea name="description"></textarea>
                </div>
                
                <div class="form-group">
                    <label>Danh mục *</label>
                    <select name="categoryId" required>
                        <option value="">-- Chọn danh mục --</option>
                        <% for (Category c : categories) { %>
                            <option value="<%= c.getId() %>"><%= c.getName() %></option>
                        <% } %>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Loại sản phẩm *</label>
                    <select name="type" required>
                        <option value="sale">Chỉ bán</option>
                        <option value="rental">Chỉ thuê</option>
                        <option value="both">Bán và Thuê</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Giá chung</label>
                    <input type="number" name="price" step="0.01" min="0" value="0">
                </div>
                
                <div class="form-group">
                    <label>Giá bán</label>
                    <input type="number" name="salePrice" step="0.01" min="0" value="0">
                </div>
                
                <div class="form-group">
                    <label>Giá thuê/ngày</label>
                    <input type="number" name="rentalPrice" step="0.01" min="0" value="0">
                </div>
                
                <div class="form-group">
                    <label>Số lượng tồn kho</label>
                    <input type="number" name="stock" min="0" value="0">
                </div>
                
                <div class="form-group">
                    <label>URL hình ảnh</label>
                    <input type="text" name="imageUrl" placeholder="https://example.com/image.jpg">
                </div>
                
                <div class="form-group">
                    <label>Trạng thái</label>
                    <select name="status">
                        <option value="true">Hoạt động</option>
                        <option value="false">Ngừng</option>
                    </select>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                    <a href="products" class="btn btn-secondary">Hủy</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

