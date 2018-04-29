USE Chapter3;

SELECT * FROM item;

SELECT * FROM item WHERE item_price > 25;

SELECT item_name FROM item WHERE item_price <100;

SELECT AVG(item_price)
FROM item
WHERE item_category ='Toy';

SELECT AVG(item_price) FROM item;

SELECT item_name, item_price
FROM item
WHERE item_price > 216.435;

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

SELECT shrcode, shrprice, shrfirm
FROM share
WHERE shrfirm REGEXP 'Geese|Gold|Ruby';

SELECT *
FROM share 
WHERE shrfirm REGEXP '^S';

SELECT DISTINCT(shrpe)
FROM share;

SELECT *
FROM share
WHERE shrfirm REGEXP 'e$';

SELECT *
FROM share;

USE Chapter3;

SELECT *
FROM student
WHERE l_name REGEXP '^S';

SELECT *
FROM student
WHERE f_name REGEXP 'A|a';

SELECT COUNT(*)
FROM student
WHERE state = 'GA';

SELECT DISTINCT(city)
FROM student;

SELECT *
FROM student
WHERE l_name REGEXP '^.r';

USE Text;

SELECT * FROM share;

SELECT * 
FROM share
WHERE shrprice BETWEEN 20 AND 40;

SELECT * 
FROM share
WHERE shrfirm BETWEEN 'A' AND 'O';
