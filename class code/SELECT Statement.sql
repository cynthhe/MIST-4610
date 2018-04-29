USE Text;

SELECT * 
FROM share;

SELECT shrpe, shrcode, shrfirm, shrprice
FROM share;

SELECT *
FROM share
WHERE shrprice < 30;

SELECT shrfirm, shrprice, shrpe
FROM share
WHERE shrcode = 'BE' OR shrcode = 'AR';

SELECT shrfirm, shrprice, shrpe
FROM share
WHERE shrcode = 'BE' OR shrcode = 'AR' OR shrcode = 'NG';

SELECT shrfirm, shrprice, shrpe
FROM share
WHERE shrcode IN ('BE','AR','NG');

SELECT shrfirm, shrprice, shrpe
FROM share
WHERE shrcode NOT IN ('BE','AR','NG');

USE Chapter3;

SELECT *
FROM student;

SELECT f_name, middle_init, l_name, state
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

SELECT COUNT(shrpe)
FROM share;

SELECT MIN(shrprice)
FROM share;

SELECT MAX(shrprice) AS 'Max Price', MIN(shrprice) AS 'MIN Price', AVG(shrprice) AS 'Average price', 
SUM(shrqty) AS 'Share quantity'
FROM share;

SELECT shrfirm, shrprice*shrqty AS 'Value of Shares'
FROM share;
