-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName, c.CategoryName
FROM product as p
LEFT JOIN categories as c 

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, s.ShipperName
FROM order as o
LEFT JOIN shipper as s ON o.ShipperName = s.CompanyName
WHERE o.OrderDate < '2012-08-09'


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT od.OrderId, p.ProductName, od.Quantity
FROM [OrderDetail] as od 
JOIN product as p ON p.ProductId = od.ProductId
WHERE od.OrderId = 10251
ORDER BY p.ProductName ASC
LIMIT 3

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.OrderId, c.CustomerName, e.LastName as EmployeeLastName
From [Order] as o
LEFT JOIN customer as c ON o.CustomerId = c.Id
LEFT JOIN employee as e ON o.EmployeeId = e.Id
