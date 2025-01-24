-- Query to fetch all books by a specific author.
SELECT
    b.Title,
    b.Price,
    b.Stock
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
WHERE a.Name = 'Author Name';

-- Query to check inventory for a specific category.
SELECT
    b.Title,
    b.Stock
FROM Books b
JOIN Categories c ON b.CategoryID = c.CategoryID
WHERE c.Name = 'Category Name';

-- Query to summarize sales for a specific date.
SELECT
    o.OrderDate,
    b.Title,
    od.Quantity,
    od.LineTotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Books b ON od.BookID = b.BookID
WHERE o.OrderDate = 'YYYY-MM-DD';

-- Query to calculate total revenue.
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

-- Query to list low-stock books.
SELECT Title, Stock FROM Books WHERE Stock < 5;
