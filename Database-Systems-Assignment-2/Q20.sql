use airportdbms;

-- task 22
SELECT Eshift, AVG(Esalary) AS Average_Salary_By_Shifts FROM EMPLOYEE
GROUP BY Eshift;