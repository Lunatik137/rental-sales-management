-- Script SQL để thêm nhiều sản phẩm mẫu vào database
-- Chạy script này sau khi đã tạo schema

-- Đảm bảo có categories trước
IF NOT EXISTS (SELECT 1 FROM Categories WHERE id = 1)
    INSERT INTO Categories (name, description, status) VALUES 
    (N'Điện tử', N'Các sản phẩm điện tử', 1);

IF NOT EXISTS (SELECT 1 FROM Categories WHERE id = 2)
    INSERT INTO Categories (name, description, status) VALUES 
    (N'Dụng cụ', N'Dụng cụ gia đình và công nghiệp', 1);

IF NOT EXISTS (SELECT 1 FROM Categories WHERE id = 3)
    INSERT INTO Categories (name, description, status) VALUES 
    (N'Đồ nội thất', N'Nội thất và trang trí', 1);

IF NOT EXISTS (SELECT 1 FROM Categories WHERE id = 4)
    INSERT INTO Categories (name, description, status) VALUES 
    (N'Thiết bị gia đình', N'Thiết bị sử dụng trong gia đình', 1);

-- Xóa dữ liệu cũ nếu cần (tùy chọn)
-- DELETE FROM Products;

-- Thêm sản phẩm mẫu
INSERT INTO Products (name, description, price, rental_price, sale_price, type, category_id, stock, status) VALUES
-- Điện tử
(N'Máy ảnh Canon EOS', N'Máy ảnh DSLR chuyên nghiệp, 24MP, quay video 4K', 15000000, 200000, 15000000, 'both', 1, 5, 1),
(N'Laptop Dell XPS 15', N'Laptop cao cấp, Intel i7, 16GB RAM, SSD 512GB', 25000000, 500000, 25000000, 'both', 1, 3, 1),
(N'Điện thoại iPhone 15 Pro', N'iPhone mới nhất, chip A17 Pro, camera 48MP', 28000000, 600000, 28000000, 'sale', 1, 10, 1),
(N'Máy quay phim Sony', N'Máy quay 4K, ổn định hình ảnh, pin lâu', 12000000, 300000, 12000000, 'both', 1, 4, 1),
(N'Loa Bluetooth JBL', N'Loa không dây, âm thanh sống động, pin 20h', 3000000, 50000, 3000000, 'both', 1, 15, 1),
(N'Tai nghe AirPods Pro', N'Tai nghe không dây, chống ồn chủ động', 6000000, 100000, 6000000, 'sale', 1, 20, 1),
(N'Smartwatch Apple Watch', N'Đồng hồ thông minh, đo nhịp tim, GPS', 10000000, 200000, 10000000, 'both', 1, 8, 1),
(N'Máy tính bảng iPad Pro', N'iPad 12.9 inch, chip M2, hỗ trợ Apple Pencil', 22000000, 400000, 22000000, 'both', 1, 6, 1),

-- Dụng cụ
(N'Máy khoan Bosch', N'Máy khoan mạnh mẽ, pin lithium, nhiều mũi khoan', 2500000, 50000, 2500000, 'both', 2, 12, 1),
(N'Máy cắt cỏ', N'Máy cắt cỏ điện, nhẹ, dễ sử dụng', 3500000, 80000, 3500000, 'both', 2, 7, 1),
(N'Bộ dụng cụ sửa chữa', N'Bộ 50 món dụng cụ đa năng, hộp đựng chắc chắn', 1500000, 30000, 1500000, 'both', 2, 25, 1),
(N'Máy hút bụi công nghiệp', N'Máy hút bụi mạnh, dung tích lớn, lọc HEPA', 5000000, 100000, 5000000, 'both', 2, 5, 1),
(N'Máy phát điện', N'Máy phát điện 5KW, chạy xăng, tự động', 8000000, 150000, 8000000, 'rental', 2, 3, 1),
(N'Thang nhôm 3 bậc', N'Thang nhôm chắc chắn, gấp gọn, an toàn', 800000, 20000, 800000, 'both', 2, 15, 1),
(N'Máy bơm nước', N'Máy bơm nước tự động, công suất cao', 2000000, 40000, 2000000, 'both', 2, 10, 1),
(N'Kìm cắt cáp', N'Kìm cắt cáp điện chuyên dụng, lưỡi thép', 500000, 10000, 500000, 'sale', 2, 30, 1),

-- Đồ nội thất
(N'Bàn làm việc gỗ', N'Bàn gỗ tự nhiên, kích thước 120x60cm, có ngăn kéo', 3000000, 80000, 3000000, 'both', 3, 8, 1),
(N'Ghế văn phòng ergonomic', N'Ghế văn phòng chỉnh độ cao, tựa lưng thoải mái', 2500000, 60000, 2500000, 'both', 3, 12, 1),
(N'Tủ quần áo 4 cánh', N'Tủ gỗ MDF, 4 cánh, có gương, rộng 2m', 5000000, 120000, 5000000, 'sale', 3, 5, 1),
(N'Giường ngủ gỗ', N'Giường gỗ tự nhiên, kích thước 1m6, có hộc kéo', 6000000, 150000, 6000000, 'sale', 3, 4, 1),
(N'Sofa góc 3 chỗ', N'Sofa bọc nỉ, màu xám, góc 3 chỗ, đệm êm', 8000000, 200000, 8000000, 'both', 3, 3, 1),
(N'Kệ sách 5 tầng', N'Kệ sách gỗ, 5 tầng, cao 180cm, rộng 80cm', 2000000, 50000, 2000000, 'both', 3, 10, 1),
(N'Bàn trà gỗ', N'Bàn trà gỗ tự nhiên, hình chữ nhật, có ngăn kéo', 1500000, 40000, 1500000, 'both', 3, 15, 1),
(N'Đèn bàn LED', N'Đèn bàn LED điều chỉnh độ sáng, chống cận', 500000, 15000, 500000, 'sale', 3, 20, 1),

-- Thiết bị gia đình
(N'Máy giặt Samsung', N'Máy giặt cửa trước, 9kg, tiết kiệm điện nước', 12000000, 250000, 12000000, 'sale', 4, 6, 1),
(N'Tủ lạnh Side by Side', N'Tủ lạnh 2 cửa, 500L, công nghệ Inverter', 15000000, 300000, 15000000, 'sale', 4, 4, 1),
(N'Lò vi sóng', N'Lò vi sóng 20L, nhiều chế độ nấu, dễ vệ sinh', 2000000, 40000, 2000000, 'both', 4, 12, 1),
(N'Máy lọc không khí', N'Máy lọc không khí HEPA, diệt khuẩn, điều khiển từ xa', 5000000, 100000, 5000000, 'both', 4, 8, 1),
(N'Máy sấy tóc công suất cao', N'Máy sấy tóc 2000W, nhiều tốc độ, ion âm', 800000, 20000, 800000, 'sale', 4, 25, 1),
(N'Máy pha cà phê', N'Máy pha cà phê tự động, pha espresso, cappuccino', 6000000, 120000, 6000000, 'both', 4, 5, 1),
(N'Bếp từ đôi', N'Bếp từ 2 bếp, cảm ứng, an toàn', 3000000, 60000, 3000000, 'sale', 4, 7, 1),
(N'Máy hút mùi', N'Máy hút mùi bếp, công suất cao, lọc than hoạt tính', 4000000, 80000, 4000000, 'sale', 4, 6, 1),
(N'Quạt điều hòa', N'Quạt điều hòa không khí, làm mát nhanh', 2500000, 50000, 2500000, 'both', 4, 10, 1),
(N'Máy rửa bát', N'Máy rửa bát 12 bộ, tiết kiệm nước, nhiều chế độ', 8000000, 150000, 8000000, 'sale', 4, 3, 1);

-- Kiểm tra số lượng sản phẩm đã thêm
SELECT COUNT(*) AS TotalProducts FROM Products;
SELECT category_id, COUNT(*) AS Count FROM Products GROUP BY category_id;

