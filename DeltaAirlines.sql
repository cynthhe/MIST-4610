USE ClassicModels;

# Part (a)
SELECT city AS 'City', country AS 'Country', COUNT(employeeNumber) AS 'Number of Employees'
FROM Offices
JOIN Employees
ON Offices.officeCode = Employees.officeCode
GROUP BY Offices.officeCode
ORDER BY COUNT(employeeNumber) DESC;

# Part (b)
SELECT customerName AS 'Customer Name', AVG(amount) AS 'Average Payment Amount'
FROM Customers
JOIN Payments
ON Customers.customerNumber = Payments.customerNumber
GROUP BY Customers.customerNumber
HAVING AVG(amount) < (SELECT AVG(amount) FROM Payments)
ORDER BY customerName;

# Part (c)
SELECT customerName AS 'Customer Name', AVG(amount) AS 'Average Payment Amount', COUNT(checkNumber) AS 'Number of Payments'
FROM Customers
JOIN Payments
ON Customers.customerNumber = Payments.customerNumber
WHERE amount > (SELECT AVG(amount) FROM Payments WHERE Payments.customerNumber = Customers.customerNumber)
GROUP BY Customers.customerNumber
ORDER BY COUNT(checkNumber) DESC;