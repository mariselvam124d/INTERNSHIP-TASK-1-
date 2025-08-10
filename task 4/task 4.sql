CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Table: Customers
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Categories
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Table: Products
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Table: Orders
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Table: Order_Items
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers (name, email, phone, address) VALUES
('Alice Johnson', 'alice@example.com', '9876543210', '123 Park Avenue, New York'),
('Bob Smith', 'bob@example.com', '8765432109', '456 Elm Street, Los Angeles'),
('Carol Lee', 'carol@example.com', '7654321098', '789 Oak Road, Chicago'),
('David Brown', 'david@example.com', '6543210987', '321 Maple Drive, Houston'),
('Emily Davis', 'emily@example.com', '5432109876', '654 Pine Lane, Phoenix'),
('Frank Miller', 'frank@example.com', '4321098765', '987 Birch Boulevard, Miami'),
('Grace Wilson', 'grace@example.com', '3210987654', '135 Cedar Court, Seattle'),
('Hannah Scott', 'hannah@example.com', '2109876543', '246 Spruce Street, Denver'),
('Ian Clark', 'ian@example.com', '1098765432', '369 Redwood Terrace, Boston'),
('Julia Turner', 'julia@example.com', '9988776655', '111 Willow Way, San Francisco');


INSERT INTO Categories (category_name, description) VALUES
('Electronics', 'Devices, gadgets, and accessories'),
('Books', 'Fiction, non-fiction, and educational books'),
('Clothing', 'Men’s and women’s apparel'),
('Home & Kitchen', 'Furniture, utensils, and decor'),
('Sports', 'Sports gear and accessories');

-- Insert into Products
INSERT INTO Products (product_name, price, stock, category_id) VALUES
('Smartphone X', 699.99, 50, 1),
('Wireless Headphones', 129.99, 100, 1),
('Laptop Pro 15"', 1299.00, 25, 1),
('Mystery Novel', 14.99, 200, 2),
('Science Textbook', 59.99, 80, 2),
('Men’s T-Shirt', 19.99, 150, 3),
('Women’s Dress', 49.99, 100, 3),
('Non-stick Pan Set', 79.99, 60, 4),
('Coffee Maker', 89.99, 40, 4),
('Football', 29.99, 70, 5);
-- aggrestive function
SELECT 
    SUM(price) AS total_sales,
    AVG(price) AS avg_price,
    COUNT(*) AS total_items
FROM Order_Items;


SELECT 
    c.category_name,
    SUM(oi.price * oi.quantity) AS total_sales,
    AVG(oi.price) AS avg_price,
    COUNT(*) AS total_items
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- groub by
SELECT 
    c.category_name,
    SUM(oi.price * oi.quantity) AS total_sales,
    AVG(oi.price) AS avg_price,
    COUNT(*) AS total_items
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name;



