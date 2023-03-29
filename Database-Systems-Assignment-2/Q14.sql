use airportdbms;

-- task 16
SELECT  DISTINCT E.Ename ,E.Eworkhour FROM EMPLOYEE E
JOIN WORKS_ON W ON E.Essn = W.Essn
JOIN OWNS O ON W.Plan_regno = O.Reg_No
JOIN Corporation C ON O.ssn = C.Cssn
WHERE C.Corp_Name = 'Star Corp';