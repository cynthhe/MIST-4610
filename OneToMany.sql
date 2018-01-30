USE ns_ch88958;

CREATE TABLE DEPARTMENT(
	deptID VARCHAR(5),
    deptName VARCHAR(20),
    headOfDept VARCHAR(25),
    location VARCHAR(10),
    PRIMARY KEY(deptID)
);

CREATE TABLE STUDENT1(
	studentID VARCHAR(5),
    fName VARCHAR(10),
    lName VARCHAR(10),
    deptID VARCHAR(5),
    PRIMARY KEY(studentID),
    CONSTRAINT dept_student FOREIGN KEY(deptID)
    REFERENCES DEPARTMENT(deptID) ON DELETE RESTRICT
    # DELETE RESTRICT- Don't allow a user to delete rows in the other table
    # Referential integrity constraint- for values to exist as a foreign key, a corresponding value must be present as a primary key before
);

INSERT INTO DEPARTMENT VALUES('MIST', 'Mgmt of IST', 'Maric', 'Terry');
INSERT INTO STUDENT1 VALUES('111', 'Cynthia', 'He', 'MIST');

USE Text;

SELECT * FROM nation;
SELECT * FROM stock;

SELECT *
FROM nation
JOIN stock
ON nation.natcode = stock.natcode;

USE Text;

SELECT * FROM nation;
SELECT * FROM stock;

SELECT *
FROM stock
JOIN nation
ON nation.natcode = stock.natcode;

SELECT stkcode, stkfirm, stkprice, nation.natcode, exchrate
FROM stock
JOIN nation
ON nation.natcode = stock.natcode;

SELECT stkfirm, CONCAT(ROUND(stkqty * stkprice * exchrate, 2), ' pounds') AS 'Value of stock in pounds'
# Result of a concatination is a string, not a number
FROM stock
JOIN nation
ON nation.natcode = stock.natcode;

USE Chapter4;

SELECT *
FROM Department
JOIN Professor
ON Department.deptID = Professor.deptID;

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

SELECT natName AS 'Nation Name', COUNT(*) AS 'Number of Stocks'
FROM stock
JOIN nation
ON nation.natcode = stock.natcode
GROUP BY nation.natcode;
# GROUP BY clause allows us to aggregate values by certain columns

# Calculate value of all of the stocks for each nation in pounds
SELECT natname AS 'Nation Name', ROUND(SUM(stkqty * stkprice * exchrate), 2) AS 'Value of stock in pounds'
FROM stock
JOIN nation
ON nation.natcode = stock.natcode
GROUP BY nation.natcode;

# After a HAVING function are conditions. The HAVING function is the WHERE clause of groups.
SELECT natname, SUM(stkprice*stkqty*exchrate) AS 'stkvalue'
FROM stock
JOIN nation
ON stock.natcode = nation.natcode
GROUP BY natname
HAVING COUNT(*) >= 2;

SELECT natname, SUM(stkdiv), COUNT(*)
FROM stock
JOIN nation
ON stock.natcode = nation.natcode
GROUP BY natname
HAVING COUNT(*) >= 3;

USE Chapter4;

SELECT deptName, COUNT(*)
FROM Department
JOIN Professor
ON Department.deptID = Professor.deptID
GROUP BY deptName;

SELECT Department.deptID, COUNT(*)
FROM Department
GROUP BY deptID;

SELECT deptName, COUNT(*)
FROM Department, Professor
WHERE Department.deptID = Professor.deptID
GROUP BY deptname
HAVING COUNT(*) <= 2;

Use Text;

SELECT *
FROM nation
WHERE natname REGEXP '[^a-z|A-Z]';

SELECT *
FROM stock
WHERE stkfirm REGEXP '[e]{2}';

SELECT *
FROM stock
WHERE stkfirm REGEXP '[s]{2}|[n]{2}';

SELECT *
FROM stock
WHERE stkfirm REGEXP '[io]nia';

SELECT shrfirm
FROM share
WHERE shrfirm REGEXP '^(.){2}t';

SELECT *
FROM nation
WHERE natname REGEXP '^[^s|S]*$';

SELECT stkfirm
FROM stock
WHERE natcode IN (SELECT natcode FROM nation WHERE natname = 'Australia');

SELECT natname, stkfirm, stkqty
FROM stock
JOIN nation
ON stock.natcode = nation.natcode
AND stkqty > (SELECT AVG(stkqty) FROM stock WHERE stock.natcode = nation.natcode);