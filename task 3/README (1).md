# 📦 Customers Database Project

This project defines a `Customers` table and demonstrates common SQL queries using `SELECT`, `WHERE`, `ORDER BY`, `LIKE`, `BETWEEN`, and more. It’s useful for learning and testing basic SQL operations.

---

## 🛠️ Table Schema

```sql
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 📥 Sample Data Insertion

```sql
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
```

---

## 🔍 SQL Query Examples

### ✅ 1. SELECT * and Specific Columns

```sql
-- All columns
SELECT * FROM Customers;

-- Only name and email
SELECT name, email FROM Customers;
```

### ✅ 2. Filtering with WHERE, AND, OR, LIKE, BETWEEN

```sql
-- Customers in New York
SELECT * FROM Customers
WHERE address LIKE '%New York%';

-- Names starting with 'A'
SELECT * FROM Customers
WHERE name LIKE 'A%';

-- Phone starting with '9' or '8'
SELECT * FROM Customers
WHERE phone LIKE '9%' OR phone LIKE '8%';

-- Created between two dates
SELECT * FROM Customers
WHERE created_at BETWEEN '2025-08-01' AND '2025-08-08';

-- Name starts with 'D' and lives in Houston
SELECT * FROM Customers
WHERE name LIKE 'D%' AND address LIKE '%Houston%';
```

### ✅ 3. ORDER BY Usage

```sql
-- Sort by name A-Z
SELECT * FROM Customers
ORDER BY name;

-- Sort by newest customers first
SELECT * FROM Customers
ORDER BY created_at DESC;

-- Sort by email A-Z
SELECT * FROM Customers
ORDER BY email ASC;
```

---

## 📌 Requirements

- MySQL or any SQL-compatible RDBMS
- Basic SQL knowledge

---

## 📂 Project Structure

```
📁 customers-database/
├── README.md
└── customers.sql
```

---

## ✨ License

MIT License – Free to use and modify.