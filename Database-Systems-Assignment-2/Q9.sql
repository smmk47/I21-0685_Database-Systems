use airportdbms;

-- task 11
SELECT c.Corp_Name, COUNT(o.Reg_No) AS num_planes_owned FROM Corporation c
INNER JOIN OWNS o ON c.Cssn = o.ssn
GROUP BY c.Corp_Name
ORDER BY num_planes_owned DESC;