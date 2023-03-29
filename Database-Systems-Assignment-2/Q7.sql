use airportdbms;

--- task9 
SELECT Plic_num, COUNT(lic_num) AS num_airplanes_authorized
FROM PILOT LEFT JOIN FLIES ON PILOT.Plic_num = FLIES.lic_num
GROUP BY Plic_num;