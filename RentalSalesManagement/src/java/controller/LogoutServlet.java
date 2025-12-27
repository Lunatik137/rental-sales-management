package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Lớp LogoutServlet - Servlet xử lý đăng xuất
 * 
 * Mục đích:
 * - Xóa session của admin
 * - Chuyển hướng về trang đăng nhập
 */
public class LogoutServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Xóa session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        // Chuyển hướng về trang đăng nhập
        response.sendRedirect("login");
    }
}

