package DAO;

import dal.DBContext;
import model.Product;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Lớp ProductDAO - Data Access Object cho bảng Products
 * 
 * Mục đích:
 * - Thực hiện tất cả các thao tác CRUD với bảng Products trong database
 * - Quản lý sản phẩm: thêm, sửa, xóa, lấy danh sách, tìm kiếm
 * 
 * Cách sử dụng:
 * - Tạo đối tượng: ProductDAO productDAO = new ProductDAO();
 * - Gọi các phương thức: List<Product> products = productDAO.getAllProducts();
 * 
 * Lưu ý:
 * - Kế thừa từ DBContext để có connection đến database
 * - Sử dụng PreparedStatement để tránh SQL Injection
 */
public class ProductDAO extends DBContext {
    
    private static final Logger LOGGER = Logger.getLogger(ProductDAO.class.getName());
    
    /**
     * Lấy danh sách tất cả sản phẩm
     * 
     * @return List<Product> - Danh sách tất cả sản phẩm
     */
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name AS category_name FROM Products p "
                   + "LEFT JOIN Categories c ON p.category_id = c.id "
                   + "ORDER BY p.id DESC";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = mapResultSetToProduct(rs);
                products.add(product);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all products: {0}", e.getMessage());
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm theo ID
     * 
     * @param id ID của sản phẩm
     * @return Product - Đối tượng Product, null nếu không tìm thấy
     */
    public Product getProductById(int id) {
        String sql = "SELECT p.*, c.name AS category_name FROM Products p "
                   + "LEFT JOIN Categories c ON p.category_id = c.id "
                   + "WHERE p.id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToProduct(rs);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting product by ID: {0}", e.getMessage());
        }
        return null;
    }
    
    /**
     * Thêm sản phẩm mới
     * 
     * @param product Đối tượng Product chứa thông tin sản phẩm
     * @return boolean - true nếu thêm thành công, false nếu thất bại
     */
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO Products (name, description, price, rental_price, sale_price, "
                   + "type, category_id, image_url, stock, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setBigDecimal(3, product.getPrice());
            stmt.setBigDecimal(4, product.getRentalPrice());
            stmt.setBigDecimal(5, product.getSalePrice());
            stmt.setString(6, product.getType());
            stmt.setInt(7, product.getCategoryId());
            stmt.setString(8, product.getImageUrl());
            stmt.setInt(9, product.getStock());
            stmt.setBoolean(10, product.isStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding product: {0}", e.getMessage());
        }
        return false;
    }
    
    /**
     * Cập nhật thông tin sản phẩm
     * 
     * @param product Đối tượng Product chứa thông tin mới
     * @return boolean - true nếu cập nhật thành công, false nếu thất bại
     */
    public boolean updateProduct(Product product) {
        String sql = "UPDATE Products SET name = ?, description = ?, price = ?, "
                   + "rental_price = ?, sale_price = ?, type = ?, category_id = ?, "
                   + "image_url = ?, stock = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setBigDecimal(3, product.getPrice());
            stmt.setBigDecimal(4, product.getRentalPrice());
            stmt.setBigDecimal(5, product.getSalePrice());
            stmt.setString(6, product.getType());
            stmt.setInt(7, product.getCategoryId());
            stmt.setString(8, product.getImageUrl());
            stmt.setInt(9, product.getStock());
            stmt.setBoolean(10, product.isStatus());
            stmt.setInt(11, product.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating product: {0}", e.getMessage());
        }
        return false;
    }
    
    /**
     * Xóa sản phẩm
     * 
     * @param id ID của sản phẩm cần xóa
     * @return boolean - true nếu xóa thành công, false nếu thất bại
     */
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM Products WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting product: {0}", e.getMessage());
        }
        return false;
    }
    
    /**
     * Tìm kiếm sản phẩm theo tên
     * 
     * @param keyword Từ khóa tìm kiếm
     * @return List<Product> - Danh sách sản phẩm tìm được
     */
    public List<Product> searchProducts(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name AS category_name FROM Products p "
                   + "LEFT JOIN Categories c ON p.category_id = c.id "
                   + "WHERE p.name LIKE ? OR p.description LIKE ? "
                   + "ORDER BY p.id DESC";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            String searchPattern = "%" + keyword + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error searching products: {0}", e.getMessage());
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm theo danh mục
     * 
     * @param categoryId ID của danh mục
     * @return List<Product> - Danh sách sản phẩm thuộc danh mục đó
     */
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name AS category_name FROM Products p "
                   + "LEFT JOIN Categories c ON p.category_id = c.id "
                   + "WHERE p.category_id = ? ORDER BY p.id DESC";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting products by category: {0}", e.getMessage());
        }
        return products;
    }
    
    /**
     * Chuyển đổi ResultSet thành đối tượng Product
     * 
     * @param rs ResultSet từ database
     * @return Product - Đối tượng Product
     * @throws SQLException Nếu có lỗi khi đọc dữ liệu
     */
    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setDescription(rs.getString("description"));
        product.setPrice(rs.getBigDecimal("price"));
        product.setRentalPrice(rs.getBigDecimal("rental_price"));
        product.setSalePrice(rs.getBigDecimal("sale_price"));
        product.setType(rs.getString("type"));
        product.setCategoryId(rs.getInt("category_id"));
        product.setImageUrl(rs.getString("image_url"));
        product.setStock(rs.getInt("stock"));
        product.setStatus(rs.getBoolean("status"));
        product.setCreatedAt(rs.getString("created_at"));
        
        // Set category name if available
        if (rs.getString("category_name") != null) {
            model.Category category = new model.Category();
            category.setName(rs.getString("category_name"));
            product.setCategory(category);
        }
        
        return product;
    }
}

