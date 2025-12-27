package DAO;

import dal.DBContext;
import model.Order;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Lớp OrderDAO - Data Access Object cho bảng Orders và OrderItems
 *
 * Mục đích:
 * - Tạo đơn hàng mới (bán hoặc thuê)
 * - Thêm chi tiết đơn hàng (OrderItems)
 * - Cập nhật tồn kho sản phẩm
 */
public class OrderDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(OrderDAO.class.getName());

    /**
     * Tạo đơn hàng mới và trả về ID của đơn hàng
     *
     * @param order Đối tượng Order chứa thông tin đơn hàng
     * @return int - ID của đơn hàng vừa tạo, 0 nếu thất bại
     */
    public int createOrder(Order order) {
        String sql = "INSERT INTO Orders (customer_name, customer_email, customer_phone, customer_address, "
                + "order_type, total_amount, status, order_date, delivery_date, rental_start_date, rental_end_date, notes) "
                + "OUTPUT INSERTED.id VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, order.getCustomerName());
            stmt.setString(2, order.getCustomerEmail());
            stmt.setString(3, order.getCustomerPhone());
            stmt.setString(4, order.getCustomerAddress());
            stmt.setString(5, order.getOrderType());
            stmt.setBigDecimal(6, order.getTotalAmount());
            stmt.setString(7, order.getStatus());
            stmt.setTimestamp(8, order.getOrderDate() != null ? order.getOrderDate()
                    : Timestamp.valueOf(LocalDateTime.now()));
            stmt.setTimestamp(9, order.getDeliveryDate());
            stmt.setTimestamp(10, order.getRentalStartDate());
            stmt.setTimestamp(11, order.getRentalEndDate());
            stmt.setString(12, order.getNotes());

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error creating order: {0}", e.getMessage());
        }
        return 0;
    }

    /**
     * Thêm 1 dòng chi tiết đơn hàng vào OrderItems
     *
     * @param orderId ID đơn hàng
     * @param productId ID sản phẩm
     * @param quantity Số lượng
     * @param price Giá tại thời điểm đặt
     * @param rentalDays Số ngày thuê (null nếu đơn bán)
     */
    public void addOrderItem(int orderId, int productId, int quantity,
                             BigDecimal price, Integer rentalDays) {
        String sql = "INSERT INTO OrderItems (order_id, product_id, quantity, price, rental_days) "
                + "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.setBigDecimal(4, price);
            if (rentalDays == null) {
                stmt.setNull(5, java.sql.Types.INTEGER);
            } else {
                stmt.setInt(5, rentalDays);
            }
            stmt.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding order item: {0}", e.getMessage());
        }
    }

    /**
     * Giảm tồn kho cho sản phẩm sau khi đặt hàng
     *
     * @param productId ID sản phẩm
     * @param quantity Số lượng trừ
     */
    public void decreaseProductStock(int productId, int quantity) {
        String sql = "UPDATE Products SET stock = stock - ? WHERE id = ? AND stock >= ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, quantity);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error decreasing product stock: {0}", e.getMessage());
        }
    }

    /**
     * Helper: Chuyển LocalDate thành Timestamp (cuối ngày)
     */
    public static Timestamp toEndOfDay(LocalDate date) {
        if (date == null) {
            return null;
        }
        LocalDateTime endOfDay = date.atTime(23, 59, 59);
        return Timestamp.valueOf(endOfDay);
    }

    /**
     * Helper: Chuyển LocalDate thành Timestamp (đầu ngày)
     */
    public static Timestamp toStartOfDay(LocalDate date) {
        if (date == null) {
            return null;
        }
        LocalDateTime startOfDay = date.atStartOfDay();
        return Timestamp.valueOf(startOfDay);
    }
}


