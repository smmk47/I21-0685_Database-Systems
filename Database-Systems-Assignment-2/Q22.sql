use airportdbms;
-- task 24
SELECT P.Pname, COUNT(*) AS TotalPlanes FROM PILOT P
JOIN FLIES F ON P.Plic_num = F.lic_num
GROUP BY P.Pname;