package model;

/**
 * Lớp Category - Model đại diện cho danh mục sản phẩm
 * 
 * Mục đích:
 * - Phân loại sản phẩm theo danh mục (ví dụ: Đồ điện tử, Dụng cụ, Đồ nội thất)
 * - Chuyển dữ liệu giữa các lớp (DAO, Controller, JSP)
 * 
 * Các trường dữ liệu:
 * - id: ID duy nhất của danh mục
 * - name: Tên danh mục
 * - description: Mô tả danh mục
 * - status: Trạng thái (true=active, false=inactive)
 * 
 * Cách sử dụng:
 * - Tạo đối tượng: Category category = new Category();
 * - Set/get các thuộc tính: category.setName("Đồ điện tử");
 */
public class Category {
    
    private int id;
    private String name;
    private String description;
    private String imageUrl;
    private boolean status;
    
    public Category() {
    }
    
    public Category(int id, String name, String description, String imageUrl, boolean status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.imageUrl = imageUrl;
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
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public boolean isStatus() {
        return status;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}

