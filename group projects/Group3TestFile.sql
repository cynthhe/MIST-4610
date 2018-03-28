USE ns_Group3;

CREATE TABLE ADDRESS (
	addressID INT(5),
    street VARCHAR(45),
    city VARCHAR(45),
    state VARCHAR(45),
    zip INT(5),
    userID INT(5),
    PRIMARY KEY(addressID),
    CONSTRAINT fk_address FOREIGN KEY(userID) REFERENCES USERS(userID) ON DELETE RESTRICT
    );
    
CREATE TABLE ASSEMBLY (
	orderID INT(5),
    productID INT(5),
    orderQuantity INT(2),
    PRIMARY KEY (orderID, productID));
    
CREATE TABLE PAYMENT (
	paymentID VARCHAR(16),
    paymentType VARCHAR(20),
    userID INT(5),
    PRIMARY KEY(paymentID),
    CONSTRAINT fk_payment FOREIGN KEY(userID) REFERENCES USER(userID));
    
# Total amount of orders spent by people with first names that start with the letter 'A'
SELECT USER.userFname AS 'User First Name', USER.userLName 'User Last Name', COUNT(ASSEMBLY.orderQuantity) AS 'Number of Orders'
FROM USER
JOIN ORDERS ON ORDERS.userID = USER.userID
JOIN ASSEMBLY ON ASSEMBLY.orderID = ORDERS.orderID
JOIN PRODUCT ON PRODUCT.prodID = ASSEMBLY.prodID
GROUP BY USER.userID
HAVING USER.userFname REGEXP '^A';

SELECT *
FROM ASSEMBLY;

SELECT *
FROM PRODUCT;

SELECT *
FROM ORDERS;

SELECT *
FROM USER;

SELECT *
FROM ADDRESS;

# User names and number of users in New York state that bought boots (including men’s, women’s, and children’s)
SELECT USER.userFName, USER.userLName, COUNT(USER.userID)
FROM USER
JOIN ORDERS ON ORDERS.userID = USER.userID;

# Product that has never been ordered in the month of March
SELECT prodName
FROM PRODUCT
WHERE EXISTS (SELECT * FROM ORDERS WHERE PRODUCT.prodID = ORDERS.orderID);

# Report all “jackets” products for which the number quantity ordered is greater than 3.
SELECT PRODUCT.prodName, ASSEMBLY.orderQuantity
FROM PRODUCT
WHERE prodName IN (‘Jackets’) AND orderQuantity > 3
AND EXISTS(SELECT * FROM ASSEMBLY WHERE ASSEMBLY.prodID = PRODUCT.prodID);

/*
Bookmark queries: Module 7
Stored procedure, save your query on the server.
TP_Q1, TP_Q2, etc.
CALL TP_Q1, etc.
Description: assignment phrasing, what does the query do
Justification: why would a manager be interested in this query (ex. high volume products in holiday system)
*/

CALL TP_Q1;
CALL TP_Q2;
CALL TP_Q3;
CALL TP_Q4;
CALL TP_Q5;
CALL TP_Q6;
CALL TP_Q7;
CALL TP_Q8;
CALL TP_Q9;
CALL TP_Q10;











