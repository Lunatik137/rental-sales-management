-- Database Schema cho hệ thống Bán và Thuê Đồ
-- Database: RentalSalesManagement

-- Bảng Admins: Quản trị viên
CREATE TABLE Admins (
    id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100),
    status BIT DEFAULT 1,  -- 1 = active, 0 = inactive
    created_at DATETIME DEFAULT GETDATE()
);

-- Bảng Categories: Danh mục sản phẩm
CREATE TABLE Categories (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(500),
    image_url NVARCHAR(500),  -- URL ảnh danh mục
    status BIT DEFAULT 1,  -- 1 = active, 0 = inactive
    created_at DATETIME DEFAULT GETDATE()
);

-- Bảng Products: Sản phẩm
CREATE TABLE Products (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(200) NOT NULL,
    description NVARCHAR(MAX),
    price DECIMAL(18,2),  -- Giá chung
    rental_price DECIMAL(18,2),  -- Giá thuê/ngày
    sale_price DECIMAL(18,2),  -- Giá bán
    type NVARCHAR(20) NOT NULL,  -- 'sale', 'rental', 'both'
    category_id INT,
    image_url NVARCHAR(500),
    stock INT DEFAULT 0,  -- Số lượng tồn kho
    status BIT DEFAULT 1,  -- 1 = active, 0 = inactive
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

-- Bảng Customers: Khách hàng
CREATE TABLE Customers (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100),
    phone NVARCHAR(20),
    address NVARCHAR(500),
    status BIT DEFAULT 1,  -- 1 = active, 0 = inactive
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    -- Thông tin khách hàng lưu trực tiếp trong đơn (không cần bảng Customers, không cần đăng nhập)
    customer_name NVARCHAR(100) NOT NULL,
    customer_email NVARCHAR(100),
    customer_phone NVARCHAR(20),
    customer_address NVARCHAR(500),
    order_type NVARCHAR(20) NOT NULL,  -- 'sale' hoặc 'rental'
    total_amount DECIMAL(18,2) NOT NULL,
    status NVARCHAR(20) DEFAULT 'pending',  -- 'pending', 'confirmed', 'completed', 'cancelled'
    order_date DATETIME DEFAULT GETDATE(),
    delivery_date DATETIME,  -- Cho đơn bán
    rental_start_date DATETIME,  -- Cho đơn thuê
    rental_end_date DATETIME,  -- Cho đơn thuê
    notes NVARCHAR(MAX)
);

-- Bảng OrderItems: Chi tiết đơn hàng
CREATE TABLE OrderItems (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(18,2) NOT NULL,  -- Giá tại thời điểm đặt hàng
    rental_days INT,  -- Số ngày thuê (nếu là đơn thuê)
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Insert dữ liệu mẫu
-- Admin mặc định (username: admin, password: admin123)
INSERT INTO Admins (username, password, name, email, status) 
VALUES ('admin', 'admin123', 'Administrator', 'admin@example.com', 1);

-- Danh mục mẫu
INSERT INTO Categories (name, description, image_url, status) VALUES
('Đồ điện tử', 'Các thiết bị điện tử', 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400', 1),
('Dụng cụ', 'Các dụng cụ cầm tay', 'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=400', 1),
('Đồ nội thất', 'Bàn ghế, tủ kệ', 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400', 1),
('Thiết bị gia đình', 'Máy móc gia đình', 'https://images.unsplash.com/photo-1556911220-bff31c812dba?w=400', 1);

-- Sản phẩm mẫu
INSERT INTO Products (name, description, price, rental_price, sale_price, type, category_id, stock, status) VALUES
('Máy khoan điện', 'Máy khoan điện đa năng', 500000, 50000, 500000, 'both', 2, 10, 1),
('Tủ lạnh', 'Tủ lạnh 200L', 5000000, 200000, 5000000, 'both', 4, 5, 1),
('Bàn làm việc', 'Bàn làm việc gỗ', 2000000, 100000, 2000000, 'both', 3, 8, 1);

