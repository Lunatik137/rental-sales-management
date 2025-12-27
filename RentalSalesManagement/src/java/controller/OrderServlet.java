package controller;

import DAO.OrderDAO;
import DAO.ProductDAO;
import model.Order;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Lớp OrderServlet - Xử lý luồng đặt mua / thuê đồ (khách không cần đăng nhập)
 *
 * GET /order  : Hiển thị form đặt hàng cho 1 sản phẩm
 * POST /order : Nhận form, tạo đơn hàng và hiển thị trang xác nhận
 */
public class OrderServlet extends HttpServlet {

    private ProductDAO productDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        
        // Xử lý xác nhận thanh toán
        if ("confirm".equals(action)) {
            String orderIdRaw = request.getParameter("orderId");
            if (orderIdRaw != null) {
                try {
                    int orderId = Integer.parseInt(orderIdRaw);
                    // Lấy thông tin đơn hàng từ session hoặc database
                    // Tạm thời lấy từ request attribute nếu có
                    Order order = (Order) request.getAttribute("order");
                    Product product = (Product) request.getAttribute("product");
                    Integer quantity = (Integer) request.getAttribute("quantity");
                    Integer rentalDays = (Integer) request.getAttribute("rentalDays");
                    
                    // Nếu không có trong request, có thể lấy từ database
                    // Order order = orderDAO.getOrderById(orderId);
                    
                    if (order != null && product != null) {
                        // Cập nhật trạng thái đơn hàng thành confirmed
                        // orderDAO.updateOrderStatus(orderId, "confirmed");
                        // Giảm stock sau khi thanh toán thành công
                        // orderDAO.decreaseProductStock(product.getId(), quantity);
                        
                        request.setAttribute("order", order);
                        request.setAttribute("product", product);
                        request.setAttribute("orderId", orderId);
                        request.setAttribute("quantity", quantity);
                        request.setAttribute("rentalDays", rentalDays);
                        request.getRequestDispatcher("/order-success.jsp").forward(request, response);
                        return;
                    } else {
                        // Nếu không có dữ liệu, redirect với orderId
                        response.sendRedirect("order-success.jsp?orderId=" + orderId);
                        return;
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect("products");
                    return;
                }
            }
        }
        
        // Hiển thị form đặt hàng
        String productIdRaw = request.getParameter("productId");
        String type = request.getParameter("type"); // "sale" hoặc "rental"

        if (productIdRaw == null || type == null) {
            response.sendRedirect("products");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdRaw);
            Product product = productDAO.getProductById(productId);
            if (product == null) {
                response.sendRedirect("products");
                return;
            }

            request.setAttribute("product", product);
            request.setAttribute("orderType", type);
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String productIdRaw = request.getParameter("productId");
        String type = request.getParameter("orderType"); // "sale" hoặc "rental"

        if (productIdRaw == null || type == null) {
            response.sendRedirect("products");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdRaw);
            Product product = productDAO.getProductById(productId);
            if (product == null) {
                response.sendRedirect("products");
                return;
            }

            // Thông tin khách hàng (không cần đăng nhập)
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String notes = request.getParameter("notes");

            int quantity = 1;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                if (quantity <= 0) quantity = 1;
            } catch (NumberFormatException ignored) { }

            Integer rentalDays = null;
            LocalDate rentalStart = null;
            LocalDate rentalEnd = null;

            if ("rental".equalsIgnoreCase(type)) {
                try {
                    String startStr = request.getParameter("rentalStartDate");
                    String endStr = request.getParameter("rentalEndDate");
                    if (startStr != null && !startStr.isEmpty()) {
                        rentalStart = LocalDate.parse(startStr);
                    }
                    if (endStr != null && !endStr.isEmpty()) {
                        rentalEnd = LocalDate.parse(endStr);
                    }
                    if (rentalStart != null && rentalEnd != null && !rentalEnd.isBefore(rentalStart)) {
                        rentalDays = (int) (rentalEnd.toEpochDay() - rentalStart.toEpochDay()) + 1;
                    } else {
                        rentalDays = 1;
                    }
                } catch (Exception e) {
                    rentalDays = 1;
                }
            }

            // Tính tổng tiền
            BigDecimal unitPrice;
            if ("sale".equalsIgnoreCase(type)) {
                unitPrice = product.getSalePrice() != null && product.getSalePrice().compareTo(BigDecimal.ZERO) > 0
                        ? product.getSalePrice()
                        : product.getPrice();
            } else { // rental
                unitPrice = product.getRentalPrice() != null && product.getRentalPrice().compareTo(BigDecimal.ZERO) > 0
                        ? product.getRentalPrice()
                        : product.getPrice();
            }
            if (unitPrice == null) {
                unitPrice = BigDecimal.ZERO;
            }

            BigDecimal total;
            if ("sale".equalsIgnoreCase(type)) {
                total = unitPrice.multiply(BigDecimal.valueOf(quantity));
            } else {
                int days = rentalDays != null ? rentalDays : 1;
                total = unitPrice
                        .multiply(BigDecimal.valueOf(quantity))
                        .multiply(BigDecimal.valueOf(days));
            }

            // Tạo đối tượng Order
            Order order = new Order();
            order.setCustomerName(name);
            order.setCustomerEmail(email);
            order.setCustomerPhone(phone);
            order.setCustomerAddress(address);
            order.setOrderType(type);
            order.setTotalAmount(total);
            order.setStatus("pending");
            order.setNotes(notes);

            if ("rental".equalsIgnoreCase(type)) {
                if (rentalStart != null) {
                    order.setRentalStartDate(OrderDAO.toStartOfDay(rentalStart));
                }
                if (rentalEnd != null) {
                    order.setRentalEndDate(OrderDAO.toEndOfDay(rentalEnd));
                }
            }

            // Lưu đơn hàng & chi tiết
            int orderId = orderDAO.createOrder(order);
            if (orderId > 0) {
                orderDAO.addOrderItem(orderId, productId, quantity, unitPrice, rentalDays);
                // Chưa giảm stock ngay, sẽ giảm sau khi thanh toán thành công
                // orderDAO.decreaseProductStock(productId, quantity);

                // Truyền dữ liệu sang trang thanh toán QR
                request.setAttribute("order", order);
                request.setAttribute("product", product);
                request.setAttribute("orderId", orderId);
                request.setAttribute("quantity", quantity);
                request.setAttribute("rentalDays", rentalDays);

                request.getRequestDispatcher("/payment-qr.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Không thể tạo đơn hàng. Vui lòng thử lại.");
                request.setAttribute("product", product);
                request.setAttribute("orderType", type);
                request.getRequestDispatcher("/order.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        }
    }
}


