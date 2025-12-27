/*
 * Lớp DBContext - Quản lý kết nối đến cơ sở dữ liệu SQL Server
 * 
 * Mục đích: 
 * - Cung cấp kết nối database cho tất cả các lớp DAO (Data Access Object)
 * - Quản lý thông tin kết nối database tập trung tại một nơi
 * 
 * Cách sử dụng:
 * - Các lớp DAO sẽ kế thừa từ DBContext để có thể sử dụng biến connection
 * - Ví dụ: public class ProductDAO extends DBContext { ... }
 * 
 * Lưu ý:
 * - Thông tin kết nối: SQL Server localhost, port 1433
 * - Database name: RentalSalesManagement
 * - Username: sa, Password: 123 (nên chuyển sang cấu hình bảo mật hơn)
 * - Sử dụng JDBC driver: com.microsoft.sqlserver.jdbc.SQLServerDriver
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    /**
     * Đối tượng Connection để thực hiện các thao tác với database
     * Các lớp con (DAO) có thể truy cập biến này để thực thi SQL queries
     */
    protected Connection connection;

    /**
     * Lấy đối tượng Connection hiện tại
     * 
     * @return Connection - đối tượng kết nối database, null nếu chưa kết nối thành công
     */
    public Connection getConnection() {
        return connection;
    }

    /**
     * Constructor - Khởi tạo kết nối đến database khi tạo đối tượng DBContext
     * 
     * Quy trình:
     * 1. Nạp driver SQL Server JDBC
     * 2. Tạo connection string với thông tin server, port, database name
     * 3. Kết nối đến database với username và password
     * 4. Nếu có lỗi (ClassNotFoundException hoặc SQLException), ghi log và connection = null
     * 
     * Lưu ý: Nếu kết nối thất bại, connection sẽ là null và các DAO sẽ gặp lỗi khi sử dụng
     */
    public DBContext() {
        try {
            // Thông tin đăng nhập database
            String user = "sa";  // Username để đăng nhập SQL Server
            String pass = "123"; // Password để đăng nhập SQL Server

            // Connection string: jdbc:sqlserver://[server]:[port];databaseName=[database]
            // localhost:1433 là địa chỉ SQL Server mặc định
            // RentalSalesManagement là tên database
            String url = "jdbc:sqlserver://localhost:1433;databaseName=RentalSalesManagement";
            
            // Nạp driver JDBC cho SQL Server (cần có file sqljdbc42.jar trong classpath)
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            // Tạo kết nối đến database
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            // Ghi log lỗi nếu không tìm thấy driver hoặc không kết nối được database
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

