USE northwind;

# Q1
SELECT ProductName, UnitsInStock
FROM Products
WHERE Discontinued = 1
ORDER BY UnitsInStock DESC;

# Q2
SELECT TerritoryDescription
FROM Territories
JOIN EmployeeTerritories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
WHERE EmployeeTerritories.EmployeeID IS NOT NULL;

# Q3
SELECT ReportsTo.LastName, ReportsTo.FirstName, TerritoryDescription
FROM Employees AS ReportsTo
JOIN Employees AS emp ON ReportsTo.EmployeeID = emp.ReportsTo
JOIN EmployeeTerritories ON EmployeeTerritories.EmployeeID = ReportsTo.EmployeeID
JOIN Territories ON Territories.TerritoryID = EmployeeTerritories.TerritoryID
GROUP BY ReportsTo.EmployeeID;

# Q4
SELECT Country, COUNT(Orders.OrderID) AS 'Total Orders', SUM(UnitPrice * Quantity) AS 'Total Value of Orders'
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN `Order Details` ON Orders.OrderID = `Order Details`.OrderID
WHERE Country = 'France'OR (Country = 'Austria') OR (Country = 'Sweden')
GROUP BY Country;

# Q5
SELECT emp.LastName, emp.FirstName
FROM Employees AS ReportsTo
JOIN Employees AS emp ON ReportsTo.EmployeeID = emp.ReportsTo
GROUP BY emp.EmployeeID;

# Q6
SELECT CompanyName, ProductName, UnitsInStock
FROM Suppliers
JOIN Products ON Products.SupplierID = Suppliers.SupplierID
WHERE UnitsInStock < (SELECT AVG(UnitsInStock) FROM Products)
ORDER BY CompanyName ASC, UnitsInStock DESC;

# Q7
SELECT CompanyName, COUNT(Orders.OrderID) AS 'Number of Orders'
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN `Order Details` ON Orders.OrderID = `Order Details`.OrderID
WHERE Quantity < (SELECT AVG(Quantity) FROM `Order Details`)
GROUP BY CompanyName
HAVING COUNT(Orders.OrderID) > 25
ORDER BY COUNT(Orders.OrderID) DESC;