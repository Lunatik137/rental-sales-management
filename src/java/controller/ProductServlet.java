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
 * Lớp ProductServlet - Servlet xử lý trang sản phẩm
 * 
 * Mục đích:
 * - Hiển thị danh sách sản phẩm
 * - Lọc sản phẩm theo danh mục
 * - Tìm kiếm sản phẩm
 * - Hiển thị chi tiết sản phẩm
 */
public class ProductServlet extends HttpServlet {
    
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
        
        String action = request.getParameter("action");
        String idParam = request.getParameter("id");
        String categoryParam = request.getParameter("category");
        String keyword = request.getParameter("keyword");
        
        // Lấy danh sách danh mục để hiển thị filter
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        
        // Nếu có action=detail hoặc có id -> hiển thị chi tiết sản phẩm
        if ("detail".equals(action) || idParam != null) {
            int productId = Integer.parseInt(idParam != null ? idParam : request.getParameter("id"));
            Product product = productDAO.getProductById(productId);
            
            if (product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("products");
                return;
            }
        }
        
        // Lấy danh sách sản phẩm
        List<Product> products;
        
        // Nếu có keyword -> tìm kiếm
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = productDAO.searchProducts(keyword);
            request.setAttribute("keyword", keyword);
        }
        // Nếu có category -> lọc theo danh mục
        else if (categoryParam != null && !categoryParam.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryParam);
                products = productDAO.getProductsByCategory(categoryId);
                request.setAttribute("selectedCategoryId", categoryId);
            } catch (NumberFormatException e) {
                products = productDAO.getAllProducts();
            }
        }
        // Mặc định: lấy tất cả sản phẩm
        else {
            products = productDAO.getAllProducts();
        }
        
        request.setAttribute("products", products);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}

