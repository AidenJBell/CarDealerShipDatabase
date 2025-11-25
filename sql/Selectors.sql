# ---------------------------------------------------------------------- #
# Open Contracts Table                                                   #
# ---------------------------------------------------------------------- #

SELECT * FROM contracts;

# ---------------------------------------------------------------------- #
# Open Customers Table                                                   #
# ---------------------------------------------------------------------- #

SELECT * FROM customers;

# ---------------------------------------------------------------------- #
# Open Dealership Table                                                  #
# ---------------------------------------------------------------------- #

SELECT * FROM dealerships;

# ---------------------------------------------------------------------- #
# Open Employees Table                                                   #
# ---------------------------------------------------------------------- #

SELECT * FROM employees;

# ---------------------------------------------------------------------- #
# Open Inventory Table                                                   #
# ---------------------------------------------------------------------- #

SELECT * FROM inventory;

# ---------------------------------------------------------------------- #
# Open Inventory from specific Dealership                                #
# ---------------------------------------------------------------------- #

SELECT * FROM inventory
WHERE DealershipID = 1
ORDER BY DealershipID;

# ---------------------------------------------------------------------- #
# Filters by VIN														 #
# ---------------------------------------------------------------------- #

SELECT * FROM inventory
WHERE VIN LIKE '%1012%';

# ---------------------------------------------------------------------- #
# Filters by VIN, and shows which Dealership it's in					 #
# ---------------------------------------------------------------------- #

SELECT i.InventoryID, d.DealershipName, i.VIN, i.Make, i.Model, i.Year, i.CarType FROM inventory i
JOIN dealerships d ON d.DealershipID = i.DealershipID
WHERE VIN LIKE '%1012%';

# ---------------------------------------------------------------------- #
# Opens Contracts with better detail  									 #
# ---------------------------------------------------------------------- #

SELECT d.DealershipName, c.ContractID, c.ContractType, CONCAT(e.FirstName, ' ', e.LastName) AS Employee, CONCAT(b.FirstName, ' ', b.LastName) AS Customer, c.Date, c.InventoryID, CONCAT(i.Year, ' ', i.Make, ' ', i.Model) AS Vehicle
FROM contracts c
JOIN employees e ON e.EmployeeID = c.EmployeeID
JOIN customers b ON b.CustomerID = c.CustomerID
JOIN inventory i ON i.InventoryID = c.InventoryID
JOIN dealerships d ON d.DealershipID = i.DealershipID
ORDER BY Employee, Date;

# ---------------------------------------------------------------------- #
# Shows inventory of specific vehicles  								 #
# ---------------------------------------------------------------------- #

SELECT * FROM inventory
WHERE Year LIKE '%%'
AND Make LIKE '%Toyota%'
AND Model LIKE '%%'
AND CarType LIKE '%Sedan%'
AND Color LIKE '%%';

# ---------------------------------------------------------------------- #
# Shows sales report from dealership and within date range				 #
# ---------------------------------------------------------------------- #

SELECT d.DealershipName, c.ContractID,  c.InventoryID, c.ContractType, i.Status, CONCAT(e.FirstName, ' ', e.LastName) AS Employee, CONCAT(b.FirstName, ' ', b.LastName) AS Customer, c.Date, CONCAT(i.Year, ' ', i.Make, ' ', i.Model) AS Vehicle, i.Price, c.MonthlyPayment
FROM contracts c
JOIN employees e ON e.EmployeeID = c.EmployeeID
JOIN customers b ON b.CustomerID = c.CustomerID
JOIN inventory i ON i.InventoryID = c.InventoryID
JOIN dealerships d ON d.DealershipID = i.DealershipID
WHERE Status = 'SOLD'
AND d.DealershipID = 1
AND c.Date BETWEEN '2023-07-01' AND '2023-08-28';