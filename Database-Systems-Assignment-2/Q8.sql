use airportdbms;

-- task10
SELECT H.Hlocation, H.Hcapacity - COUNT(A.Reg_No) AS AvailableSpace FROM HANGAR H
LEFT JOIN AIRPLANE A ON H.PHanger = A.PHanger
GROUP BY H.PHanger, H.Hcapacity, H.Hlocation
ORDER BY AvailableSpace DESC;