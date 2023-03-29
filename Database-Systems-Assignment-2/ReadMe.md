**DATABASE**

**ASSIGNMENT#2**

**GROUP MEMBERS:**

**Muhammad Waleed 21i-0438**

**Murtaza Kazmi 21i-0685**

**[ERD:]{.underline}**

**Entities:**

1.  **Airplane**

2.  **Owner**

3.  **Service**

4.  **Person**

5.  **Corporation**

6.  **Pilot**

7.  **Hanger**

8.  **Plane_type**

9.  **Employee**

**Relationships:**

1.  **Owns ( between Airplane and Owner)**

2.  **Undergoes Maintenance (between Airplane and service)**

3.  **Stored_in (between Airplane and Hanger)**

4.  **Type ( between Airplane and Plane_Type)**

5.  **Fly (between Plane_Type and Pilot)**

6.  **Maintain (between Plane_type and Employee)**

**Cardinality:**

1.  **1:N ( Airplane and service)**

2.  **N:1 (Airplane and Hanger)**

3.  **N:1 (Plane_type and Pilot)**

4.  **N:1 (Plane_type and Employee)**

5.  **N:1 (Airplane and Owner)**

6.  **N:1 (Airplane and Plane_type)**

**Super Entity:**

1.  **Owner**

**Sub Entity:**

1.  **Person**

2.  **Corporation**

3.  **Pilot**

4.  **Employee**

**EXPLANATION:**

This ERD is mapped according to the given case, but due to some demands
in queries, it was changed a little bit or basically we added some
attributes according to given query.

**Tables:**

create database airportdbms;

use airportdbms;

CREATE TABLE AIRPLANE (

Reg_No numeric(4) not null,

Pstatus varchar(15),

Pmodel varchar(5),

PHanger varchar(5),

);

CREATE TABLE PLANE_TYPE (

Pmodel varchar(5),

Pcapacity numeric(4),

Pweight numeric(4),

);

CREATE TABLE SERVICE (

Sworkcode varchar(4) not null,

Shours numeric(4),

Sid numeric(4),

);

CREATE TABLE PLANE_SERVICE (

Reg_No numeric(4),

Service_id numeric(4),

PSdate DATE,

);

CREATE TABLE HANGAR (

PHanger varchar(5),

Hcapacity numeric(4),

Hlocation varchar(255),

);

CREATE TABLE Corporation (

Cssn numeric(4) not null,

Corp_Name varchar(50),

Csddress varchar(255),

Cphone varchar(11)

);

CREATE TABLE PERSON (

Pssn numeric(4) not null,

Pname varchar(255),

Paddress varchar(255),

Pphone varchar(11)

);

CREATE TABLE OWNER (

Ossn numeric(4) not null,

Oname varchar(255),

OAddress varchar(255),

OPhone varchar(11)

);

CREATE TABLE OWNS (

Reg_No numeric(4) not null,

ssn numeric(4) not null,

Pdate DATE,

);

CREATE TABLE PILOT (

Plic_num numeric(7) not null,

PRestr VARCHAR(255),

Pname varchar(50),

Pssn numeric(4) not null,

);

CREATE TABLE FLIES (

lic_num numeric(7),

model varchar(5),

);

CREATE TABLE EMPLOYEE (

Essn numeric(4) not null,

Ename varchar(50),

Esalary decimal(10,2),

Eworkhour numeric(4),

Eshift varchar(10),

);

CREATE TABLE WORKS_ON (

Essn numeric(4),

model varchar(5),

Plan_regno numeric(4),

);

**Q1: Write a SQL query to find the registration numbers of airplanes
that have never undergone maintenance.**

SELECT Reg_No FROM AIRPLANE

WHERE Reg_No NOT IN ( SELECT Reg_No FROM PLANE_SERVICE);

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image1.png){width="2.308333333333333in"
height="2.0990977690288712in"}

**Q2: Write a SQL query to find the names and addresses of corporations
that own airplanes with a capacity greater than 200**

SELECT c.Corp_Name, c.Csddress FROM Corporation c

JOIN OWNS o ON c.Cssn = o.ssn

JOIN AIRPLANE a ON o.Reg_No = a.Reg_No

JOIN PLANE_TYPE pt ON a.Pmodel = pt.Pmodel

WHERE pt.Pcapacity \> 200;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image2.png){width="2.75in"
height="1.4686646981627296in"}

**Q3: Write a SQL query to find the average salary of employees who work
the night shift**

**(between 10 PM and 6 AM).**

SELECT AVG(Esalary) AS avg_salary_night_shift

FROM EMPLOYEE

WHERE Eshift = \'Night\';

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image3.png){width="1.5418000874890638in"
height="0.6833923884514436in"}

**Q4: Write a SQL query to find the top 5 employees with the highest
total number of**

**maintenance hours worked.**

SELECT top 5 EMPLOYEE.Essn FROM EMPLOYEE

ORDER BY EMPLOYEE.Eworkhour DESC;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image4.png){width="1.325in"
height="1.0927832458442694in"}

**Q5: Write a SQL query to find the names and registration numbers of
airplanes that have**

**undergone maintenance in the past week.**

SELECT a.Pmodel, ps.Reg_No FROM PLANE_SERVICE ps, AIRPLANE a

WHERE ps.PSdate BETWEEN DATEADD(day, -7, GETDATE()) AND GETDATE() and
ps.Reg_No=a.Reg_No;

**Output:**

**Q6: Write a SQL query to find the names and phone numbers of all
owners who have**

**purchased a plane in the past month.**

Select x.Oname, x.OPhone FROM OWNER x ,OWNS o

where o.Pdate BETWEEN DATEADD(day, -30, GETDATE()) AND GETDATE() and
(o.ssn=x.Ossn);

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image5.png){width="1.825in"
height="2.0661603237095365in"}

**Q7: Write a SQL query to find the number of airplanes each pilot is
authorized to fly.**

SELECT Plic_num, COUNT(lic_num) AS num_airplanes_authorized

FROM PILOT LEFT JOIN FLIES ON PILOT.Plic_num = FLIES.lic_num

GROUP BY Plic_num;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image6.png){width="2.05in"
height="1.9945942694663168in"}

**Q8: Write a SQL query to find the location and capacity of the hangar
with the most**

**available space.**

SELECT H.Hlocation, H.Hcapacity - COUNT(A.Reg_No) AS AvailableSpace FROM
HANGAR H

LEFT JOIN AIRPLANE A ON H.PHanger = A.PHanger

GROUP BY H.PHanger, H.Hcapacity, H.Hlocation

ORDER BY AvailableSpace DESC;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image7.png){width="1.6786909448818899in"
height="1.3666666666666667in"}

**Q9: Write a SQL query to find the number of planes owned by each
corporation, sorted in**

**descending order by number of planes.**

SELECT c.Corp_Name, COUNT(o.Reg_No) AS num_planes_owned FROM Corporation
c

INNER JOIN OWNS o ON c.Cssn = o.ssn

GROUP BY c.Corp_Name

ORDER BY num_planes_owned DESC;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image8.png){width="2.1in"
height="1.1883234908136482in"}

**Q10: Write a SQL query to find the average number of maintenance hours
per plane, broken**

**down by plane type.**

SELECT PT.Pmodel, AVG(S.Shours) AS avg_maintenance_hours FROM AIRPLANE A

INNER JOIN PLANE_TYPE PT ON A.Pmodel = PT.Pmodel

INNER JOIN PLANE_SERVICE PS ON A.Reg_No = PS.Reg_No

INNER JOIN SERVICE S ON PS.Service_id = S.Sid

GROUP BY PT.Pmodel;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image9.png){width="2.00419728783902in"
height="1.7416666666666667in"}

**Q11: Write a SQL query to find the names of owners who have purchased
a plane that**

**requires maintenance work from an employee who is not qualified to
work on that type**

**of plane.**

SELECT DISTINCT o.Oname FROM OWNER o

INNER JOIN OWNS w ON o.Ossn = w.ssn

INNER JOIN AIRPLANE a ON w.Reg_No = a.Reg_No

INNER JOIN WORKS_ON wo ON a.Pmodel = wo.model

WHERE w.ssn IN (SELECT ssn FROM WORKS_ON WHERE model = a.Pmodel);

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image10.png){width="1.0666666666666667in"
height="1.5743996062992125in"}

**Q12: Write a SQL query to find the names and phone numbers of owners
who have**

**purchased a plane from a corporation that has a hangar in the same
location as the**

**owner.**

SELECT DISTINCT o.Oname, o.OPhone FROM OWNER o

FULL JOIN OWNS w ON o.Ossn = w.ssn

FULL JOIN AIRPLANE a ON w.Reg_No = a.Reg_No

FULL JOIN Corporation c ON w.ssn = c.Cssn

FULL JOIN HANGAR h ON a.PHanger = h.PHanger

WHERE o.OAddress = h.Hlocation;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image11.png){width="1.6166666666666667in"
height="1.2225207786526684in"}

**Q13: Write a SQL query to find the names of pilots who are qualified
to fly a plane that is**

**currently undergoing maintenance.**

SELECT DISTINCT Pname FROM PILOT

JOIN FLIES ON PILOT.Plic_num = FLIES.lic_num

JOIN AIRPLANE ON FLIES.model = AIRPLANE.Pmodel

WHERE AIRPLANE.Pstatus = \'maintenance\';

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image12.png){width="1.519103237095363in"
height="1.425in"}

**Q14: Write a SQL query to find the names of employees who have worked
on planes owned by a particular corporation, sorted by the total number
of maintenance hours worked.**

SELECT DISTINCT E.Ename ,E.Eworkhour FROM EMPLOYEE E

JOIN WORKS_ON W ON E.Essn = W.Essn

JOIN OWNS O ON W.Plan_regno = O.Reg_No

JOIN Corporation C ON O.ssn = C.Cssn

WHERE C.Corp_Name = \'Star Corp\';

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image13.png){width="1.7501520122484688in"
height="1.0250885826771654in"}

Q15: Write a SQL query to find the names and registration numbers of
airplanes that have never been owned by a corporation or undergone
maintenance work from an employee who works the day shift.

SELECT DISTINCT AIRPLANE.Pmodel, AIRPLANE.Reg_No FROM AIRPLANE

LEFT JOIN OWNS ON AIRPLANE.Reg_No = OWNS.Reg_No

LEFT JOIN PLANE_SERVICE ON AIRPLANE.Reg_No = PLANE_SERVICE.Reg_No

WHERE OWNS.ssn IS NULL

AND PLANE_SERVICE.Service_ID IS NULL

OR AIRPLANE.Reg_No NOT IN (

SELECT OWNS.Reg_No

FROM OWNS

JOIN CORPORATION ON OWNS.ssn = CORPORATION.Cssn

)

AND AIRPLANE.Reg_No NOT IN (

SELECT WORKS_ON.Plan_regno

FROM WORKS_ON

JOIN EMPLOYEE ON WORKS_ON.Essn = EMPLOYEE.Essn

WHERE EMPLOYEE.Eshift = \'Morning\'

);

Output:

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image14.png){width="1.6723982939632547in"
height="2.140097331583552in"}

**Q16: Write a SQL query to find the names and addresses of owners who
have purchased a**

**plane from a corporation that has also purchased a plane of the same
type in the past**

**month.**

SELECT DISTINCT O.Oname, O.OAddress FROM OWNER O

JOIN OWNS ON O.Ossn = OWNS.ssn

JOIN AIRPLANE A ON OWNS.Reg_No = A.Reg_No

WHERE OWNS.Pdate \>= DATEADD(month, -1, GETDATE())

AND A.Pmodel IN ( SELECT A2.Pmodel FROM AIRPLANE A2

JOIN OWNS ON A2.Reg_No != OWNS.Reg_No

WHERE OWNS.ssn = O.Ossn

)

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image15.png){width="1.7376170166229221in"
height="1.6583333333333334in"}

**Q17: Write a Query to find the total number of planes stored in each
hangar.**

SELECT H.PHanger, COUNT(A.Reg_No) AS TotalPlanes FROM HANGAR H

LEFT JOIN AIRPLANE A ON H.PHanger = A.PHanger

GROUP BY H.PHanger;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image16.png){width="1.4788659230096237in"
height="1.2583333333333333in"}

**Q18: Write a Query to find the total number of planes of each plane
type.**

SELECT Pmodel, COUNT(\*) AS TotalPlanes FROM AIRPLANE

GROUP BY Pmodel;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image17.png){width="1.4474114173228347in"
height="1.6833333333333333in"}

**Q19: Write a Query to find the total number of services performed on
each plane.**

SELECT Reg_No, COUNT(\*) AS TotalServices

FROM PLANE_SERVICE GROUP BY Reg_No;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image18.png){width="1.45in"
height="2.0059284776902886in"}

**Q20: Write a Query to find the average salary of employees in each
shift.**

SELECT Eshift, AVG(Esalary) AS Average_Salary_By_Shifts FROM EMPLOYEE

GROUP BY Eshift;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image19.png){width="1.8256244531933508in"
height="1.0583333333333333in"}

**Q21: Write a Query to find the total number of planes each owner
owns.**

SELECT O.Oname, COUNT(\*) AS TotalPlanes FROM OWNER O

JOIN OWNS ON O.Ossn = OWNS.ssn

JOIN AIRPLANE A ON OWNS.Reg_No = A.Reg_No

GROUP BY O.Oname;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image20.png){width="1.4146073928258969in"
height="1.9583333333333333in"}

**Q22: Write a Query to find the number of planes each pilot is
authorized to fly.**

SELECT P.Pname, COUNT(\*) AS TotalPlanes FROM PILOT P

JOIN FLIES F ON P.Plic_num = F.lic_num

GROUP BY P.Pname;

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image21.png){width="1.6in"
height="1.6907797462817147in"}

**Q23: Write 4 Queries Other than this and write their Importance in the
Comments why do you think they are important and where can they be
used.**

\--Query to find the average weight of planes in each hangar:

SELECT H.PHanger, AVG(PT.Pweight) AS AvgWeight

FROM HANGAR H

JOIN AIRPLANE A ON H.PHanger = A.PHanger

JOIN PLANE_TYPE PT ON A.Pmodel = PT.Pmodel

GROUP BY H.PHanger;

/\*This query can be important for hangar managers to track the weight
of the planes in their hangar. It can also be useful for airlines to
ensure that their planes are stored in a hangar that can handle their
weight.\*/

\-- Query to find the total number of planes of each plane type
currently in service

SELECT A.Pmodel, COUNT(\*) AS TotalPlanes

FROM AIRPLANE A

WHERE A.Pstatus = \'Available\'

GROUP BY A.Pmodel;

/\*This query can be important for airline operations managers to track
the number of planes of each type currently in service. It can also be
useful for maintenance teams to plan for maintenance and repair work on
specific plane types.\*/

\-- Query to find the name and total salary of the highest paid
employee:

SELECT E.Ename, E.Esalary

FROM EMPLOYEE E

ORDER BY E.Esalary DESC;

/\*This query can be important for HR departments to track the highest
paid employee and their salary. It can also be useful for management to
ensure that the highest paid employee is being utilized effectively
within the organization.\*/

\-- Query to find the total number of airplanes in each hangar, along
with their capacity:

SELECT H.PHanger, H.Hcapacity, COUNT(\*) AS TotalPlanes

FROM HANGAR H

JOIN AIRPLANE A ON H.PHanger = A.PHanger

GROUP BY H.PHanger, H.Hcapacity;

/\*This query is important to keep track of the number of planes stored
in each hangar and to ensure that the hangar capacity is not exceeded.
It can be used by airport authorities and maintenance personnel to
monitor the hangar capacity and ensure proper utilization of available
space.\*/

**Output:**

![](vertopal_e0c8aeb7e96f4c7d9bf55080a4832e16/media/image22.png){width="4.021019247594051in"
height="4.058333333333334in"}
