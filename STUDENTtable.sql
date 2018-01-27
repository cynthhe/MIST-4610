USE ns_ch88958;
#This is a comment
/*
this is a multi-line comment
*/

/* 
CREATE TABLE
INSERT INTO

SELECT [column name]
FROM [table]
WHERE [condition rows]
ORDER BY [column name]

UPDATE [allows us to modify data that is present in tables]
WHERE...
Update a table name and pick a row
DELETE [allows us to delete rows from tables]
WHERE...
Delete from a table
Companies usually don't delete data because historical data is useful
*/
CREATE TABLE STUDENT (
	810Number INT(9),
    lName VARCHAR(15),
    fName VARCHAR(10),
    major VARCHAR(20),
    dateOfBirth DATE,
    PRIMARY KEY(810Number)
);

INSERT INTO STUDENT(810Number,lName,fName,major,dateOfBirth)
VALUES (8111111,'Cynthia','He','MIS',2001-01-01);

INSERT INTO STUDENT(810Number,lName,fName,major,dateOfBirth)
VALUES (8111777,'Cynthia','He','MIS',2001-01-01);

INSERT INTO STUDENT(810Number,lName,fName,major,dateOfBirth)
VALUES (8117777,'Cynthia','He','MIS');

INSERT INTO STUDENT
VALUES (8117777,'Cynthia','He','MIS',1998/25/03STUDENT);

USE Text;

SELECT *
FROM share;

SELECT shrfirm, shrprice
FROM share;

SELECT shrpe, shrcode, shrfirm, shrprice
FROM share;

SELECT *
FROM share
WHERE shrprice < 30;

SELECT *
FROM share
WHERE shrcode = 'BE' OR shrcode = 'AR';

SELECT shrfirm, shrprice, shrpe
FROM share
WHERE shrcode = 'BE' OR shrcode = 'AR';

SELECT shrfirm, shrprice, shrpe
FROM share
WHERE shrcode = 'BE' OR shrcode = 'AR' OR shrcode = 'NG';

SELECT shrfirm, shrprice, shrpe
FROM share
WHERE shrcode NOT IN ('BE','AR','NG');

USE Chapter3;

SELECT *
FROM student;

SELECT f_name, middle_init, l_name, state
FROM student;

SELECT l_name, f_name, middle_init
FROM student;

SELECT *
FROM student
WHERE state = 'GA';

SELECT *
FROM student
WHERE state NOT IN ('GA');

SELECT l_name, f_name
FROM student
WHERE state IN ('SC','AL','GA');

USE Text;

SELECT *
FROM share
ORDER BY shrpe DESC, shrcode;

SELECT COUNT(shrcode)
FROM share;

SELECT MIN(shrprice)
FROM share;

SELECT MAX(shrprice)
FROM share;

SELECT MAX(shrprice) AS 'Max Price', MIN(shrprice) AS 'MIN Price', AVG(shrprice) AS 'Average price',
SUM(shrqty) AS 'Share quantity'
FROM share;

SELECT shrfirm, shrprice*shrqty AS 'Value of Shares'
FROM share;

USE Chapter3;

SELECT *
FROM item;

SELECT *
FROM item
WHERE item_price > 25;

SELECT item_name
FROM item
WHERE item_price < 100;

SELECT AVG(item_price)
FROM item
WHERE item_category = 'toy';

SELECT AVG(item_price)
FROM item
WHERE item_price > 216.435;

#This is an example of subqueries
SELECT item_name, item_price
FROM item
WHERE item_price > (SELECT AVG(item_price) FROM item);

SELECT *
FROM item
ORDER BY item_price DESC;

SELECT COUNT(*)
FROM item;

USE Text;

SELECT * FROM share;

SELECT shrfirm, shrprice
FROM share
WHERE shrpe > (SELECT AVG(shrpe) FROM share);

#This is wrong
SELECT shrfirm, shrpriceFROM share
WHERE shrpe > (SELECT shrpe FROM share WHERE shrprice > 25);

SELECT shrcode, shrprice, shrfirm
FROM share
# The = operator is an exact match
WHERE shrfirm = 'Geese';

#Regular expressions
SELECT shrcode, shrprice, shrfirm
FROM share
#Text-based pattern matching
WHERE shrfirm REGEXP 'Geese|Gold|Ruby';

SELECT *
FROM share
# ^ signfies start with the letter
WHERE shrfirm REGEXP '^S';

SELECT *
FROM share
# $ at the end signfies the last character
WHERE shrfirm REGEXP 'y$';

# DISTINCT allows you to select unique values
SELECT DISTINCT (shrpe)
FROM share;

USE Chapter3;

SELECT f_name, middle_init, l_name
FROM student
WHERE l_name REGEXP '^S';

SELECT *
FROM student
WHERE f_name REGEXP 'A|a';

SELECT COUNT(*)
FROM student
WHERE state REGEXP 'GA';

SELECT DISTINCT (city)
FROM student;

SELECT *
FROM student
# The . signfies the first character after the beginning character
WHERE l_name REGEXP '^.r';

USE Text;

SELECT *
FROM share
# BETWEEN clause
WHERE shrprice BETWEEN 20 AND 40;

SELECT *
FROM share
WHERE shrfirm BETWEEN 'A' AND 'O';

/*
UPDATE anomalies when we try to update multiple rows in a table
DELETE anomalies
INSERT anomalies
The referential integrity constraint
*/



