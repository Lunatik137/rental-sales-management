package model;

import java.math.BigDecimal;

/**
 * Lớp Product - Model đại diện cho sản phẩm trong hệ thống
 * 
 * Mục đích:
 * - Lưu trữ thông tin sản phẩm: tên, mô tả, giá, loại (bán/thuê), hình ảnh
 * - Chuyển dữ liệu giữa các lớp (DAO, Controller, JSP)
 * 
 * Các trường dữ liệu:
 * - id: ID duy nhất của sản phẩm
 * - name: Tên sản phẩm
 * - description: Mô tả chi tiết sản phẩm
 * - price: Giá bán hoặc giá thuê/ngày
 * - rentalPrice: Giá thuê (nếu là sản phẩm cho thuê)
 * - salePrice: Giá bán (nếu là sản phẩm bán)
 * - type: Loại sản phẩm ("sale" = bán, "rental" = thuê, "both" = cả hai)
 * - categoryId: ID danh mục sản phẩm
 * - imageUrl: URL hình ảnh sản phẩm
 * - stock: Số lượng tồn kho
 * - status: Trạng thái (true=active, false=inactive)
 * - createdAt: Thời gian tạo
 * 
 * Cách sử dụng:
 * - Tạo đối tượng: Product product = new Product();
 * - Set/get các thuộc tính: product.setName("Máy khoan điện");
 */
public class Product {
    
    private int id;
    private String name;
    private String description;
    private BigDecimal price;
    private BigDecimal rentalPrice;  // Giá thuê/ngày
    private BigDecimal salePrice;     // Giá bán
    private String type;             // "sale", "rental", "both"
    private int categoryId;
    private String imageUrl;
    private int stock;
    private boolean status;
    private String createdAt;
    private Category category;        // Đối tượng Category để hiển thị tên danh mục
    
    public Product() {
    }
    
    public Product(int id, String name, String description, BigDecimal price, 
                   BigDecimal rentalPrice, BigDecimal salePrice, String type, 
                   int categoryId, String imageUrl, int stock, boolean status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.rentalPrice = rentalPrice;
        this.salePrice = salePrice;
        this.type = type;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
        this.stock = stock;
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
    
    public BigDecimal getPrice() {
        return price;
    }
    
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public BigDecimal getRentalPrice() {
        return rentalPrice;
    }
    
    public void setRentalPrice(BigDecimal rentalPrice) {
        this.rentalPrice = rentalPrice;
    }
    
    public BigDecimal getSalePrice() {
        return salePrice;
    }
    
    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public int getCategoryId() {
        return categoryId;
    }
    
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    public int getStock() {
        return stock;
    }
    
    public void setStock(int stock) {
        this.stock = stock;
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
    
    public Category getCategory() {
        return category;
    }
    
    public void setCategory(Category category) {
        this.category = category;
    }
}

