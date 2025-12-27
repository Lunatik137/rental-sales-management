<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .footer {
        background: #667eea;
        color: white;
        padding: 50px 0 20px;
        margin-top: 60px;
    }
    
    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 40px;
    }
    
    .footer-column h4 {
        color: white;
        margin-bottom: 20px;
        font-size: 18px;
    }
    
    .footer-column p {
        color: rgba(255,255,255,0.8);
        line-height: 1.8;
        font-size: 14px;
    }
    
    .footer-column ul {
        list-style: none;
        padding: 0;
    }
    
    .footer-column ul li {
        margin-bottom: 10px;
    }
    
    .footer-column ul li a {
        color: rgba(255,255,255,0.8);
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s;
    }
    
    .footer-column ul li a:hover {
        color: white;
        padding-left: 5px;
    }
    
    .social-icons {
        display: flex;
        gap: 15px;
        margin-top: 15px;
    }
    
    .social-icons a {
        width: 40px;
        height: 40px;
        background: rgba(255,255,255,0.1);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        text-decoration: none;
        font-size: 18px;
        transition: all 0.3s;
        overflow: hidden;
    }
    
    .social-icons a img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    
    .social-icons a:hover {
        background: rgba(255,255,255,0.2);
        transform: scale(1.1);
    }
    
    .footer-bottom {
        border-top: 1px solid rgba(255,255,255,0.2);
        margin-top: 40px;
        padding-top: 20px;
        text-align: center;
        color: rgba(255,255,255,0.8);
        font-size: 13px;
    }
    
    .payment-methods {
        display: flex;
        gap: 10px;
        justify-content: center;
        margin-top: 15px;
        flex-wrap: wrap;
    }
    
    .payment-icon {
        background: white;
        padding: 8px 12px;
        border-radius: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 40px;
    }
    
    .payment-icon img {
        height: 24px;
        width: auto;
        object-fit: contain;
    }
</style>

<div class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h4>ChoThuêĐồDùng</h4>
            <p>Giải pháp tiết kiệm cho mọi nhu cầu của bạn. Chúng tôi cung cấp dịch vụ cho thuê và bán đồ dùng chất lượng cao với giá cả hợp lý.</p>
            <div class="social-icons">
                <a href="#" title="Facebook">
                    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/facebook.svg" alt="Facebook" />
                </a>
                <a href="#" title="Twitter">
                    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/twitter.svg" alt="Twitter" />
                </a>
                <a href="#" title="Instagram">
                    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/instagram.svg" alt="Instagram" />
                </a>
                <a href="#" title="Pinterest">
                    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/pinterest.svg" alt="Pinterest" />
                </a>
            </div>
        </div>
        
        <div class="footer-column">
            <h4>Liên kết nhanh</h4>
            <ul>
                <li><a href="about.jsp">Về chúng tôi</a></li>
                <li><a href="contact.jsp">Liên hệ</a></li>
                <li><a href="#">Chính sách bảo mật</a></li>
                <li><a href="#">Điều khoản sử dụng</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h4>Mua sắm</h4>
            <ul>
                <li><a href="products?category=1">Đồ điện tử</a></li>
                <li><a href="products?category=2">Dụng cụ</a></li>
                <li><a href="products?category=3">Đồ nội thất</a></li>
                <li><a href="products?category=4">Thiết bị gia đình</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h4>Thông tin</h4>
            <ul>
                <li><a href="about.jsp">Về chúng tôi</a></li>
                <li><a href="contact.jsp">Liên hệ</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Tuyển dụng</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h4>Dịch vụ khách hàng</h4>
            <ul>
                <li><a href="#">Tài khoản</a></li>
                <li><a href="#">Theo dõi đơn hàng</a></li>
                <li><a href="#">Yêu thích</a></li>
                <li><a href="#">Chính sách đổi trả</a></li>
                <li><a href="#">Câu hỏi thường gặp</a></li>
            </ul>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>Copyright © 2025 ChoThuêĐồDùng. Tất cả quyền được bảo lưu.</p>
        <div class="payment-methods">
            <span class="payment-icon">
                <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/visa.svg" alt="Visa" />
            </span>
            <span class="payment-icon">
                <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/mastercard.svg" alt="Mastercard" />
            </span>
            <span class="payment-icon">
                <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/paypal.svg" alt="PayPal" />
            </span>
            <span class="payment-icon">
                <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/momo.svg" alt="MoMo" style="filter: brightness(0) invert(1);" />
            </span>
        </div>
    </div>
</div>
