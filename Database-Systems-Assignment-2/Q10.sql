use airportdbms;
-- task 12
SELECT PT.Pmodel, AVG(S.Shours) AS avg_maintenance_hours FROM AIRPLANE A
INNER JOIN PLANE_TYPE PT ON A.Pmodel = PT.Pmodel
INNER JOIN PLANE_SERVICE PS ON A.Reg_No = PS.Reg_No
INNER JOIN SERVICE S ON PS.Service_id = S.Sid
GROUP BY PT.Pmodel;