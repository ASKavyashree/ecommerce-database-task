use ecommerce;
SELECT 
    o.OrderID,
    o.CustomerID,
    (SELECT SUM(od.Quantity * p.Price)
     FROM OrderDetails od
     JOIN Product p ON od.ProductID = p.ProductID
     WHERE od.OrderID = o.OrderID) AS TotalAmount
FROM Orders o;

SELECT 
    c.CustomerID,
    c.Name,
    (SELECT MAX(o.OrderDate)
     FROM Orders o
     WHERE o.CustomerID = c.CustomerID) AS LatestOrderDate
FROM Customer c;
SELECT Name, CustomerID
FROM Customer
WHERE CustomerID IN (
    SELECT o.CustomerID
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Product p ON od.ProductID = p.ProductID
    WHERE p.Price > 1000
);
SELECT c.CustomerID, c.Name
FROM Customer c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    JOIN Payment pay ON o.OrderID = pay.OrderID
    WHERE o.CustomerID = c.CustomerID
);
SELECT ProductName, Price
FROM Product
WHERE Price = (SELECT MAX(Price) FROM Product);



