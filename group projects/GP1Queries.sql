USE ns_Group3;

# CREATE PROCEDURE TP_Q1()
# Query 1: Report the most expensive product ordered in states with more than three orders.
SELECT state AS 'State', prodName AS 'Product Name', MAX(prodPrice) AS 'Product Price'
FROM ADDRESS
JOIN USER ON ADDRESS.userID = USER.userID
JOIN ORDERS ON USER.userID = ORDERS.userID
JOIN ASSEMBLY ON ORDERS.orderID = ASSEMBLY.orderID
JOIN PRODUCT ON ASSEMBLY.prodID = PRODUCT.prodID
GROUP BY state
HAVING COUNT(ASSEMBLY.orderQuantity) > 3;

# CREATE PROCEDURE TP_Q2()
# Query 2: Report the products along with its brand that have order quantities less than 10 in order.
SELECT prodBrand AS 'Product Brand', prodName AS 'Product Name', orderQuantity AS 'Order Quantity'
FROM PRODUCT
JOIN ASSEMBLY ON PRODUCT.prodID = ASSEMBLY.prodID
JOIN ORDERS ON ASSEMBLY.orderID = ORDERS.orderID
WHERE orderQuantity < 10
ORDER BY orderQuantity;

# CREATE PROCEDURE TP_Q3()
# Query 3: Report the total amount of orders spent by people with first names that start with the letter ‘A’.
SELECT userFname AS 'User First Name', userLName 'User Last Name', userEmail AS 'Email', street AS 'Street', city AS 'City', state AS 'State', zip AS 'Zip Code', COUNT(ASSEMBLY.orderQuantity) AS 'Order Quantity'
FROM USER
JOIN ADDRESS ON ADDRESS.userID = USER.userID
JOIN ORDERS ON ORDERS.userID = USER.userID
JOIN ASSEMBLY ON ASSEMBLY.orderID = ORDERS.orderID
JOIN PRODUCT ON PRODUCT.prodID = ASSEMBLY.prodID
GROUP BY USER.userID
HAVING USER.userFname REGEXP '^A';

# CREATE PROCEDURE TP_Q4()
# Query 4: Report the products whose average price is greater than the average cost and by how much.
SELECT prodName AS 'Product Name', ROUND(AVG(prodPrice),2) AS 'Average Price', ROUND(AVG(prodCost),2) AS 'Average Cost', (ROUND(AVG(prodPrice),2)-ROUND(AVG(prodCost),2)) AS 'Profit Margin'
FROM PRODUCT
GROUP BY prodID
HAVING AVG(prodPrice) > (SELECT AVG(prodCost) FROM PRODUCT);

# CREATE PROCEDURE TP_Q5()
# Query 5: Report the users who live in Georgia, Florida, Tennessee, and South Carolina along with the products they ordered and the order dates.
SELECT userFName AS 'User First Name', userLName AS 'User Last Name', prodName AS 'Product Name', orderDate AS 'Order Date', state AS 'State'
FROM ADDRESS
JOIN USER ON USER.userID = ADDRESS.userID
JOIN ORDERS ON ORDERS.userID = USER.userID
JOIN ASSEMBLY ON ASSEMBLY.orderID = ORDERS.orderID
JOIN PRODUCT ON PRODUCT.prodID = ASSEMBLY.prodID
WHERE state IN('GA','FL','TN','SC');

# CREATE PROCEDURE TP_Q6()
# Query 6: Report the order date and the order quantity of brands whose order quantity is greater than the average order quantity of that brand.
SELECT orderQuantity, prodBrand, orderDate
FROM ASSEMBLY
JOIN PRODUCT ON ASSEMBLY.prodID = PRODUCT.prodID
JOIN ORDERS ON ASSEMBLY.orderID = ORDERS.orderID
WHERE orderQuantity > (SELECT AVG(orderQuantity) FROM ASSEMBLY WHERE ASSEMBLY.prodID = PRODUCT.prodID);

# CREATE PROCEDURE TP_Q7()
# Query 7: Report the method of payment for users who purchased Steve Madden products only.
SELECT paymentType AS 'Payment Type', prodName AS 'Product Name', prodBrand AS 'Product Brand'
FROM PAYMENT
JOIN USER ON PAYMENT.userID = USER.userID
JOIN ORDERS ON USER.userID = ORDERS.userID
JOIN ASSEMBLY ON ORDERS.orderID = ASSEMBLY.orderID
JOIN PRODUCT ON ASSEMBLY.prodID = PRODUCT.prodID
WHERE prodBrand = 'Steve Madden'
GROUP BY paymentType;

# CREATE PROCEDURE TP_Q8()
# Query 8: Report users who bought Kate Spade products and reports the users' email address.
SELECT userFName AS 'User First Name', userLName AS 'User Last Name', userEmail AS 'User Email'
FROM USER
JOIN ORDERS ON USER.userID = ORDERS.userID
JOIN ASSEMBLY ON ASSEMBLY.orderID = ORDERS.orderID
JOIN PRODUCT ON PRODUCT.prodID = ASSEMBLY.prodID
WHERE prodBrand = 'Kate Spade' AND EXISTS(SELECT * FROM PRODUCT WHERE PRODUCT.prodID = ASSEMBLY.prodID);

# CREATE PROCEDURE TP_Q9()
# Query 9: Report the users' cities and the number of orders in each city.
SELECT city AS 'City', COUNT(ASSEMBLY.orderID) AS 'Number of Orders'
FROM ADDRESS
JOIN USER ON USER.userID = ADDRESS.userID
JOIN ORDERS ON ORDERS.userID = USER.userID
JOIN ASSEMBLY ON ASSEMBLY.orderID = ORDERS.orderID
GROUP BY city;

# CREATE PROCEDURE TP_Q10()
# Query 10: Report the product names and the number of users who bought each product.
 SELECT prodName AS 'Product Name', COUNT(USER.userID) AS 'Number of Users'
 FROM PRODUCT
 JOIN ASSEMBLY ON ASSEMBLY.prodID = PRODUCT.prodID
 JOIN ORDERS ON ORDERS.orderID = ASSEMBLY.orderID
 JOIN USER ON USER.userID = ORDERS.userID
 GROUP BY PRODUCT.prodID;
