CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') DEFAULT 'user'
);

CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'processing', 'completed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Order_Items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);



-- Data Insertion:
INSERT INTO Products (name, description, price, stock, created_at) VALUES
('Wireless Mouse', 'Ergonomic wireless mouse with USB receiver', 15.99, 20, NOW()),
('Mechanical Keyboard', 'RGB backlit mechanical keyboard', 59.99, 10, NOW()),
('Gaming Headset', 'Surround sound gaming headset with mic', 39.99, 25, NOW()),
('USB-C Hub', 'Multiport USB-C hub with HDMI and USB 3.0', 29.99, 5, NOW()),
('Webcam 1080p', 'HD webcam for streaming and video calls', 45.00, 18, NOW()),
('Laptop Stand', 'Adjustable aluminum laptop stand', 24.50, 30, NOW()),
('Portable SSD', '512GB USB 3.1 portable solid state drive', 89.99, 12, NOW()),
('Smartwatch', 'Fitness tracker smartwatch with heart rate', 75.00, 17, NOW()),
('Bluetooth Speaker', 'Waterproof portable Bluetooth speaker', 35.00, 22, NOW()),
('Wireless Charger', 'Fast wireless charging pad', 19.99, 8, NOW()),
('External Monitor', '24-inch Full HD monitor', 120.00, 14, NOW()),
('Ergonomic Chair', 'Adjustable office ergonomic chair', 150.00, 6, NOW()),
('Desk Lamp', 'LED desk lamp with adjustable brightness', 18.99, 28, NOW()),
('Graphic Tablet', 'Drawing tablet with pen support', 70.00, 11, NOW()),
('Noise Cancelling Earbuds', 'True wireless noise cancelling earbuds', 50.00, 16, NOW());



-- 1. Fetching all products with more than 10 stock.
SELECT * FROM Products WHERE stock > 10;


-- 2. Fetching all orders placed by a specific user.
SELECT * FROM Orders WHERE user_id = 3;

-- 3.  Updating product stock after an order is placed.
UPDATE Products
SET stock = stock - 5
WHERE id = 12 AND stock >= 5;



