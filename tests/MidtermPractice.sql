/*
host: richardtwatson.com
user: db1
pass: student
*/

USE ClassicModels;

# Question 1
SELECT lastName, firstName, COUNT(customerNumber)
FROM Employees
JOIN Customers ON Customers.salesRepEmployeeNumber = Employees.employeeNumber
GROUP BY employeeNumber
ORDER BY COUNT(customerNumber) DESC;

# Question 2
SELECT reportsTo.firstName, reportsTo.lastName, COUNT(emp.employeeNumber)
FROM Employees AS reportsTo
JOIN Employees AS emp ON reportsTo.employeeNumber = emp.reportsTo
GROUP BY reportsTo.employeeNumber
ORDER BY COUNT(emp.employeeNumber);

# Question 3
SELECT productLine, COUNT(DISTINCT orderNumber), SUM(quantityOrdered)
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
GROUP BY productLine;

# Question 4
SELECT productVendor, COUNT(productCode)
FROM Products
GROUP BY productVendor
HAVING COUNT(productCode) > (SELECT COUNT(*) / COUNT(DISTINCT productVendor) FROM Products);
