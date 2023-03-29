use airportdbms;
-- task 13 
SELECT DISTINCT o.Oname FROM OWNER o
INNER JOIN OWNS w ON o.Ossn = w.ssn
INNER JOIN AIRPLANE a ON w.Reg_No = a.Reg_No
INNER JOIN WORKS_ON wo ON a.Pmodel = wo.model
WHERE w.ssn  IN (SELECT ssn FROM WORKS_ON WHERE model = a.Pmodel);