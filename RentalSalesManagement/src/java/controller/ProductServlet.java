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
        
        // Set encoding để tránh lỗi encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
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
                // Lấy sản phẩm tương tự cùng category
                List<Product> similarProducts = productDAO.getSimilarProducts(
                    product.getCategoryId(), 
                    productId, 
                    4
                );
                
                request.setAttribute("product", product);
                request.setAttribute("similarProducts", similarProducts);
                request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("products");
                return;
            }
        }
        
        // Phân trang
        int page = 1;
        int pageSize = 12; // Số sản phẩm mỗi trang
        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
                if (page < 1) page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        
        // Lấy danh sách sản phẩm
        List<Product> products;
        int totalProducts = 0;
        int totalPages = 0;
        
        // Nếu có keyword -> tìm kiếm (không phân trang cho search)
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = productDAO.searchProducts(keyword);
            totalProducts = products.size();
            totalPages = (int) Math.ceil((double) totalProducts / pageSize);
            request.setAttribute("keyword", keyword);
        }
        // Nếu có category -> lọc theo danh mục
        else if (categoryParam != null && !categoryParam.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryParam);
                products = productDAO.getProductsByCategoryWithPagination(categoryId, page, pageSize);
                totalProducts = productDAO.getTotalProductsByCategory(categoryId);
                totalPages = (int) Math.ceil((double) totalProducts / pageSize);
                request.setAttribute("selectedCategoryId", categoryId);
            } catch (NumberFormatException e) {
                products = productDAO.getAllProductsWithPagination(page, pageSize);
                totalProducts = productDAO.getTotalProducts();
                totalPages = (int) Math.ceil((double) totalProducts / pageSize);
            }
        }
        // Mặc định: lấy tất cả sản phẩm
        else {
            products = productDAO.getAllProductsWithPagination(page, pageSize);
            totalProducts = productDAO.getTotalProducts();
            totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        }
        
        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalProducts);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}

