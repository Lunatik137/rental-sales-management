package model;

import java.math.BigDecimal;

/**
 * Lớp OrderItem - Chi tiết từng sản phẩm trong đơn hàng
 *
 * Mục đích:
 * - Lưu thông tin sản phẩm, số lượng, giá tại thời điểm đặt hàng
 * - Hỗ trợ cả đơn bán và đơn thuê (rentalDays)
 */
public class OrderItem {

    private int id;
    private int orderId;
    private int productId;
    private int quantity;
    private BigDecimal price; // Giá tại thời điểm đặt hàng
    private Integer rentalDays; // Số ngày thuê (nếu là đơn thuê)

    public OrderItem() {
    }

    public OrderItem(int id, int orderId, int productId, int quantity,
                     BigDecimal price, Integer rentalDays) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.rentalDays = rentalDays;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getRentalDays() {
        return rentalDays;
    }

    public void setRentalDays(Integer rentalDays) {
        this.rentalDays = rentalDays;
    }
}


