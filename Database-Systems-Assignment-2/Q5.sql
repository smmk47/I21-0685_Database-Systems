use airportdbms;
-- task7 
SELECT a.Pmodel, ps.Reg_No FROM PLANE_SERVICE ps, AIRPLANE a
WHERE ps.PSdate BETWEEN DATEADD(day, -7, GETDATE()) AND GETDATE() and ps.Reg_No=a.Reg_No;