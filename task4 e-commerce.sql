use ecommerce;


SELECT COUNT(*) AS TotalCustomers FROM Customer;


SELECT SUM(Stock) AS TotalStock FROM Product;


SELECT AVG(Price) AS AvgPrice FROM Product;


SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM Product;


SELECT SUM(Quantity) AS TotalProductsSold FROM OrderDetails;


SELECT SUM(Amount) AS TotalRevenue FROM Payment;


SELECT ProductID, SUM(Quantity) AS TotalOrdered
FROM OrderDetails
GROUP BY ProductID;

SELECT Method, SUM(Amount) AS TotalAmount
FROM Payment
GROUP BY Method;


SELECT Status, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Status;


SELECT ProductID, SUM(Quantity) AS TotalOrdered
FROM OrderDetails
GROUP BY ProductID
HAVING SUM(Quantity) > 5;

SELECT Method, SUM(Amount) AS TotalAmount
FROM Payment
GROUP BY Method
HAVING SUM(Amount) > 100000;

SELECT Status, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Status
HAVING COUNT(*) > 2;


SELECT c.CustomerID, c.Name, SUM(p.Amount) AS TotalSpent
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Payment p ON o.OrderID = p.OrderID
GROUP BY c.CustomerID, c.Name
HAVING SUM(p.Amount) > 50000;

