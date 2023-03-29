use airportdbms;

-- task 19
SELECT H.PHanger, COUNT(A.Reg_No) AS TotalPlanes FROM HANGAR H
LEFT JOIN AIRPLANE A ON H.PHanger = A.PHanger
GROUP BY H.PHanger;