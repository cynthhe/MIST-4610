USE ClassicModels;

/*
This query returns the customer name and the a count of the number of orders they have placed
and the Sales rep lname/fname
for those customers whose count of orders is greater than the average number of orders placed by
all customers. 
*/
Create procedure query2()
SELECT Customers.customerName AS 'Customer', COUNT(Orders.orderNumber) As 'Number of Orders', Employees.lastName AS 'Sales Rep LName', Employees.firstName AS 'Sales Rep FName'
FROM Customers, Employees, Orders
WHERE Customers.salesRepEmployeeNumber = Employees.employeeNumber
AND Customers.customerNumber = Orders.customerNumber
GROUP BY Customers.customerNumber
HAVING COUNT(Orders.orderNumber) > 
(SELECT AVG(counts)
FROM (SELECT COUNT(Orders.orderNumber) AS 'counts'
FROM Orders , Customers
WHERE Customers.customerNumber = Orders.customerNumber 
GROUP BY Customers.customerNumber) A )
ORDER BY Customers.customerName;

/*
This is the subquery that returns the Average number of orders after counting the number of orders
for each customer.
*/

SELECT AVG(counts)
FROM (SELECT COUNT(Orders.orderNumber) AS 'counts'
FROM Orders , Customers
WHERE Customers.customerNumber = Orders.customerNumber 
GROUP BY Customers.customerNumber) A;

call query2;
