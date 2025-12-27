# Hệ thống Quản lý Bán và Thuê Đồ

Dự án website quản lý bán và thuê đồ với chức năng admin để quản lý hệ thống.

## Cấu trúc dự án

```
rental-sales-management/
├── src/
│   └── java/
│       ├── controller/     # Các servlet xử lý request
│       ├── DAO/            # Data Access Object - truy cập database
│       ├── dal/            # Database connection
│       └── model/          # Các model classes
├── web/                    # Các file JSP và tài nguyên web
│   ├── admin/              # Trang admin
│   ├── login.jsp           # Trang đăng nhập
│   └── WEB-INF/
│       └── web.xml         # Cấu hình servlet
└── Database/
    └── schema.sql         # Script tạo database
```

## Các chức năng chính

### 1. Đăng nhập Admin
- Đăng nhập với username/password
- Kiểm tra trạng thái tài khoản
- Lưu session sau khi đăng nhập

### 2. Quản lý Sản phẩm
- Xem danh sách sản phẩm
- Thêm sản phẩm mới
- Sửa thông tin sản phẩm
- Xóa sản phẩm
- Tìm kiếm sản phẩm
- Hỗ trợ sản phẩm bán, thuê, hoặc cả hai

### 3. Quản lý Danh mục
- Xem danh sách danh mục
- Thêm danh mục mới
- Sửa danh mục
- Xóa danh mục

### 4. Dashboard
- Hiển thị thống kê tổng quan
- Menu quản lý các chức năng

## Cài đặt và chạy

### 1. Tạo Database
- Chạy script `Database/schema.sql` trong SQL Server để tạo database và các bảng

### 2. Cấu hình Database
- Sửa thông tin kết nối trong `src/java/dal/DBContext.java`:
  - Server: localhost:1433
  - Database: RentalSalesManagement
  - Username: sa
  - Password: 123

### 3. Deploy project
- Import project vào NetBeans hoặc IDE tương tự
- Thêm các file JAR cần thiết vào classpath (sqljdbc42.jar, servlet-api.jar, jsp-api.jar)
- Deploy lên Tomcat hoặc server tương tự

### 4. Truy cập
- URL: http://localhost:8080/rental-sales-management/login
- Username mặc định: admin
- Password mặc định: admin123

## Công nghệ sử dụng

- **Backend**: Java Servlet, JSP
- **Database**: SQL Server
- **Frontend**: HTML, CSS, JavaScript
- **Server**: Apache Tomcat

## Lưu ý

- Mật khẩu hiện tại lưu dạng plain text, nên sử dụng BCrypt để hash password
- Cần thêm validation cho các form input
- Cần thêm xử lý upload ảnh cho sản phẩm
- Cần thêm chức năng quản lý đơn hàng và khách hàng

