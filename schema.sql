-- Schema for the bookstore inventory database.

-- CREATE TABLE statements.
CREATE TABLE Authors (
    AuthorID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Bio TEXT
);

CREATE TABLE Categories (
    CategoryID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    AuthorID INTEGER NOT NULL,
    CategoryID INTEGER NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerName TEXT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INTEGER PRIMARY KEY,
    OrderID INTEGER NOT NULL,
    BookID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    LineTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- CREATE INDEX statements.
CREATE INDEX idx_books_title ON Books(Title);
CREATE INDEX idx_orders_date ON Orders(OrderDate);

-- CREATE VIEW statements.
CREATE VIEW InventorySummary AS
SELECT
    b.BookID,
    b.Title,
    a.Name AS Author,
    c.Name AS Category,
    b.Price,
    b.Stock
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
JOIN Categories c ON b.CategoryID = c.CategoryID;

CREATE VIEW SalesSummary AS
SELECT
    o.OrderID,
    o.OrderDate,
    od.BookID,
    b.Title,
    od.Quantity,
    od.LineTotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Books b ON od.BookID = b.BookID;
