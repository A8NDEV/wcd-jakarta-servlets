CREATE DATABASE IF NOT EXISTS WCDLab;
USE WCDLab;

CREATE TABLE IF NOT EXISTS products (
    code    VARCHAR(50)  PRIMARY KEY,
    name    VARCHAR(255) NOT NULL,
    price   INT          NOT NULL,
    image   VARCHAR(255)           -- Chỉ lưu tên file, không lưu đường dẫn đầy đủ
);

-- Dữ liệu mẫu (tùy chọn)
INSERT IGNORE INTO products(code, name, price, image) VALUES
    ('SP001', 'Áo Thun Trắng',  150000, ''),
    ('SP002', 'Quần Jean Xanh', 350000, ''),
    ('SP003', 'Giày Thể Thao',  450000, '');
