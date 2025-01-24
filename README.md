
# Bookstore Inventory Management Database

Overview

Managing a bookstore efficiently requires tools to handle inventory, customer data, and orders seamlessly. This project provides a relational database designed to simplify the core operations of a single-location bookstore. With functionalities such as inventory tracking, sales reporting, and customer management, this database ensures streamlined operations while allowing room for future scalability.

## Features


### Inventory Management:

Add, update, and remove books from inventory.

Track stock levels and flag low-stock items automatically.

### Order Management:

Process and manage customer orders.

Record order details, including purchased books, quantities, and total amounts.

### Customer Management:

Store customer records such as names, emails, and purchase histories.

### Author Management:

Maintain a list of authors and their details, such as biographies.

### Category Organization:

Classify books into genres or types for easy navigation.

### Report Generation:

Generate reports on sales, inventory, and customer orders for informed decision-making.

### Search and Filtering:

Easily search for books, authors, and orders using keywords or filters.


## Scope



Books: Title, authors, price, categories, and stock levels.

Authors: Record of contributing authors.

Categories: Classification of books into genres.

Customers: Store and manage customer data.

Orders: Detailed tracking of customer purchases.

Order Details: Line-item details for orders.



## Relationships

Authors to Books: One-to-Many

Books to Categories: Many-to-One

Customers to Orders: One-to-Many

Orders to OrderDetails: One-to-Many

OrderDetails to Books: Many-to-One


## Example Queries

Fetch all books by a specific author:


```bash
  SELECT
    b.Title,
    b.Price,
    b.Stock
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
WHERE a.Name = 'Author Name';
```

Check inventory for a specific category:

```bash
SELECT
    b.Title,
    b.Stock
FROM Books b
JOIN Categories c ON b.CategoryID = c.CategoryID
WHERE c.Name = 'Category Name';


```

Summarize sales for a specific date:

```bash
SELECT
    o.OrderDate,
    b.Title,
    od.Quantity,
    (b.Price * od.Quantity) AS LineTotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Books b ON od.BookID = b.BookID
WHERE o.OrderDate = 'YYYY-MM-DD';


```
Calculate total revenue:


```bash
SELECT SUM(od.Quantity * b.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Books b ON od.BookID = b.BookID;
```



List low-stock books:

```bash
SELECT Title, Stock
FROM Books
WHERE Stock < 5;
```



## Optimizations

### Indexes:

Indexes on AuthorID, CategoryID, BookID, and CustomerID for efficient lookups.

Compound indexes on OrderID and BookID for faster joins.

### Constraints:

Foreign key constraints to ensure data integrity.

Default values for Stock to initialize books with a starting stock level.

### Normalization:

Database schema is normalized to 3NF to eliminate redundancy and ensure data consistency.

### Limitations

Designed for a single-location bookstore.

No real-time updates for stock changes.

Basic reports only; advanced analytics require external tools.

