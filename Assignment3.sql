USE ClassicModels;

# Part (a)
SELECT Customers.customerName AS 'Customer Names', Products.productName AS 'Product Names'
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON OrderDetails.orderNumber = Orders.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode
WHERE Orders.status = 'In Process';

# Part (b)
SELECT Customers.customerName AS 'Customer Names'
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
WHERE Orders.status NOT IN('Shipped','Resolved','On Hold','Disputed','In Process')
ORDER BY Customers.customerName;

# Part (c)
SELECT DISTINCT Offices.addressLine1 AS 'Offices', COUNT(Employees.officeCode) AS 'Number of Employees', COUNT(Orders.customerNumber) AS 'Number of Orders'
FROM Offices
JOIN Employees ON Employees.officeCode = Offices.officeCode
JOIN Customers ON Customers.salesRepEmployeeNumber = Employees.employeeNumber
JOIN Orders ON Orders.customerNumber = Customers.customerNumber
GROUP BY Offices.officeCode;

# Part (d)
SELECT emp.lastName AS 'Employee Last Names', emp.firstName AS 'Employee First Names', emp.extension 'Extensions'
FROM Employees AS emp
JOIN Employees AS reportsTo ON reportsTo.employeeNumber = emp.employeeNumber
WHERE emp.jobTitle = reportsTo.jobTitle
GROUP BY emp.employeeNumber;

#Part (e)
SELECT Employees.lastName AS 'Employee Last Names', Employees.firstName AS 'Employee First Names', ROUND(priceEach*quantityOrdered, 2) AS 'Amount Generated'
FROM Employees
JOIN Customers ON Customers.salesRepEmployeeNumber = Employees.employeeNumber
JOIN Orders ON Orders.customerNumber = Customers.customerNumber
JOIN OrderDetails ON OrderDetails.orderNumber = Orders.orderNumber
GROUP BY Employees.employeeNumber
ORDER BY (priceEach*quantityOrdered) DESC;