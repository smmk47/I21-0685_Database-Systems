use airportdbms;
-----task 3
SELECT Reg_No FROM AIRPLANE
WHERE Reg_No NOT IN (  SELECT Reg_No FROM PLANE_SERVICE);
