package DAO;

import dal.DBContext;
import model.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Lớp AdminDAO - Data Access Object cho bảng Admins
 * 
 * Mục đích:
 * - Thực hiện các thao tác với bảng Admins trong database
 * - Xác thực đăng nhập admin
 * 
 * Cách sử dụng:
 * - Tạo đối tượng: AdminDAO adminDAO = new AdminDAO();
 * - Gọi các phương thức: Admin admin = adminDAO.authenticate(username, password);
 */
public class AdminDAO extends DBContext {
    
    private static final Logger LOGGER = Logger.getLogger(AdminDAO.class.getName());
    
    /**
     * Xác thực đăng nhập admin
     * 
     * @param username Tên đăng nhập
     * @param password Mật khẩu (plain text)
     * @return Admin - Đối tượng Admin nếu đăng nhập thành công, null nếu sai
     * 
     * Lưu ý: Nên sử dụng BCrypt để hash password và so sánh bằng BCrypt.checkpw()
     */
    public Admin authenticate(String username, String password) {
        String sql = "SELECT * FROM Admins WHERE username = ? AND status = 1";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // So sánh password (nên dùng BCrypt.checkpw() thay vì equals)
                if (password.equals(rs.getString("password"))) {
                    Admin admin = new Admin();
                    admin.setId(rs.getInt("id"));
                    admin.setUsername(rs.getString("username"));
                    admin.setPassword(rs.getString("password"));
                    admin.setName(rs.getString("name"));
                    admin.setEmail(rs.getString("email"));
                    admin.setStatus(rs.getBoolean("status"));
                    return admin;
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error authenticating admin: {0}", e.getMessage());
        }
        return null;
    }
    
    /**
     * Lấy admin theo ID
     * 
     * @param id ID của admin
     * @return Admin - Đối tượng Admin, null nếu không tìm thấy
     */
    public Admin getAdminById(int id) {
        String sql = "SELECT * FROM Admins WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setStatus(rs.getBoolean("status"));
                return admin;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting admin by ID: {0}", e.getMessage());
        }
        return null;
    }
}

