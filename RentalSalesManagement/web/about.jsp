<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về Chúng Tôi - DIGITECH</title>
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
            padding: 80px 20px;
            text-align: center;
            margin-bottom: 60px;
        }

        .hero-section h1 {
            font-size: 48px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .hero-section p {
            font-size: 20px;
            opacity: 0.95;
            max-width: 700px;
            margin: 0 auto;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px 60px;
        }

        /* About Section */
        .about-section {
            background: white;
            border-radius: 15px;
            padding: 50px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            margin-bottom: 40px;
        }

        .about-section h2 {
            font-size: 32px;
            color: #667eea;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .about-section p {
            line-height: 1.9;
            color: #555;
            margin-bottom: 20px;
            font-size: 16px;
        }

        /* Features Grid */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin: 40px 0;
        }

        .feature-card {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 35px 25px;
            border-radius: 15px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            border: 1px solid #e0e0e0;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.2);
        }

        .feature-icon {
            font-size: 60px;
            margin-bottom: 20px;
            display: block;
        }

        .feature-card h3 {
            color: #667eea;
            margin-bottom: 15px;
            font-size: 22px;
            font-weight: bold;
        }

        .feature-card p {
            color: #666;
            line-height: 1.7;
            margin: 0;
        }

        /* Commitment Section */
        .commitment-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 50px;
            border-radius: 15px;
            margin: 40px 0;
        }

        .commitment-section h2 {
            color: white;
            font-size: 32px;
            margin-bottom: 30px;
            text-align: center;
        }

        .commitment-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            list-style: none;
            padding: 0;
        }

        .commitment-list li {
            background: rgba(255, 255, 255, 0.15);
            padding: 20px;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            font-size: 16px;
            line-height: 1.8;
        }

        .commitment-list li::before {
            content: "✓ ";
            color: #ffd700;
            font-weight: bold;
            font-size: 20px;
            margin-right: 10px;
        }

        /* Stats Section */
        .stats-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            margin: 50px 0;
        }

        .stat-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .stat-number {
            font-size: 48px;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 10px;
        }

        .stat-label {
            color: #666;
            font-size: 16px;
        }

        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 36px;
            }

            .hero-section p {
                font-size: 16px;
            }

            .about-section {
                padding: 30px 20px;
            }

            .features {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Về DIGITECH</h1>
        <p>Đối tác tin cậy của bạn trong lĩnh vực công nghệ và thiết bị điện tử</p>
    </div>

    <div class="container">
        <!-- About Section -->
        <div class="about-section">
            <h2>Chúng Tôi Là Ai?</h2>
            <p>
                <strong>DIGITECH</strong> là một trong những đơn vị hàng đầu chuyên cung cấp các sản phẩm công nghệ, 
                thiết bị điện tử với dịch vụ cho thuê và bán lẻ uy tín. Với nhiều năm kinh nghiệm trong ngành, 
                chúng tôi tự hào mang đến cho khách hàng những sản phẩm chất lượng cao, giá cả hợp lý cùng 
                dịch vụ chăm sóc khách hàng chuyên nghiệp.
            </p>
            <p>
                Từ máy quay phim chuyên nghiệp, camera, thiết bị âm thanh đến các phụ kiện công nghệ - 
                chúng tôi có đầy đủ những gì bạn cần cho mọi dự án và nhu cầu sử dụng.
            </p>
        </div>

        <!-- Stats Section -->
        <div class="stats-section">
            <div class="stat-card">
                <div class="stat-number">5000+</div>
                <div class="stat-label">Khách hàng hài lòng</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">1000+</div>
                <div class="stat-label">Sản phẩm đa dạng</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">10+</div>
                <div class="stat-label">Năm kinh nghiệm</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">24/7</div>
                <div class="stat-label">Hỗ trợ khách hàng</div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="about-section">
            <h2>Tại Sao Chọn DIGITECH?</h2>
            <div class="features">
                <div class="feature-card">
                    <span class="feature-icon">💰</span>
                    <h3>Giá Cả Hợp Lý</h3>
                    <p>Giá thuê và giá bán cạnh tranh nhất thị trường, minh bạch không phát sinh chi phí ẩn</p>
                </div>
                <div class="feature-card">
                    <span class="feature-icon">✅</span>
                    <h3>Chất Lượng Đảm Bảo</h3>
                    <p>Tất cả sản phẩm đều được kiểm tra kỹ lưỡng, đảm bảo chất lượng trước khi giao hàng</p>
                </div>
                <div class="feature-card">
                    <span class="feature-icon">🚚</span>
                    <h3>Giao Hàng Nhanh</h3>
                    <p>Dịch vụ giao hàng tận nơi nhanh chóng, tiện lợi trong nội thành và toàn quốc</p>
                </div>
                <div class="feature-card">
                    <span class="feature-icon">🎯</span>
                    <h3>Đa Dạng Sản Phẩm</h3>
                    <p>Nhiều danh mục sản phẩm phong phú, đáp ứng mọi nhu cầu từ cá nhân đến doanh nghiệp</p>
                </div>
                <div class="feature-card">
                    <span class="feature-icon">🛡️</span>
                    <h3>Bảo Hành Uy Tín</h3>
                    <p>Chính sách bảo hành rõ ràng, hỗ trợ sửa chữa và đổi trả nhanh chóng</p>
                </div>
                <div class="feature-card">
                    <span class="feature-icon">💬</span>
                    <h3>Tư Vấn Chuyên Nghiệp</h3>
                    <p>Đội ngũ tư vấn giàu kinh nghiệm, sẵn sàng hỗ trợ bạn chọn sản phẩm phù hợp nhất</p>
                </div>
            </div>
        </div>

        <!-- Commitment Section -->
        <div class="commitment-section">
            <h2>Cam Kết Của Chúng Tôi</h2>
            <ul class="commitment-list">
                <li>Sản phẩm chất lượng cao, đảm bảo an toàn và đúng mô tả</li>
                <li>Dịch vụ chăm sóc khách hàng tận tâm, chuyên nghiệp 24/7</li>
                <li>Giá cả minh bạch, không phát sinh chi phí ẩn</li>
                <li>Giao hàng đúng hẹn, đóng gói cẩn thận</li>
                <li>Chính sách đổi trả linh hoạt, bảo hành uy tín</li>
                <li>Hỗ trợ kỹ thuật và tư vấn miễn phí</li>
            </ul>
        </div>

        <!-- Contact CTA -->
        <div class="about-section" style="text-align: center; background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);">
            <h2 style="color: #2f3542;">Liên Hệ Với Chúng Tôi</h2>
            <p style="font-size: 18px; color: #555; margin-bottom: 30px;">
                Nếu bạn có bất kỳ câu hỏi nào, đừng ngần ngại liên hệ với chúng tôi
            </p>
            <a href="contact.jsp" style="display: inline-block; background: #667eea; color: white; padding: 15px 40px; border-radius: 30px; text-decoration: none; font-weight: bold; font-size: 16px; transition: transform 0.3s;">
                Liên Hệ Ngay
            </a>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>
