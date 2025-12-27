-- Script SQL để cập nhật image_url cho các categories đã có
-- Chạy script này nếu đã có dữ liệu categories trong database

UPDATE Categories 
SET image_url = 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400'
WHERE name = N'Đồ điện tử' AND image_url IS NULL;

UPDATE Categories 
SET image_url = 'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=400'
WHERE name = N'Dụng cụ' AND image_url IS NULL;

UPDATE Categories 
SET image_url = 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400'
WHERE name = N'Đồ nội thất' AND image_url IS NULL;

UPDATE Categories 
SET image_url = 'https://images.unsplash.com/photo-1556911220-bff31c812dba?w=400'
WHERE name = N'Thiết bị gia đình' AND image_url IS NULL;

-- Kiểm tra kết quả
SELECT id, name, image_url FROM Categories;

