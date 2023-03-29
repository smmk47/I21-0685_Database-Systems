use airportdbms;
-- task5
SELECT AVG(Esalary) AS avg_salary_night_shift
FROM EMPLOYEE
WHERE Eshift = 'Night';