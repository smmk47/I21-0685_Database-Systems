use airportdbms;

-- task 14
SELECT DISTINCT o.Oname, o.OPhone FROM OWNER o
FULL JOIN OWNS w ON o.Ossn = w.ssn
FULL JOIN AIRPLANE a ON w.Reg_No = a.Reg_No
FULL JOIN Corporation c ON w.ssn = c.Cssn
FULL JOIN HANGAR h ON a.PHanger = h.PHanger
WHERE o.OAddress = h.Hlocation;