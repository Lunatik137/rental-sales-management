<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ - DIGITECH</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background-color: #f5f6fa;
            color: #2f3542;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 20px;
            text-align: center;
            margin-bottom: 60px;
        }

        .hero-section h1 {
            font-size: 42px;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .hero-section p {
            font-size: 18px;
            opacity: 0.95;
            max-width: 600px;
            margin: 0 auto;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px 60px;
        }

        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            margin-bottom: 40px;
        }

        /* Contact Info Section */
        .contact-info {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .contact-info h2 {
            font-size: 28px;
            color: #667eea;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .info-item {
            margin-bottom: 30px;
            padding: 25px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 12px;
            border-left: 4px solid #667eea;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .info-item:hover {
            transform: translateX(5px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.2);
        }

        .info-item h3 {
            color: #667eea;
            margin-bottom: 12px;
            font-size: 20px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .info-item p {
            color: #555;
            margin: 8px 0;
            line-height: 1.8;
            font-size: 15px;
        }

        .info-item strong {
            color: #2f3542;
            font-size: 16px;
        }

        /* Contact Form Section */
        .contact-form {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .contact-form h2 {
            font-size: 28px;
            color: #667eea;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2f3542;
            font-size: 15px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            font-family: inherit;
            transition: border-color 0.3s, box-shadow 0.3s;
            box-sizing: border-box;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-group textarea {
            height: 140px;
            resize: vertical;
        }

        .btn-submit {
            padding: 16px 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            width: 100%;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }

        /* Map Section */
        .map-section {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            margin-top: 40px;
        }

        .map-section h2 {
            font-size: 28px;
            color: #667eea;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .map-container {
            width: 100%;
            height: 400px;
            border-radius: 12px;
            overflow: hidden;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid #e0e0e0;
        }

        .map-placeholder {
            color: #999;
            font-size: 16px;
        }

        @media (max-width: 968px) {
            .contact-grid {
                grid-template-columns: 1fr;
            }

            .hero-section h1 {
                font-size: 32px;
            }

            .contact-info,
            .contact-form {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Liên Hệ Với Chúng Tôi</h1>
        <p>Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn mọi lúc, mọi nơi</p>
    </div>

    <div class="container">
        <div class="contact-grid">
            <!-- Contact Info -->
            <div class="contact-info">
                <h2>Thông Tin Liên Hệ</h2>
                
                <div class="info-item">
                    <h3>📞 Hotline</h3>
                    <p><strong>1900 6750</strong></p>
                    <p>Thứ Hai - Chủ Nhật: 08:30 - 21:00</p>
                    <p>Hỗ trợ 24/7 qua email</p>
                </div>

                <div class="info-item">
                    <h3>📧 Email</h3>
                    <p><strong>support@sapo.vn</strong></p>
                    <p>info@digitech.vn</p>
                    <p>Phản hồi trong vòng 24 giờ</p>
                </div>

                <div class="info-item">
                    <h3>📍 Địa Chỉ</h3>
                    <p><strong>Tầng 6, Tòa nhà Ledoco</strong></p>
                    <p>266 Đội Cấn, Quận Ba Đình</p>
                    <p>TP. Hà Nội</p>
                </div>

                <div class="info-item">
                    <h3>⏰ Giờ Làm Việc</h3>
                    <p><strong>Thứ Hai - Chủ Nhật</strong></p>
                    <p>08:30 - 21:00</p>
                    <p>Nghỉ các ngày lễ theo quy định</p>
                </div>
            </div>

            <!-- Contact Form -->
            <div class="contact-form">
                <h2>Gửi Tin Nhắn</h2>
                <form action="#" method="POST">
                    <div class="form-group">
                        <label for="name">Họ và Tên *</label>
                        <input type="text" id="name" name="name" required placeholder="Nhập họ và tên của bạn">
                    </div>
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" id="email" name="email" required placeholder="example@email.com">
                    </div>
                    <div class="form-group">
                        <label for="phone">Số Điện Thoại</label>
                        <input type="tel" id="phone" name="phone" placeholder="0123 456 789">
                    </div>
                    <div class="form-group">
                        <label for="subject">Chủ Đề</label>
                        <input type="text" id="subject" name="subject" placeholder="Tiêu đề tin nhắn">
                    </div>
                    <div class="form-group">
                        <label for="message">Nội Dung *</label>
                        <textarea id="message" name="message" required placeholder="Nhập nội dung tin nhắn của bạn..."></textarea>
                    </div>
                    <button type="submit" class="btn-submit">Gửi Tin Nhắn</button>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>
