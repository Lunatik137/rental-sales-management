package controller;

import DAO.AdminDAO;
import model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Lớp LoginServlet - Servlet xử lý đăng nhập admin
 * 
 * Mục đích:
 * - Xử lý yêu cầu đăng nhập từ admin (GET và POST)
 * - Xác thực thông tin đăng nhập (username, password)
 * - Kiểm tra trạng thái tài khoản admin
 * - Chuyển hướng admin đến trang dashboard
 * 
 * Cách sử dụng:
 * - URL: /login hoặc /loginServlet (tùy cấu hình web.xml)
 * - GET: Hiển thị trang đăng nhập
 * - POST: Xử lý form đăng nhập
 * 
 * Tham số request:
 * - username: Tên đăng nhập
 * - password: Mật khẩu
 */
public class LoginServlet extends HttpServlet {

    private AdminDAO adminDAO;

    /**
     * Khởi tạo servlet - tạo đối tượng AdminDAO để sử dụng
     */
    @Override
    public void init() throws ServletException {
        adminDAO = new AdminDAO();
    }

    /**
     * Xử lý yêu cầu GET - Hiển thị trang đăng nhập
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    /**
     * Xử lý yêu cầu POST - Xác thực đăng nhập và chuyển hướng
     * 
     * Quy trình:
     * 1. Lấy username và password từ form
     * 2. Kiểm tra không được để trống
     * 3. Xác thực với database qua AdminDAO
     * 4. Kiểm tra trạng thái tài khoản (có bị khóa không)
     * 5. Lưu thông tin admin vào session
     * 6. Chuyển hướng đến trang dashboard
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Kiểm tra nếu để trống tên đăng nhập hoặc mật khẩu
            if (username == null || username.trim().isEmpty() || 
                password == null || password.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.");
                request.setAttribute("username", username);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            // Xác thực đăng nhập bằng DAO
            Admin admin = adminDAO.authenticate(username, password);
            if (admin == null) {
                request.setAttribute("errorMessage", "Đăng nhập không hợp lệ. Vui lòng kiểm tra lại tên đăng nhập và mật khẩu.");
                request.setAttribute("username", username);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
            
            // Kiểm tra trạng thái tài khoản (bị khóa hay không)
            if (!admin.isStatus()) {
                request.setAttribute("errorMessage", "Tài khoản của bạn đã bị khóa. Vui lòng liên hệ quản trị viên!");
                request.setAttribute("username", username);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            // Lưu thông tin admin vào phiên làm việc
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            session.setAttribute("username", admin.getUsername());

            // Chuyển hướng đến trang dashboard
            response.sendRedirect("dashboard");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Không thể kết nối. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}

