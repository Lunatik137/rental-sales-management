package controller;

import DAO.ProductDAO;
import DAO.CategoryDAO;
import model.Product;
import model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Lớp HomeServlet - Servlet xử lý trang chủ
 * 
 * Mục đích:
 * - Hiển thị trang chủ với sản phẩm nổi bật
 * - Lấy danh sách sản phẩm và danh mục để hiển thị
 */
public class HomeServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;
    
    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy danh sách sản phẩm nổi bật (có thể lấy 8-12 sản phẩm đầu tiên)
        List<Product> featuredProducts = productDAO.getAllProducts();
        // Giới hạn số lượng sản phẩm hiển thị trên trang chủ
        if (featuredProducts.size() > 8) {
            featuredProducts = featuredProducts.subList(0, 8);
        }
        
        // Lấy danh sách danh mục để hiển thị
        List<Category> categories = categoryDAO.getAllCategories();
        
        // Set attributes để JSP có thể sử dụng
        request.setAttribute("featuredProducts", featuredProducts);
        request.setAttribute("categories", categories);
        
        // Forward đến trang home.jsp
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}

