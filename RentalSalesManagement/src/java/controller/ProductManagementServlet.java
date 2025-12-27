package controller;

import DAO.ProductDAO;
import DAO.CategoryDAO;
import model.Product;
import model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

/**
 * Lớp ProductManagementServlet - Servlet quản lý sản phẩm
 * 
 * Mục đích:
 * - Xử lý các thao tác CRUD với sản phẩm
 * - Hiển thị danh sách sản phẩm, form thêm/sửa sản phẩm
 * 
 * Các action:
 * - list: Hiển thị danh sách sản phẩm (mặc định)
 * - add: Hiển thị form thêm sản phẩm
 * - edit: Hiển thị form sửa sản phẩm
 * - create: Xử lý thêm sản phẩm mới
 * - update: Xử lý cập nhật sản phẩm
 * - delete: Xử lý xóa sản phẩm
 * - search: Tìm kiếm sản phẩm
 */
public class ProductManagementServlet extends HttpServlet {

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
        
        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("login");
            return;
        }
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "add":
                    showAddForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "search":
                    searchProducts(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            listProducts(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("login");
            return;
        }
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "create":
                    createProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            listProducts(request, response);
        }
    }

    /**
     * Hiển thị danh sách sản phẩm
     */
    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/admin/products/list.jsp").forward(request, response);
    }

    /**
     * Hiển thị form thêm sản phẩm
     */
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/products/add.jsp").forward(request, response);
    }

    /**
     * Hiển thị form sửa sản phẩm
     */
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.getProductById(id);
        List<Category> categories = categoryDAO.getAllCategories();
        
        request.setAttribute("product", product);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/products/edit.jsp").forward(request, response);
    }

    /**
     * Tạo sản phẩm mới
     */
    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Product product = new Product();
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(new BigDecimal(request.getParameter("price")));
        product.setRentalPrice(new BigDecimal(request.getParameter("rentalPrice")));
        product.setSalePrice(new BigDecimal(request.getParameter("salePrice")));
        product.setType(request.getParameter("type"));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        product.setImageUrl(request.getParameter("imageUrl"));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setStatus(Boolean.parseBoolean(request.getParameter("status")));

        if (productDAO.addProduct(product)) {
            response.sendRedirect("products?message=add_success");
        } else {
            request.setAttribute("errorMessage", "Không thể thêm sản phẩm. Vui lòng thử lại.");
            showAddForm(request, response);
        }
    }

    /**
     * Cập nhật sản phẩm
     */
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("id")));
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(new BigDecimal(request.getParameter("price")));
        product.setRentalPrice(new BigDecimal(request.getParameter("rentalPrice")));
        product.setSalePrice(new BigDecimal(request.getParameter("salePrice")));
        product.setType(request.getParameter("type"));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        product.setImageUrl(request.getParameter("imageUrl"));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setStatus(Boolean.parseBoolean(request.getParameter("status")));

        if (productDAO.updateProduct(product)) {
            response.sendRedirect("products?message=update_success");
        } else {
            request.setAttribute("errorMessage", "Không thể cập nhật sản phẩm. Vui lòng thử lại.");
            showEditForm(request, response);
        }
    }

    /**
     * Xóa sản phẩm
     */
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (productDAO.deleteProduct(id)) {
            response.sendRedirect("products?message=delete_success");
        } else {
            request.setAttribute("errorMessage", "Không thể xóa sản phẩm. Vui lòng thử lại.");
            listProducts(request, response);
        }
    }

    /**
     * Tìm kiếm sản phẩm
     */
    private void searchProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> products = productDAO.searchProducts(keyword);
        request.setAttribute("products", products);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/admin/products/list.jsp").forward(request, response);
    }
}

