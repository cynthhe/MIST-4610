# Q1
SELECT customerName, status, COUNT(*)
FROM Customers JOIN Orders ON Customers.customerNumber = Orders.customerNumber
GROUP BY customerName, status;

# Q2
SELECT customerName, COUNT(*)
FROM Customers JOIN Payments
ON Customers.customerNumber = Payments.customerNumber
WHERE amount > (SELECT AVG(amount) FROM Payments WHERE Customers.customerNumber = Payments.customerNumber)
GROUP BY Customers.customerNumber
ORDER BY COUNT(*) DESC;

# Q3
SELECT country, 100*COUNT(*)/(SELECT COUNT(*) FROM Orders)
FROM Customers JOIN Orders
ON Customers.customerNumber = Orders.customerNumber
GROUP BY country
ORDER BY 100*COUNT(*)/(SELECT COUNT(*) FROM Orders) DESC;

# Q4
SELECT productName, MSRP - buyPrice
FROM Products
WHERE MSRP-buyPrice > (SELECT AVG(MSRP - buyPrice) FROM Products)
GROUP BY productCode;

# Q5
SELECT boss.firstName, boss.lastName, boss.jobTitle, worker.firstName, worker.lastName, worker.jobTitle
FROM Employees AS boss
JOIN Employees AS worker
ON boss.employeeNumber = worker.reportsTo
WHERE boss.lastName = worker.lastName;

# Q6
SELECT Products.productName, ProductLines.productLine, AVG(OrderDetails.quantityOrdered)
FROM Products
JOIN ProductLines ON Products.productLine=ProductLines.productLine
JOIN OrderDetails ON OrderDetails.productcode=Products.productCode
GROUP BY Products.productCode
HAVING AVG(OrderDetails.quantityOrdered) > 
(SELECT AVG(quantityOrdered)
FROM OrderDetails
JOIN Products ON OrderDetails.productCode=Products.productCode
WHERE Products.productLine=ProductLines.productLine);
