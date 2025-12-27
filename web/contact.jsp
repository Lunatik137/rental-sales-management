<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ - Cho Thuê Đồ Dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background-color: #f5f6fa;
            color: #2f3542;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .contact-section {
            background: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .contact-section h1 {
            font-size: 36px;
            color: #667eea;
            margin-bottom: 30px;
        }

        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
        }

        .contact-info h2 {
            font-size: 24px;
            color: #2f3542;
            margin-bottom: 20px;
        }

        .info-item {
            margin-bottom: 25px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }

        .info-item h3 {
            color: #667eea;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .info-item p {
            color: #666;
            margin: 5px 0;
            line-height: 1.6;
        }

        .contact-form h2 {
            font-size: 24px;
            color: #2f3542;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            font-family: inherit;
        }

        .form-group textarea {
            height: 120px;
            resize: vertical;
        }

        .btn-submit {
            padding: 12px 30px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-submit:hover {
            background: #5568d3;
        }

        @media (max-width: 768px) {
            .contact-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="contact-section">
            <h1>Liên Hệ Với Chúng Tôi</h1>
            
            <div class="contact-grid">
                <div class="contact-info">
                    <h2>Thông Tin Liên Hệ</h2>
                    
                    <div class="info-item">
                        <h3>📞 Hotline</h3>
                        <p><strong>1900 1234</strong></p>
                        <p>Thứ Hai - Chủ Nhật: 8:00 - 20:00</p>
                    </div>

                    <div class="info-item">
                        <h3>📧 Email</h3>
                        <p><strong>info@chothuedodung.com</strong></p>
                        <p>support@chothuedodung.com</p>
                    </div>

                    <div class="info-item">
                        <h3>📍 Địa Chỉ</h3>
                        <p><strong>123 Đường ABC</strong></p>
                        <p>Quận XYZ, TP. Hồ Chí Minh</p>
                    </div>

                    <div class="info-item">
                        <h3>⏰ Giờ Làm Việc</h3>
                        <p><strong>Thứ Hai - Chủ Nhật</strong></p>
                        <p>8:00 - 20:00</p>
                    </div>
                </div>

                <div class="contact-form">
                    <h2>Gửi Tin Nhắn</h2>
                    <form action="#" method="POST">
                        <div class="form-group">
                            <label for="name">Họ và Tên *</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email *</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Số Điện Thoại</label>
                            <input type="tel" id="phone" name="phone">
                        </div>
                        <div class="form-group">
                            <label for="message">Nội Dung *</label>
                            <textarea id="message" name="message" required></textarea>
                        </div>
                        <button type="submit" class="btn-submit">Gửi Tin Nhắn</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>

