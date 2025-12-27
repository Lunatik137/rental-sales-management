package DAO;

import dal.DBContext;
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Lớp CategoryDAO - Data Access Object cho bảng Categories
 * 
 * Mục đích:
 * - Thực hiện tất cả các thao tác CRUD với bảng Categories trong database
 * - Quản lý danh mục sản phẩm
 * 
 * Cách sử dụng:
 * - Tạo đối tượng: CategoryDAO categoryDAO = new CategoryDAO();
 * - Gọi các phương thức: List<Category> categories = categoryDAO.getAllCategories();
 */
public class CategoryDAO extends DBContext {
    
    private static final Logger LOGGER = Logger.getLogger(CategoryDAO.class.getName());
    
    /**
     * Lấy danh sách tất cả danh mục
     * 
     * @return List<Category> - Danh sách tất cả danh mục
     */
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM Categories ORDER BY name";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                categories.add(mapResultSetToCategory(rs));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all categories: {0}", e.getMessage());
        }
        return categories;
    }
    
    /**
     * Lấy danh mục theo ID
     * 
     * @param id ID của danh mục
     * @return Category - Đối tượng Category, null nếu không tìm thấy
     */
    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM Categories WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToCategory(rs);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting category by ID: {0}", e.getMessage());
        }
        return null;
    }
    
    /**
     * Thêm danh mục mới
     * 
     * @param category Đối tượng Category chứa thông tin danh mục
     * @return boolean - true nếu thêm thành công, false nếu thất bại
     */
    public boolean addCategory(Category category) {
        String sql = "INSERT INTO Categories (name, description, image_url, status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, category.getName());
            stmt.setString(2, category.getDescription());
            stmt.setString(3, category.getImageUrl());
            stmt.setBoolean(4, category.isStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding category: {0}", e.getMessage());
        }
        return false;
    }
    
    /**
     * Cập nhật thông tin danh mục
     * 
     * @param category Đối tượng Category chứa thông tin mới
     * @return boolean - true nếu cập nhật thành công, false nếu thất bại
     */
    public boolean updateCategory(Category category) {
        String sql = "UPDATE Categories SET name = ?, description = ?, image_url = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, category.getName());
            stmt.setString(2, category.getDescription());
            stmt.setString(3, category.getImageUrl());
            stmt.setBoolean(4, category.isStatus());
            stmt.setInt(5, category.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating category: {0}", e.getMessage());
        }
        return false;
    }
    
    /**
     * Xóa danh mục
     * 
     * @param id ID của danh mục cần xóa
     * @return boolean - true nếu xóa thành công, false nếu thất bại
     */
    public boolean deleteCategory(int id) {
        String sql = "DELETE FROM Categories WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting category: {0}", e.getMessage());
        }
        return false;
    }
    
    /**
     * Chuyển đổi ResultSet thành đối tượng Category
     */
    private Category mapResultSetToCategory(ResultSet rs) throws SQLException {
        Category category = new Category();
        category.setId(rs.getInt("id"));
        category.setName(rs.getString("name"));
        category.setDescription(rs.getString("description"));
        category.setImageUrl(rs.getString("image_url"));
        category.setStatus(rs.getBoolean("status"));
        return category;
    }
}

