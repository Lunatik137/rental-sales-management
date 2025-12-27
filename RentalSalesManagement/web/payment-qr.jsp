<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán - Cho Thuê Đồ Dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            color: #2f3542;
            min-height: 100vh;
        }

        .payment-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 40px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            animation: fadeInUp 0.6s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .payment-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .payment-header h1 {
            color: #667eea;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .payment-header p {
            color: #666;
            font-size: 14px;
        }

        .order-summary {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 30px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .summary-row.total {
            font-size: 20px;
            font-weight: bold;
            color: #667eea;
            padding-top: 10px;
            border-top: 2px solid #e0e0e0;
            margin-top: 10px;
        }

        .qr-code-container {
            text-align: center;
            padding: 30px;
            background: #f8f9fa;
            border-radius: 12px;
            margin-bottom: 30px;
        }

        .qr-code {
            width: 250px;
            height: 250px;
            margin: 0 auto 20px;
            background: white;
            border: 3px solid #667eea;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 100px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }

        .payment-info {
            background: #fff3cd;
            border: 1px solid #ffc107;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            font-size: 13px;
            color: #856404;
        }

        .payment-info strong {
            display: block;
            margin-bottom: 5px;
        }

        .confirm-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .confirm-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }

        .test-link {
            text-align: center;
            margin-top: 15px;
        }

        .test-link a {
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }

        .test-link a:hover {
            color: #5568d3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <div class="payment-header">
            <h1>💳 Thanh toán đơn hàng</h1>
            <p>Quét mã QR để thanh toán</p>
        </div>

        <div class="order-summary">
            <div class="summary-row">
                <span>Mã đơn hàng:</span>
                <strong>#${orderId}</strong>
            </div>
            <div class="summary-row">
                <span>Sản phẩm:</span>
                <span>${product.name}</span>
            </div>
            <div class="summary-row">
                <span>Số lượng:</span>
                <span>${quantity}</span>
            </div>
            <c:if test="${order.orderType == 'rental' && rentalDays != null}">
                <div class="summary-row">
                    <span>Số ngày thuê:</span>
                    <span>${rentalDays} ngày</span>
                </div>
            </c:if>
            <div class="summary-row total">
                <span>Tổng tiền:</span>
                <span><fmt:formatNumber value="${order.totalAmount}" type="number" /> đ</span>
            </div>
        </div>

        <div class="qr-code-container">
            <div class="qr-code">
                📱
            </div>
            <p style="font-size: 14px; color: #666; margin: 0;">
                Quét mã QR bằng ứng dụng ngân hàng của bạn
            </p>
        </div>

        <div class="payment-info">
            <strong>⚠️ Lưu ý:</strong>
            <p>Đây là trang thanh toán demo. Trong môi trường thực tế, mã QR sẽ được tạo tự động từ API thanh toán.</p>
        </div>

        <form method="POST" action="order?action=confirm&orderId=${orderId}">
            <button type="submit" class="confirm-btn">
                ✅ Xác nhận đã thanh toán
            </button>
        </form>

        <div class="test-link">
            <a href="order?action=confirm&orderId=${orderId}">🔗 Hoặc click đây để test (bỏ qua thanh toán)</a>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>

