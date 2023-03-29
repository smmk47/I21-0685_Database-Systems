use airportdbms;
-- task 20
SELECT Pmodel, COUNT(*) AS TotalPlanes FROM AIRPLANE
GROUP BY Pmodel;