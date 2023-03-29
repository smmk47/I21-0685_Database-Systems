use airportdbms;

-- task 15
SELECT DISTINCT Pname
FROM PILOT
JOIN FLIES ON PILOT.Plic_num = FLIES.lic_num
JOIN AIRPLANE ON FLIES.model = AIRPLANE.Pmodel
WHERE AIRPLANE.Pstatus = 'maintenance';
