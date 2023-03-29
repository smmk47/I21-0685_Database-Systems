use airportdbms;
-- task 21
SELECT Reg_No, COUNT(*) AS TotalServices
FROM PLANE_SERVICE
GROUP BY Reg_No;