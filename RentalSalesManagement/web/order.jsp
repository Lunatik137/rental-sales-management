<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt ${orderType == 'sale' ? 'mua' : 'thuê'} - ${product.name}</title>
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
        .order-wrapper {
            display: grid;
            grid-template-columns: 2fr 1.5fr;
            gap: 30px;
        }
        .card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            font-size: 26px;
            margin-bottom: 20px;
            color: #667eea;
        }
        h2 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #2f3542;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            font-family: inherit;
        }
        textarea {
            height: 80px;
            resize: vertical;
        }
        .btn-primary {
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
        .btn-primary:hover {
            background: #5568d3;
        }
        .btn-secondary {
            padding: 12px 20px;
            background: #6c757d;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
        .product-summary-title {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 14px;
        }
        .summary-row span:first-child {
            color: #666;
        }
        .summary-row span:last-child {
            font-weight: bold;
        }
        .order-type-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            margin-bottom: 10px;
        }
        .type-sale {
            background: #d4edda;
            color: #155724;
        }
        .type-rental {
            background: #cce5ff;
            color: #004085;
        }
        .error-message {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Đặt ${orderType == 'sale' ? 'mua' : 'thuê'} - ${product.name}</h1>

    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>

    <div class="order-wrapper">
        <!-- Form thông tin khách và đơn -->
        <div class="card">
            <h2>Thông tin khách hàng</h2>
            <form method="POST" action="order">
                <input type="hidden" name="productId" value="${product.id}">
                <input type="hidden" name="orderType" value="${orderType}">

                <div class="form-group">
                    <label>Họ và Tên *</label>
                    <input type="text" name="name" required>
                </div>
                <div class="form-group">
                    <label>Email *</label>
                    <input type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label>Số điện thoại *</label>
                    <input type="tel" name="phone" required>
                </div>
                <div class="form-group">
                    <label>Địa chỉ nhận hàng / giao thiết bị *</label>
                    <textarea name="address" required></textarea>
                </div>

                <h2>Thông tin đơn hàng</h2>
                <div class="form-group">
                    <label>Số lượng *</label>
                    <input type="number" name="quantity" min="1" max="${product.stock}" value="1" required>
                </div>

                <c:if test="${orderType == 'rental'}">
                    <div class="form-group">
                        <label>Ngày bắt đầu thuê *</label>
                        <input type="date" name="rentalStartDate" required>
                    </div>
                    <div class="form-group">
                        <label>Ngày kết thúc thuê *</label>
                        <input type="date" name="rentalEndDate" required>
                    </div>
                </c:if>

                <div class="form-group">
                    <label>Ghi chú</label>
                    <textarea name="notes" placeholder="Ví dụ: giao buổi sáng, liên hệ trước khi giao..."></textarea>
                </div>

                <div style="margin-top: 20px;">
                    <button type="submit" class="btn-primary">Xác nhận đặt ${orderType == 'sale' ? 'mua' : 'thuê'}</button>
                    <a href="product-detail.jsp?id=${product.id}" onclick="history.back(); return false;" class="btn-secondary">Quay lại</a>
                </div>
            </form>
        </div>

        <!-- Tóm tắt sản phẩm -->
        <div class="card">
            <div class="product-summary-title">Tóm tắt đơn hàng</div>
            <div class="order-type-badge ${orderType == 'sale' ? 'type-sale' : 'type-rental'}">
                <c:choose>
                    <c:when test="${orderType == 'sale'}">Đơn mua</c:when>
                    <c:otherwise>Đơn thuê</c:otherwise>
                </c:choose>
            </div>
            <div class="summary-row">
                <span>Sản phẩm</span>
                <span>${product.name}</span>
            </div>
            <div class="summary-row">
                <span>Tồn kho</span>
                <span>${product.stock}</span>
            </div>
            <c:if test="${orderType == 'sale'}">
                <div class="summary-row">
                    <span>Giá bán</span>
                    <span>
                        <c:choose>
                            <c:when test="${product.salePrice != null && product.salePrice > 0}">
                                <fmt:formatNumber value="${product.salePrice}" type="number" /> đ
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${product.price}" type="number" /> đ
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </c:if>
            <c:if test="${orderType == 'rental'}">
                <div class="summary-row">
                    <span>Giá thuê/ngày</span>
                    <span>
                        <c:choose>
                            <c:when test="${product.rentalPrice != null && product.rentalPrice > 0}">
                                <fmt:formatNumber value="${product.rentalPrice}" type="number" /> đ
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${product.price}" type="number" /> đ
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </c:if>
            <p style="margin-top: 15px; font-size: 13px; color: #777;">
                Tổng tiền sẽ được tính tự động theo số lượng
                <c:if test="${orderType == 'rental'}">
                    và số ngày thuê
                </c:if>
                sau khi bạn xác nhận.
            </p>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
</body>
</html>


