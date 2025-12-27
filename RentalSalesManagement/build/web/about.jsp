<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về Chúng Tôi - Cho Thuê Đồ Dùng</title>
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

        .about-section {
            background: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .about-section h1 {
            font-size: 36px;
            color: #667eea;
            margin-bottom: 20px;
        }

        .about-section h2 {
            font-size: 24px;
            color: #2f3542;
            margin-top: 30px;
            margin-bottom: 15px;
        }

        .about-section p {
            line-height: 1.8;
            color: #666;
            margin-bottom: 15px;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .feature-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .feature-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .feature-card h3 {
            color: #667eea;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="about-section">
            <h1>Về Chúng Tôi</h1>
            
            <p>
                Chào mừng bạn đến với dịch vụ <strong>Cho Thuê Đồ Dùng</strong> - giải pháp tiết kiệm và tiện lợi 
                cho mọi nhu cầu của bạn!
            </p>

            <h2>Chúng Tôi Là Ai?</h2>
            <p>
                Chúng tôi là một dịch vụ chuyên cung cấp các sản phẩm cho thuê và bán với chất lượng cao, 
                giá cả hợp lý. Từ đồ điện tử, dụng cụ đến đồ nội thất - chúng tôi có tất cả những gì bạn cần.
            </p>

            <h2>Tại Sao Chọn Chúng Tôi?</h2>
            <div class="features">
                <div class="feature-card">
                    <div class="feature-icon">💰</div>
                    <h3>Giá Cả Hợp Lý</h3>
                    <p>Giá thuê và giá bán cạnh tranh nhất thị trường</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">✅</div>
                    <h3>Chất Lượng Đảm Bảo</h3>
                    <p>Tất cả sản phẩm đều được kiểm tra kỹ lưỡng trước khi giao</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🚚</div>
                    <h3>Giao Hàng Nhanh</h3>
                    <p>Dịch vụ giao hàng tận nơi nhanh chóng và tiện lợi</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🎯</div>
                    <h3>Đa Dạng Sản Phẩm</h3>
                    <p>Nhiều danh mục sản phẩm phong phú đáp ứng mọi nhu cầu</p>
                </div>
            </div>

            <h2>Cam Kết Của Chúng Tôi</h2>
            <p>
                Chúng tôi cam kết mang đến cho khách hàng trải nghiệm tốt nhất với:
            </p>
            <ul style="line-height: 2; color: #666;">
                <li>Sản phẩm chất lượng cao, đảm bảo an toàn</li>
                <li>Dịch vụ chăm sóc khách hàng tận tâm, chuyên nghiệp</li>
                <li>Giá cả minh bạch, không phát sinh chi phí ẩn</li>
                <li>Hỗ trợ 24/7 để giải đáp mọi thắc mắc</li>
            </ul>

            <h2>Liên Hệ</h2>
            <p>
                Nếu bạn có bất kỳ câu hỏi nào, đừng ngần ngại liên hệ với chúng tôi qua 
                <a href="contact.jsp" style="color: #667eea;">trang liên hệ</a> hoặc hotline: <strong>1900 1234</strong>
            </p>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>

