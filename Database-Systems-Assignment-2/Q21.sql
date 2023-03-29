use airportdbms;

-- task23
SELECT O.Oname, COUNT(*) AS TotalPlanes FROM OWNER O
JOIN OWNS ON O.Ossn = OWNS.ssn
JOIN AIRPLANE A ON OWNS.Reg_No = A.Reg_No
GROUP BY O.Oname;