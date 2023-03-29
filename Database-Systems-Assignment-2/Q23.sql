use airportdbms;

-- task 25 
--Query to find the average weight of planes in each hangar:
SELECT H.PHanger, AVG(PT.Pweight) AS AvgWeight
FROM HANGAR H
JOIN AIRPLANE A ON H.PHanger = A.PHanger
JOIN PLANE_TYPE PT ON A.Pmodel = PT.Pmodel
GROUP BY H.PHanger;
/*This query can be important for hangar managers to track the weight of the planes in their hangar. It can also be useful for airlines to ensure that their planes are stored in a hangar that can handle their weight.*/

--  Query to find the total number of planes of each plane type currently in service
SELECT A.Pmodel, COUNT(*) AS TotalPlanes
FROM AIRPLANE A
WHERE A.Pstatus = 'Available'
GROUP BY A.Pmodel;
/*This query can be important for airline operations managers to track the number of planes of each type currently in service. It can also be useful for maintenance teams to plan for maintenance and repair work on specific plane types.*/


--  Query to find the name and total salary of the highest paid employee:
SELECT E.Ename, E.Esalary
FROM EMPLOYEE E
ORDER BY E.Esalary DESC;
/*This query can be important for HR departments to track the highest paid employee and their salary. It can also be useful for management to ensure that the highest paid employee is being utilized effectively within the organization.*/

-- Query to find the total number of airplanes in each hangar, along with their capacity:
SELECT H.PHanger, H.Hcapacity, COUNT(*) AS TotalPlanes
FROM HANGAR H
JOIN AIRPLANE A ON H.PHanger = A.PHanger
GROUP BY H.PHanger, H.Hcapacity;
/*This query is important to keep track of the number of planes stored in each hangar and to ensure that the hangar capacity is not exceeded. It can be used by airport authorities and maintenance personnel to monitor the hangar capacity and ensure proper utilization of available space.*/

