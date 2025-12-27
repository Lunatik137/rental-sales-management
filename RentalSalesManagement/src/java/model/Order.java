package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * Lớp Order - Model đại diện cho đơn hàng trong hệ thống
 * 
 * Mục đích:
 * - Lưu trữ thông tin đơn hàng: bán hoặc thuê
 * - Chuyển dữ liệu giữa các lớp (DAO, Controller, JSP)
 * 
 * Các trường dữ liệu:
 * - id: ID duy nhất của đơn hàng
 * - customerName, customerEmail, customerPhone, customerAddress: thông tin khách hàng (không cần đăng nhập)
 * - orderType: Loại đơn hàng ("sale" = bán, "rental" = thuê)
 * - totalAmount: Tổng tiền
 * - status: Trạng thái đơn hàng ("pending", "confirmed", "completed", "cancelled")
 * - orderDate: Ngày đặt hàng
 * - deliveryDate: Ngày giao hàng (cho đơn bán)
 * - rentalStartDate: Ngày bắt đầu thuê (cho đơn thuê)
 * - rentalEndDate: Ngày kết thúc thuê (cho đơn thuê)
 * - notes: Ghi chú
 * 
 * Cách sử dụng:
 * - Tạo đối tượng: Order order = new Order();
 */
public class Order {
    
    private int id;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private String customerAddress;
    private String orderType;        // "sale" hoặc "rental"
    private BigDecimal totalAmount;
    private String status;            // "pending", "confirmed", "completed", "cancelled"
    private Timestamp orderDate;
    private Timestamp deliveryDate;
    private Timestamp rentalStartDate;
    private Timestamp rentalEndDate;
    private String notes;
    
    public Order() {
    }
    
    public Order(int id, String customerName, String customerEmail, String customerPhone,
                 String customerAddress, String orderType, BigDecimal totalAmount, 
                 String status, Timestamp orderDate) {
        this.id = id;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.orderType = orderType;
        this.totalAmount = totalAmount;
        this.status = status;
        this.orderDate = orderDate;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
    
    public String getOrderType() {
        return orderType;
    }
    
    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }
    
    public BigDecimal getTotalAmount() {
        return totalAmount;
    }
    
    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Timestamp getOrderDate() {
        return orderDate;
    }
    
    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
    
    public Timestamp getDeliveryDate() {
        return deliveryDate;
    }
    
    public void setDeliveryDate(Timestamp deliveryDate) {
        this.deliveryDate = deliveryDate;
    }
    
    public Timestamp getRentalStartDate() {
        return rentalStartDate;
    }
    
    public void setRentalStartDate(Timestamp rentalStartDate) {
        this.rentalStartDate = rentalStartDate;
    }
    
    public Timestamp getRentalEndDate() {
        return rentalEndDate;
    }
    
    public void setRentalEndDate(Timestamp rentalEndDate) {
        this.rentalEndDate = rentalEndDate;
    }
    
    public String getNotes() {
        return notes;
    }
    
    public void setNotes(String notes) {
        this.notes = notes;
    }
}


