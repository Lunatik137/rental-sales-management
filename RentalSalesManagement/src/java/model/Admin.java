package model;

/**
 * Lớp Admin - Model đại diện cho quản trị viên trong hệ thống
 * 
 * Mục đích:
 * - Lưu trữ thông tin quản trị viên để đăng nhập và quản lý hệ thống
 * - Chuyển dữ liệu giữa các lớp (DAO, Controller, JSP)
 * 
 * Các trường dữ liệu:
 * - id: ID duy nhất của admin
 * - username: Tên đăng nhập (unique)
 * - password: Mật khẩu (nên được hash trước khi lưu)
 * - name: Tên admin
 * - email: Email
 * - status: Trạng thái (true=active, false=inactive)
 * 
 * Cách sử dụng:
 * - Tạo đối tượng: Admin admin = new Admin();
 * - Set/get các thuộc tính: admin.setUsername("admin");
 */
public class Admin {
    
    private int id;
    private String username;
    private String password;
    private String name;
    private String email;
    private boolean status;
    
    public Admin() {
    }
    
    public Admin(int id, String username, String password, String name, String email, boolean status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.status = status;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
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
    
    public boolean isStatus() {
        return status;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
}

