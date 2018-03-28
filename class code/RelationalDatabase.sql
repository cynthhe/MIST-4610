USE ns_ch88958;

CREATE TABLE sale (
	saleno INTEGER,
    saledate DATE NOT NULL,
    saletext VARCHAR (50),
    PRIMARY KEY(saleno));
    
CREATE TABLE item (
	itemno INTEGER,
    itemname VARCHAR(30) NOT NULL,
    itemtype CHAR(1) NOT NULL,
    itemcolor VARCHAR(10),
    PRIMARY KEY(itemno));
    
CREATE TABLE lineitem (
	lineno INTEGER,
    lineqty INTEGER NOT NULL,
    lineprice DECIMAL(7,2) NOT NULL,
    saleno INTEGER,
    itemno INTEGER,
    PRIMARY KEY(lineno,saleno),
	CONSTRAINT fk_has_sale FOREIGN KEY(saleno) REFERENCES sale(saleno),
	CONSTRAINT fk_has_item FOREIGN KEY(itemno) REFERENCES item(itemno));
    
SELECT * FROM saleno;

#Three table join
SELECT * FROM sale JOIN lineitem
ON sale.saleno = lineitem.saleno
JOIN item ON item.itemno = lineitem.itemno;

USE ClassicModels;

SELECT *
FROM Orders
JOIN OrderDetails
ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON OrderDetails.productCode = Products.productCode;

# Customer name and count of different products
SELECT customerName, (COUNT(DISTINCT productCode)/(SELECT COUNT(*) FROM Products))*100
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
GROUP BY Customers.customerNumber;

# Customer name, number of different product lines they order from
SELECT customerName, COUNT(DISTINCT ProductLine)
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON OrderDetails.productCode = Products.productCode
GROUP BY Customers.customerNumber;

/*EXISTS: boolean quantifier, existential qualifier; returns true or false; returns true if the 
table contains at least one row satisfying the specified condition, checks the presence of the results*/

USE Text;

SELECT * FROM item;
SELECT * FROM lineitem;
SELECT * FROM sale;

SELECT *
FROM item
WHERE EXISTS (SELECT * FROM lineitem WHERE item.itemno = lineitem.itemno);

SELECT *
FROM item
WHERE NOT EXISTS (SELECT * FROM lineitem WHERE item.itemno = lineitem.itemno);

USE ClassicModels;

# How many products are in the products table
SELECT COUNT(productCode)
FROM Products;

# Product that has never been ordered
SELECT productName
FROM Products
WHERE NOT EXISTS (SELECT * FROM OrderDetails WHERE Products.productCode = OrderDetails.productCode);

/* UNION and INTERSECT = relational operations. MySQL doesn't allow INTERSECT but allows UNION. Takes results of two queries and stacks them on top of
each other. INTERSECT only gives you the shared requirement (the middle of the Venn diagram)*/

# List of Product names where qty stock is greater than 5000 (excess inventory)
SELECT productName
FROM Products
WHERE quantityInStock > 5000;

#List product names where msrp is greater than twice the buyprice (lot of margin)
SELECT productName
FROM Products
WHERE MSRP > 2*buyPrice;

# Using the UNION clause to stack the results together (There are 22 products that meet both of these requirements)
SELECT productName
FROM Products
WHERE quantityInStock > 5000
UNION
SELECT productName
FROM Products
WHERE MSRP > 2*buyPrice;
