use airportdbms;
--- task 4
SELECT c.Corp_Name, c.Csddress FROM Corporation c
JOIN OWNS o ON c.Cssn = o.ssn
JOIN AIRPLANE a ON o.Reg_No = a.Reg_No
JOIN PLANE_TYPE pt ON a.Pmodel = pt.Pmodel
WHERE pt.Pcapacity > 200;