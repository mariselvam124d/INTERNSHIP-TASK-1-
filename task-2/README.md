
# Customer Database Example

This project demonstrates basic SQL operations (CREATE, INSERT, UPDATE, DELETE) using a `Customers` table in MySQL.

## Table Schema

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

## Insert Example

```sql
INSERT INTO Customers (name, email, phone, address)
VALUES ('John Doe', 'john@example.com', '1234567890', '123 Main St');
```

## Update Example

```sql
UPDATE Customers
SET phone = '0987654321', address = '456 Market St'
WHERE customer_id = 1;
```

## Delete Example

```sql
DELETE FROM Customers
WHERE customer_id = 1;
```

## Notes

- `customer_id` is auto-incremented.
- `email` must be unique.
- `created_at` defaults to the current timestamp.
- Always use `WHERE` in `UPDATE` and `DELETE` to avoid affecting all rows.

## License

This example is free to use for learning and educational purposes.
