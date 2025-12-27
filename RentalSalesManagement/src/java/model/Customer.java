package model;

/**
 * Lớp Customer - Model đại diện cho khách hàng trong hệ thống
 * 
 * Mục đích:
 * - Lưu trữ thông tin khách hàng
 * - Chuyển dữ liệu giữa các lớp (DAO, Controller, JSP)
 * 
 * Các trường dữ liệu:
 * - id: ID duy nhất của khách hàng
 * - name: Tên khách hàng
 * - email: Email
 * - phone: Số điện thoại
 * - address: Địa chỉ
 * - status: Trạng thái (true=active, false=inactive)
 * - createdAt: Thời gian tạo
 * 
 * Cách sử dụng:
 * - Tạo đối tượng: Customer customer = new Customer();
 */
public class Customer {
    
    private int id;
    private String name;
    private String email;
    private String phone;
    private String address;
    private boolean status;
    private String createdAt;
    
    public Customer() {
    }
    
    public Customer(int id, String name, String email, String phone, String address, boolean status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.status = status;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public boolean isStatus() {
        return status;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public String getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}

