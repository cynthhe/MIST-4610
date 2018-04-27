USE 4610Srinivasan; # USE ns_

CREATE TABLE DEPARTMENT(

	deptID VARCHAR(5),
	deptName VARCHAR(20),
	headOfDept VARCHAR(25),
	location VARCHAR(10),
	PRIMARY KEY(deptID)
);

CREATE TABLE STUDENT(
	studentID VARCHAR(5),
	fName	VARCHAR(10),
	lName	VARCHAR(10),
	deptID	VARCHAR(5),
	PRIMARY KEY(studentID),
	CONSTRAINT dept_student FOREIGN KEY(deptID)
	REFERENCES DEPARTMENT(deptID) ON DELETE RESTRICT
);

INSERT INTO DEPARTMENT VALUES('MIST','Mgmt of IST','Maric','Terry');
INSERT INTO STUDENT VALUES('111','Nikhil','Srini','MIST');

USE Text;

SELECT * FROM nation;
SELECT * FROM stock;

SELECT *
FROM nation
JOIN stock
ON nation.natcode = stock.natcode;

SELECT stkcode, stkfirm, stkprice, nation.natcode, exchrate
FROM nation
JOIN stock
ON nation.natcode = stock.natcode;

SELECT stkfirm, CONCAT(ROUND(stkqty*stkprice*exchrate,2),' pounds') AS 'Value of stock in pounds'
FROM nation
JOIN stock
ON nation.natcode = stock.natcode;

USE Chapter4;

SELECT *
FROM Department
JOIN Professor
ON Department.deptID = Professor.deptID;

SELECT * FROM Department;

SELECT facLname, facFname
FROM Department
JOIN Professor
ON Department.deptID = Professor.deptID
WHERE deptName = 'Art';

SELECT deptUrl
FROM Department
JOIN Professor
ON Department.deptID = Professor.deptID
WHERE facID = '7890';

USE Text;

SELECT *
FROM nation
JOIN stock
ON nation.natcode = stock.natcode;

SELECT COUNT(*)
FROM stock
JOIN nation
ON nation.natcode = stock.natcode;

SELECT natName, COUNT(*)
FROM stock
JOIN nation
ON nation.natcode = stock.natcode
GROUP BY nation.natcode;

SELECT natname, ROUND(SUM(stkqty*stkprice*exchrate),2)
FROM stock
JOIN nation
ON nation.natcode = stock.natcode
GROUP BY nation.natcode;

USE Text;

SELECT *
FROM stock
JOIN nation
ON stock.natcode = nation.natcode;

SELECT natname, stkfirm, stkprice, exchrate
FROM nation
JOIN stock
ON nation.natcode = stock.natcode
WHERE stkprice > (SELECT AVG(stkprice) FROM stock);

SELECT natname, COUNT(*)
FROM nation
JOIN stock
ON nation.natcode = stock.natcode
WHERE stkprice > (SELECT AVG(stkprice) FROM stock)
GROUP BY nation.natcode;

# Write a query to give me natname, stkfirm, stkprice, exchrate for those stock whose price > AVG price for that nation

SELECT natname, stkfirm, stkprice, exchrate
FROM stock
JOIN nation
ON stock.natcode = nation.natcode
WHERE stkprice >
(SELECT AVG(stkprice) FROM stock WHERE stock.natcode = nation.natcode);

SELECT AVG(stkprice) FROM stock WHERE stock.natcode = 'UK';

USE Chapter4;

SELECT Rec_name, Rec_prep_time, Source_website
FROM Recipe
JOIN Source
ON Recipe.Source_ID = Source.Source_ID
WHERE Rec_prep_time < 
(SELECT AVG(Rec_prep_time) FROM Recipe WHERE Recipe.Source_ID = Source.Source_ID);

USE Text;

CREATE VIEW stockNation(nationName, nameOfStock, priceOfStock)
AS 
SELECT natname, stkfirm, stkprice
FROM stock
JOIN nation
ON nation.natcode = stock.natcode;

SELECT *
FROM stockNation;
