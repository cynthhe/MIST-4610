USE Text;

SELECT * FROM dept;
SELECT * FROM emp;

# Who is the head of each department? (query on the 1-M)
SELECT empfname, dept.deptname
FROM dept
JOIN emp
ON dept.deptname = emp.deptname;

# query on the 1-1
SELECT empfname, dept.deptname
FROM dept
JOIN emp
ON emp.empno = dept.empno;

# To join a table to itself, you need to create an ALIAS of the table (creating a copy of the table). It will converge it into 2 different tables
# query on recursive 1-M
SELECT worker.empfname AS 'Worker Name', boss.empfname AS 'Boss Name'
FROM emp AS boss
JOIN emp AS worker ON boss.empno = worker.bossno;

# Name of department and name of boss for the employee name, Andrew
SELECT boss.deptName, boss.empfname AS 'Boss Name'
FROM emp AS boss
JOIN emp AS worker ON boss.empno = worker.bossno
WHERE worker.empfname = 'Andrew';

# Name of employee who earns more than their boss; how much more
SELECT worker.empfname, worker.empsalary - boss.empsalary
FROM emp AS boss
JOIN emp AS worker ON boss.empno = worker.bossno
WHERE worker.empsalary > boss.empsalary;

# Name of employee and the percentage more they earned more than their boss
SELECT worker.empfname, CONCAT((worker.empsalary - boss.empsalary)/(boss.empsalary)*100, '%') AS 'Percentage'
FROM emp AS boss
JOIN emp AS worker ON boss.empno = worker.bossno
WHERE worker.empsalary > boss.empsalary;

SELECT pre.monname, pre.rgnbeg
FROM monarch AS cur
JOIN monarch AS pre ON cur.premonname = pre.monname
AND cur.premonnum = pre.monnum
WHERE cur.monname = 'Victoria';

# How long was the reign of monarch preceeding Victoria?
SELECT pre.monname, DATEDIFF(cur.rgnbeg, pre.rgnbeg)/365
# DATEDIFF is used to subtract dates
FROM monarch AS cur
JOIN monarch AS pre ON cur.premonname = pre.monname
AND cur.premonnum = pre.monnum
WHERE cur.monname = 'Victoria';