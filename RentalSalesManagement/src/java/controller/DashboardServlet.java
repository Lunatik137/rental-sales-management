package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Lớp DashboardServlet - Servlet hiển thị trang dashboard admin
 * 
 * Mục đích:
 * - Hiển thị trang tổng quan cho admin
 * - Kiểm tra đăng nhập trước khi hiển thị
 */
public class DashboardServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("login");
            return;
        }
        
        // Chuyển đến trang dashboard
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}

