USE ClassicModels;

/*OR and AND function*/
SELECT *
FROM Customers
WHERE state = 'NY' OR state = 'CA';
# WHERE state = 'CA' AND country = 'USA';

/*IN or NOT IN function*/
SELECT *
FROM Customers
WHERE state IN ('NY', 'CA');
# WHERE state NOT IN ('NY','CA');

/*Operations functions:
1. MIN(x)
2. MAX(x)
3. AVG(x)
4. SUM(x)
5. COUNT(x)
6. CONCAT(x, 'y')
7. DATEDIFF(x,y)
8. ROUND(x,2)
*/

/*Subquery*/
SELECT productName, buyPrice
FROM Products
WHERE buyPrice > (SELECT AVG(buyPrice) FROM Products);

/*Correlated Subquery*/
SELECT *
FROM Orders
JOIN OrderDetails
ON Orders.orderNumber = OrderDetails.orderNumber
WHERE priceEach > (SELECT AVG(priceEach) FROM OrderDetails WHERE Orders.orderNumber = OrderDetails.orderNumber);

/*ORDER BY*/
SELECT *
FROM Customers
ORDER BY customerName;
# ORDER BY customerName DESC;

/*Regular Expressions*/
SELECT *
FROM Products
/*Text-based pattern matching*/
WHERE productVendor REGEXP 'Design|Classics|Galleries';
/*Start with a letter*/
# WHERE productVendor REGEXP '^H';
/*Last character*/
# WHERE productVendor REGEXP 's$';
/*First character after the beginning character*/
# WHERE productVendor REGEXP '^.l';
/*Repeating letters*/
# WHERE productVendor REGEXP '[s]{2}';

/*DISTINCT function*/
SELECT DISTINCT (productVendor)
FROM Products;

/*BETWEEN clause*/
SELECT *
FROM OrderDetails
WHERE quantityOrdered BETWEEN 20 AND 30;

/*Anomalies:
1. UPDATE: when we try to update multiple rows in a table
2. DELETE
3. INSERT
- Referential integrity constraint
*/

/*JOIN*/
SELECT *
FROM Orders
JOIN OrderDetails
ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON OrderDetails.productCode = Products.productCode;

/*GROUP BY*/
SELECT customerName, (COUNT(DISTINCT productCode)/(SELECT COUNT(*) FROM Products))*100
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
GROUP BY Customers.customerNumber;

/*GROUP BY with HAVING*/
SELECT productVendor, COUNT(productCode)
FROM Products
GROUP BY productVendor
HAVING COUNT(productCode) > (SELECT COUNT(*) / COUNT(DISTINCT productVendor) FROM Products);

/*Recursive Relationship*/
SELECT reportsTo.firstName, reportsTo.lastName, COUNT(emp.employeeNumber)
FROM Employees AS reportsTo
JOIN Employees AS emp ON reportsTo.employeeNumber = emp.reportsTo
GROUP BY reportsTo.employeeNumber
ORDER BY COUNT(emp.employeeNumber);

/*EXISTS and NOT EXISTS*/
SELECT productName
FROM Products
WHERE EXISTS (SELECT * FROM OrderDetails WHERE Products.productCode = OrderDetails.productCode);
# WHERE NOT EXISTS (SELECT * FROM OrderDetails WHERE Products.productCode = OrderDetails.productCode);

/*UNION clause (stack results together)*/
SELECT productName
FROM Products
WHERE quantityInStock > 5000
UNION
SELECT productName
FROM Products
WHERE MSRP > 2*buyPrice;