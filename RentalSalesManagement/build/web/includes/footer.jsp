<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .footer {
        background-color: #1a1a1a;
        color: #ccc;
        padding: 40px 20px;
        font-family: Arial, sans-serif;
        margin-top: 50px;
    }

    .footer .footer-container {
        max-width: 1200px;
        margin: auto;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .footer-column {
        flex: 1 1 200px;
        margin: 20px;
    }

    .footer-column h4 {
        color: #fff;
        margin-bottom: 15px;
    }

    .footer-column ul {
        list-style: none;
        padding: 0;
        line-height: 1.8;
    }

    .footer-column ul li a {
        color: #ccc;
        font-size: 14px;
        text-decoration: none;
    }

    .footer-column ul li a:hover {
        text-decoration: underline;
        color: #ffd700;
    }

    .footer-bottom {
        text-align: center;
        padding-top: 20px;
        color: #aaa;
        font-size: 13px;
        border-top: 1px solid #333;
        margin-top: 20px;
    }
</style>

<div class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h4>Giờ Mở Cửa</h4>
            <ul>
                <li>Thứ Hai - Chủ Nhật: 8:00 - 20:00</li>
                <li>Hotline: 1900 1234</li>
            </ul>
        </div>

        <div class="footer-column">
            <h4>Danh Mục</h4>
            <ul>
                <li><a href="products?category=1">Đồ điện tử</a></li>
                <li><a href="products?category=2">Dụng cụ</a></li>
                <li><a href="products?category=3">Đồ nội thất</a></li>
                <li><a href="products?category=4">Thiết bị gia đình</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h4>Thông Tin</h4>
            <ul>
                <li><a href="about.jsp">Về chúng tôi</a></li>
                <li><a href="contact.jsp">Liên hệ</a></li>
                <li><a href="products">Tất cả sản phẩm</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h4>Dịch Vụ Cho Thuê Đồ Dùng</h4>
            <ul>
                Chúng tôi cung cấp dịch vụ cho thuê đồ dùng chất lượng cao với giá cả hợp lý. 
                Từ đồ điện tử, dụng cụ đến đồ nội thất - tất cả đều có sẵn để phục vụ nhu cầu của bạn.
                Đặt hàng ngay hôm nay để nhận ưu đãi đặc biệt!
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        📩 Email: info@chothuedodung.com  |  © 2025 Cho Thuê Đồ Dùng. Mọi quyền được bảo lưu.
    </div>
</div>

