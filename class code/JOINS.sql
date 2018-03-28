USE ClassicModels;

# Customers that placed orders
SELECT customerName AS 'Customer Name', COUNT(Orders.orderNumber) AS 'Number of Orders'
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
GROUP BY Customers.customerName;

# All customers (customers who have and have not placed orders)
SELECT customerName AS 'Customer Name', COUNT(Orders.orderNumber) AS 'Number of Orders'
FROM Customers
LEFT JOIN Orders ON Customers.customerNumber = Orders.customerNumber
GROUP BY Customers.customerNumber;

# Number of times a product has been ordered
SELECT Products.productName AS 'Product Name', COUNT(DISTINCT orderNumber) AS 'Number of Times Ordered'
FROM OrderDetails
RIGHT JOIN Products ON Products.productCode = OrderDetails.productCode
GROUP BY Products.productCode
ORDER BY COUNT(orderNumber) ASC;

# Total value of payments made by every customer
SELECT Customers.customerName, ROUND(SUM(Payments.amount),2)
FROM Customers
LEFT JOIN Payments ON Customers.customerNumber = Payments.customerNumber
GROUP BY Customers.customerNumber;

# Number of employees supervised by every employee
SELECT Employees.firstName, Employees.lastName, COUNT()
FROM Employees AS boss ON Employees.reportsTo = b
LEFT JOIN Employees AS emp ON;

/* 
Routines:
	1. PROCEDURE
    2. FUNCTION
    3. TRIGGER- executed when there is a change to the database (no need to write update, delete statements)
    
Spatial and temporal data (geographical data)
*/