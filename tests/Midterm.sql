USE ClassicModels;

# Question 1
SELECT DISTINCT customerName, status, COUNT(Orders.orderNumber)
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
GROUP BY customerName;

# Question 2
SELECT customerName AS 'Customer Name', COUNT(checkNumber) AS 'Number of Checks'
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
WHERE amount > (SELECT AVG(amount) FROM Payments)
GROUP BY customerName
ORDER BY COUNT(checkNumber) DESC;

# Question 3
SELECT Customers.country AS 'Country', CONCAT(quantityOrdered/SUM(quantityOrdered)*100, '%') AS 'Percentage of Total Orders'
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
GROUP BY Customers.country
ORDER BY quantityOrdered/SUM(quantityOrdered)*100 DESC;

# Question 4
SELECT productName AS 'Product Name', ROUND(MSRP-buyPrice, 2) AS 'Margin'
FROM Products
WHERE MSRP-buyPrice > (SELECT AVG(MSRP-buyPrice) FROM Products);

# Question 5
SELECT reportsTo.firstName AS 'Boss First Name', reportsTo.lastName 'Boss Last Name', reportsTo.jobTitle AS 'Boss Job Title', emp.firstName AS 'Worker First Name', emp.lastName AS 'Worker Last Name', emp.jobTitle AS 'Worker Job Title'
FROM Employees AS reportsTo
JOIN Employees AS emp ON reportsTo.employeeNumber = emp.reportsTo
WHERE reportsTo.lastName = emp.lastName;

# Question 6
SELECT productName AS 'Product Name', Products.productLine 'Product Line', ROUND(AVG(quantityOrdered)) AS 'Average Ordered'
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
GROUP BY productName
HAVING AVG(quantityOrdered) > (SELECT AVG(quantityOrdered) FROM OrderDetails);
