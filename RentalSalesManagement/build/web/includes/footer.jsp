<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .footer {
        background: #2f3542;
        color: white;
        padding: 50px 0 20px;
        margin-top: 60px;
        width: 100%;
        min-width: 100%;
        box-sizing: border-box;
        position: relative;
        left: 0;
        right: 0;
    }
    
    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: 2fr 1fr 1fr 1fr 1.5fr;
        gap: 40px;
    }
    
    .footer-column h4 {
        color: white;
        margin-bottom: 20px;
        font-size: 18px;
        font-weight: bold;
    }
    
    .footer-column p {
        color: rgba(255,255,255,0.8);
        line-height: 1.8;
        font-size: 14px;
        margin-bottom: 10px;
        margin-top: 0;
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
    
    .footer-logo {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 15px;
    }
    
    .footer-contact {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 10px;
        color: rgba(255,255,255,0.8);
        font-size: 14px;
    }
    
    .footer-contact-icon {
        font-size: 18px;
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
    
    @media (max-width: 968px) {
        .footer-container {
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        }
    }
</style>

<div class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <div class="footer-logo">DIGITECH</div>
            <div class="footer-contact">
                <span class="footer-contact-icon">📍</span>
                <span>Tầng 6, Tòa nhà Ledoco, 266 Đội Cấn, Quận Ba Đình, TP Hà Nội</span>
            </div>
            <div class="footer-contact">
                <span class="footer-contact-icon">📞</span>
                <span>1900 6750</span>
            </div>
            <div class="footer-contact">
                <span class="footer-contact-icon">✉️</span>
                <span>support@sapo.vn</span>
            </div>
        </div>
        
        <div class="footer-column">
            <h4>VỀ CHÚNG TÔI</h4>
            <ul>
                <li><a href="home">Trang chủ</a></li>
                <li><a href="about.jsp">Giới thiệu</a></li>
                <li><a href="products">Sản phẩm</a></li>
                <li><a href="news.jsp">Tin tức</a></li>
                <li><a href="contact.jsp">Liên hệ</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h4>CHÍNH SÁCH</h4>
            <ul>
                <li><a href="#">Chính sách giao hàng</a></li>
                <li><a href="#">Chính sách đổi trả</a></li>
                <li><a href="#">Chính sách bảo hành</a></li>
                <li><a href="#">Hướng dẫn trả góp</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h4>TƯ VẤN KHÁCH HÀNG</h4>
            <p>Mua hàng: 1900 6750</p>
            <p>Khiếu nại: 1900 6750</p>
            <p>Bảo hành: 1900 6750</p>
        </div>
        
        <div class="footer-column">
            <h4>PHƯƠNG THỨC THANH TOÁN</h4>
            <div class="payment-methods" style="justify-content: flex-start;">
                <span class="payment-icon">
                    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/visa.svg" alt="Visa" />
                </span>
                <span class="payment-icon">
                    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/mastercard.svg" alt="Mastercard" />
                </span>
                <span class="payment-icon">
                    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/jcb.svg" alt="JCB" />
                </span>
                <span class="payment-icon">
                    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v9/icons/zalopay.svg" alt="ZaloPay" />
                </span>
            </div>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>© Bản quyền thuộc về Lê Nam | Cung cấp bởi Sapo</p>
    </div>
</div>
