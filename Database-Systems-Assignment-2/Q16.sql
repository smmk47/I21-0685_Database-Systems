use airportdbms;

-- task 18
SELECT DISTINCT O.Oname, O.OAddress
FROM OWNER O
JOIN OWNS ON O.Ossn = OWNS.ssn
JOIN AIRPLANE A ON OWNS.Reg_No = A.Reg_No
WHERE OWNS.Pdate >= DATEADD(month, -1, GETDATE())
AND A.Pmodel IN (  SELECT A2.Pmodel  FROM AIRPLANE A2
    JOIN OWNS ON A2.Reg_No != OWNS.Reg_No
    WHERE OWNS.ssn = O.Ossn
)