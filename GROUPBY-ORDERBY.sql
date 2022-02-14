SELECT * FROM Products
WHERE CategoryID  IN (1,2,3)
ORDER BY CategoryID

SELECT * FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 20 
AND ProductName BETWEEN 'Chai' AND 'Konbu' 
AND CategoryID  IN (3,4,5)
ORDER BY UnitPrice,CategoryID,ProductName


SELECT TOP 5 P.ProductName,OD.UnitPrice,O.OrderDate FROM Products P
INNER JOIN [Order Details] OD ON OD.ProductID=P.ProductID
INNER JOIN Orders O ON O.OrderID=OD.OrderID
WHERE OD.UnitPrice BETWEEN 30 AND 40 
AND O.OrderDate BETWEEN '1998-03-01' AND '1998-05-31' 
ORDER BY P.ProductName 

SELECT p.ProductID, p.ProductName ,sum(od.UnitPrice) AS Toplam FROM [Order Details] od
INNER JOIN Products p on od.ProductID=p.ProductID
GROUP BY P.ProductName,P.ProductID

SELECT ProductName,UnitPrice FROM Products

SELECT p.ProductID, p.ProductName ,COUNT (P.ProductName) AS Toplam FROM [Order Details] od
INNER JOIN Products p on od.ProductID=p.ProductID
GROUP BY P.ProductName,P.ProductID

SELECT TOP 1 E.EmployeeID,E.FirstName,E.LastName,SUM(OD.UnitPrice*OD.Quantity) AS TOPLAMSATIS FROM Employees E
INNER JOIN Orders O ON O.EmployeeID=E.EmployeeID
INNER JOIN [Order Details] OD ON OD.OrderID=O.OrderID
WHERE YEAR(O.OrderDate) =1997 
GROUP BY  E.EmployeeID,E.FirstName,E.LastName
ORDER BY TOPLAMSATIS DESC

