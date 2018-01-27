USE ClassicModels;

# Part (a)
SELECT productName, productLine, MSRP - buyPrice
FROM Products
ORDER BY productLine, MSRP - buyPrice DESC;

# Part (b)
SELECT productName, productLine
FROM Products
WHERE productScale = '1:700';

# Part (c)
SELECT customerName, customerNumber
FROM Customers
WHERE creditLimit < (SELECT AVG(creditLimit) FROM Customers);
