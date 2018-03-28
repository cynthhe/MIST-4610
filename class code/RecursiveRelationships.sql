USE Text;

SELECT * FROM product;
SELECT * FROM assembly;

# List product name, subproduct name, and the number of subproducts used to make the product
SELECT prod.proddesc AS 'Main Product', subprod.proddesc AS 'Sub product', quantity
FROM product AS prod JOIN assembly ON prod.prodid = assembly.prodid
JOIN product AS subprod ON subprod.prodid = assembly.subprodid;

# Product description, the cost to put together the product
SELECT prod.proddesc AS 'Main Product', SUM(subprod.prodcost*assembly.quantity) AS 'Cost'
FROM product AS prod JOIN assembly ON prod.prodid = assembly.prodid
JOIN product AS subprod ON subprod.prodid = assembly.subprodid
GROUP BY prod.prodid;

# Name of department, boss of department, number of employees in that department
SELECT dept.deptname, boss.empfname AS 'Boss Name', COUNT(*)
FROM emp AS boss JOIN dept ON boss.empno = dept.empno
JOIN emp AS worker ON dept.deptname = worker.deptname
GROUP BY dept.deptname;
