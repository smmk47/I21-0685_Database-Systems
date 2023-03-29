use airportdbms;

-- task8 
Select  x.Oname, x.OPhone FROM OWNER x ,OWNS o
where o.Pdate  BETWEEN DATEADD(day, -30, GETDATE()) AND GETDATE() and (o.ssn=x.Ossn);