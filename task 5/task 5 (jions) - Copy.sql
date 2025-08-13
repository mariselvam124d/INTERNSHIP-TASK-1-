-- Create Customers table
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Insert Customers
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA');

-- Insert Orders
INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount)
VALUES
(101, '2025-08-01', 1, 250.00),
(102, '2025-08-02', 2, 150.00),
(103, '2025-08-03', 1, 300.00),
(104, '2025-08-04', 3, 200.00);
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
FULL JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
