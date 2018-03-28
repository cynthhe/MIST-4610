USE ClassicModels;


SELECT *
FROM Orders 
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON OrderDetails.productCode = Products.productCode;

#Count of number of products in every order
SELECT Orders.orderNumber, COUNT(Products.productCode)
FROM Orders 
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON OrderDetails.productCode = Products.productCode
GROUP BY Orders.orderNumber;

#customer name and count of different products
SELECT customerName, 100*(COUNT(DISTINCT productCode)/(SELECT COUNT(*) FROM Products))
FROM Customers 
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
GROUP BY Customers.customerNumber;

SELECT customerName, COUNT(DISTINCT productLine), 100*(COUNT(DISTINCT Products.productLine)/(SELECT COUNT(*) FROM ProductLines)), 100*(COUNT(DISTINCT Products.productCode)/(SELECT COUNT(*) FROM Products))
FROM Customers 
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON OrderDetails.productCode = Products.productCode
GROUP BY Customers.customerNumber;




USE Text;


SELECT * FROM item;
SELECT * FROM lineitem;
SELECT * FROm sale;

SELECT *
FROM item
WHERE NOT EXISTS 
(SELECT * FROM lineitem WHERE item.itemno = lineitem.itemno);


USE ClassicModels;

SELECT productName
FROM Products
WHERE NOT EXISTS 
(SELECT * FROM OrderDetails WHERE Products.productCode =
OrderDetails.productCode);
#excess inventory
SELECT productName
FROM Products
WHERE quantityInStock > 5000;

#lot of margin
SELECT productName
FROM Products
WHERE MSRP > 2*buyPrice;


SELECT productName
FROM Products
WHERE quantityInStock > 5000
UNION
SELECT productName
FROM Products
WHERE MSRP > 2*buyPrice;
