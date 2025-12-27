<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background-color: #f5f6fa;
            color: #2f3542;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        .card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            font-size: 26px;
            color: #28a745;
            margin-bottom: 10px;
        }
        p {
            margin: 8px 0;
            color: #555;
        }
        .order-info {
            margin-top: 20px;
            text-align: left;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 6px;
            font-size: 14px;
        }
        .info-row span:first-child {
            color: #666;
        }
        .info-row span:last-child {
            font-weight: bold;
        }
        .btn-primary {
            padding: 10px 25px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .btn-primary:hover {
            background: #5568d3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <h1>Đặt hàng thành công!</h1>
        <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>
        <p>Mã đơn hàng: <strong>#${orderId}</strong></p>

        <div class="order-info">
            <div class="info-row">
                <span>Khách hàng:</span>
                <span>${order.customerName}</span>
            </div>
            <div class="info-row">
                <span>Email:</span>
                <span>${order.customerEmail}</span>
            </div>
            <div class="info-row">
                <span>Số điện thoại:</span>
                <span>${order.customerPhone}</span>
            </div>
            <div class="info-row">
                <span>Địa chỉ:</span>
                <span>${order.customerAddress}</span>
            </div>
            <div class="info-row">
                <span>Sản phẩm:</span>
                <span>${product.name}</span>
            </div>
            <div class="info-row">
                <span>Loại đơn:</span>
                <span>
                    <c:choose>
                        <c:when test="${order.orderType == 'sale'}">Đơn mua</c:when>
                        <c:otherwise>Đơn thuê</c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div class="info-row">
                <span>Số lượng:</span>
                <span>${quantity}</span>
            </div>
            <c:if test="${order.orderType == 'rental'}">
                <div class="info-row">
                    <span>Số ngày thuê:</span>
                    <span>${rentalDays}</span>
                </div>
            </c:if>
            <div class="info-row">
                <span>Tổng tiền ước tính:</span>
                <span><fmt:formatNumber value="${order.totalAmount}" type="number" /> đ</span>
            </div>
        </div>

        <p style="margin-top: 15px; font-size: 13px; color: #777;">
            Nhân viên của chúng tôi sẽ liên hệ với bạn để xác nhận đơn hàng và thời gian giao hàng/nhận đồ thuê.
        </p>

        <a href="products" class="btn-primary">Tiếp tục xem sản phẩm</a>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
</body>
</html>


