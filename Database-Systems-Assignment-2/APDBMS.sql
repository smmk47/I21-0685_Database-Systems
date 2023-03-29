create database  airportdbms;
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
    Hcapacity  numeric(4),
    Hlocation varchar(255),
);

CREATE TABLE Corporation (
    Cssn  numeric(4) not null,
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
    Ossn  numeric(4) not null,
    Oname varchar(255),
    OAddress varchar(255),
    OPhone varchar(11)
);
CREATE TABLE OWNS (
    Reg_No numeric(4) not null,
    ssn   numeric(4) not null,
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
       Essn   numeric(4),
	   model varchar(5),
	   Plan_regno numeric(4),
);


INSERT INTO AIRPLANE (Reg_No, Pstatus,Pmodel, PHanger)
VALUES
(1001,'available', 'A320', 'H001'),
(1002,'maintenance', 'B737', 'H002'),
(1003,'available', 'A330', 'H003'),
(1004,'available', 'B777', 'H004'),
(1005,'available', 'A380', 'H005'),
(1006,'available', 'B747', 'H006'),
(1007,'available', 'A350', 'H001'),
(1008,'available', 'B787', 'H005'),
(1009,'available', 'A321', 'H004'),
(1010,'available', 'B737', 'H003'),
(1011,'available', 'A320', 'H001'),
(1012,'available', 'B737', 'H002'),
(1013,'available', 'A380', 'H001'),
(1014,'maintenance', 'B747', 'H002'),
(1015,'available', 'A320', 'H003'),
(1016,'maintenance', 'B737', 'H004'),
(1017,'available', 'A380', 'H003'),
(1018,'available', 'B747', 'H004'),
(1019,'available', 'A320', 'H005'),
(1020,'available', 'A320', 'H003'),
(1021,'available', 'B737', 'H004'),
(1022,'available', 'A380', 'H003'),
(1023,'available', 'B747', 'H004'),
(1024,'available', 'A320', 'H005'),
(1025,'available', 'B737', 'H006');  

INSERT INTO HANGAR (PHanger, Hcapacity, Hlocation) VALUES
('H001', 5, 'Moscow'),
('H002', 4, 'Los Angeles'),
('H003', 6, 'Dubai'),
('H004', 3, 'Ankara'),
('H005', 7, 'Tokyo'),
('H006', 2, 'London');

INSERT INTO PLANE_TYPE (Pmodel, Pcapacity, Pweight)
VALUES
('A320', 180, 3400),
('B737', 215, 9060),
('A330', 335, 2000),
('B777', 396, 7100),
('A380', 853, 5000),
('B747', 660, 6890),
('A350', 440, 8000),
('B787', 290, 7930),
('A321', 220, 3500),
('B737', 189, 9060);


INSERT INTO OWNER (Ossn, Oname, OAddress, OPhone) VALUES
(3001, 'John Smith', 'London', '555-1234'),
(3002, 'Jane Doe', 'London', '555-5678'),
(3003, 'Bob Johnson', 'Tokyo', '555-9012'),
(3004, 'Mary Brown', '234 Maple Dr, Anytown, USA', '555-3456'),
(3005, 'David Lee', 'Tokyo', '555-7890'),
(3006, 'Susan Green', 'Tokyo', '555-2345'),
(3007, 'Michael White', '1234 Birch Blvd, Anytown, USA', '555-6789'),
(3008, 'Karen Black', 'Moscow', '555-4321'),
(3009, 'Chris Davis', 'Moscow', '555-8765'),
(3010, 'Lisa Gray', '3456 Elmwood Dr, Anytown, USA', '555-2109'),
(3011, 'Steven Brown', 'London', '555-5432'),
(3012, 'Nancy Lee', 'Tokyo', '555-9876'),
(3013, 'Mark Johnson', 'Moscow', '555-3210'),
(3014, 'Amy Green', '4321 Pine St, Anytown, USA', '555-7654'),
(3015, 'Peter White', 'London', '555-1098'),
(4001, 'Acme Corp', '123 Main St, Anytown, USA', '555-1234'),
(4002, 'Widget Inc', '456 Oak Ave, Anytown, USA', '555-5678'),
(4003, 'Global Enterprises', '567 Pine Rd, Anytown, USA', '555-7890'),
(4004, 'United Corp', 'Tokyo', '555-2345'),
(4005, 'Star Corp', 'Tokyo', '555-6789');

INSERT INTO PERSON (Pssn, Pname, Paddress, Pphone) VALUES
(3001, 'John Smith', '123 Main St, Anytown, USA', '555-1234'),
(3002, 'Jane Doe', '456 Oak Ave, Anytown, USA', '555-5678'),
(3003, 'Bob Johnson', '789 Elm St, Anytown, USA', '555-9012'),
(3004, 'Mary Brown', '234 Maple Dr, Anytown, USA', '555-3456'),
(3005, 'David Lee', '567 Pine Rd, Anytown, USA', '555-7890'),
(3006, 'Susan Green', '890 Cedar Ave, Anytown, USA', '555-2345'),
(3007, 'Michael White', '1234 Birch Blvd, Anytown, USA', '555-6789'),
(3008, 'Karen Black', '5678 Oakwood Ln, Anytown, USA', '555-4321'),
(3009, 'Chris Davis', '9012 Pinecrest Rd, Anytown, USA', '555-8765'),
(3010, 'Lisa Gray', '3456 Elmwood Dr, Anytown, USA', '555-2109'),
(3011, 'Steven Brown', '7890 Cedarwood Ave, Anytown, USA', '555-5432'),
(3012, 'Nancy Lee', '2345 Maplewood Ln, Anytown, USA', '555-9876'),
(3013, 'Mark Johnson', '6789 Birchwood Rd, Anytown, USA', '555-3210'),
(3014, 'Amy Green', '4321 Pine St, Anytown, USA', '555-7654'),
(3015, 'Peter White', '8765 Oak Rd, Anytown, USA', '555-1098');

INSERT INTO Corporation (Cssn, Corp_Name, Csddress, Cphone) VALUES
(4001, 'Acme Corp', '123 Main St, Anytown, USA', '555-1234'),
(4002, 'Widget Inc', '456 Oak Ave, Anytown, USA', '555-5678'),
(4003, 'Global Enterprises', '567 Pine Rd, Anytown, USA', '555-7890'),
(4004, 'United Corp', '890 Cedar Ave, Anytown, USA', '555-2345'),
(4005, 'Star Corp', '1234 Birch Blvd, Anytown, USA', '555-6789');

INSERT INTO SERVICE (Sworkcode, Shours, Sid) 
VALUES 
    ('SC01',  10, 101),
    ('SC02',  5, 102),
    ('SC03',  7, 103),
    ('SC04',  9, 104),
    ('SC05',  3, 105),
    ('SC06',  8, 106),
    ('SC07',  6, 107),
    ('SC08',  4, 108),
    ('SC09',  2, 109),
    ('SC10',  1, 110);


INSERT INTO PLANE_SERVICE (Reg_No, Service_id, PSdate) 
VALUES 
    (1001, 101, '2023-03-19'),
    (1005, 102, '2023-03-18'),
    (1004, 103, '2023-02-11'),
    (1006, 104, '2023-01-12'),
    (1007, 105, '2022-03-01'),
    (1008, 106, '2022-07-01'),
    (1009, 107, '2022-12-02'),
    (1010, 108, '2023-01-05'),
    (1011, 109, '2023-03-12'),
    (1002, 110, '2020-03-11'),
    (1006, 101, '2023-03-13'),
    (1003, 102, '2023-01-09'),
    (1018, 103, '2023-02-04'),
    (1001, 104, '2023-01-13'),
    (1007, 105, '2022-03-23'),
    (1012, 106, '2022-07-21'),
    (1011, 107, '2022-12-12'),
    (1004, 108, '2023-01-05'),
    (1007, 109, '2023-02-11'),
    (1006, 110, '2020-01-15');

INSERT INTO OWNS (Reg_No, ssn, Pdate) VALUES 
  (1001, 3001, '2023-03-01'),
  (1002, 3002, '2023-03-02'),
  (1003, 3003, '2022-01-03'),
  (1004, 3004, '2022-01-04'),
  (1005, 3005, '2022-01-05'),
  (1006, 3006, '2022-01-06'),
  (1007, 3007, '2023-03-07'),
  (1008, 3008, '2023-02-08'),
  (1009, 3009, '2023-03-09'),
  (1010, 3010, '2022-01-10'),
  (1011, 3011, '2023-03-01'),
  (1012, 3012, '2023-03-02'),
  (1013, 3013, '2022-01-03'),
  (1014, 3014, '2022-01-04'),
  (1015, 3015, '2022-01-05'),
  (1016, 4005, '2022-01-06'),
  (1017, 4005, '2023-03-07'),
  (1018, 4001, '2023-02-08'),
  (1019, 4005, '2023-03-09'),
  (1020, 4005, '2022-01-10'),
  (1021, 3001, '2022-01-06'),
  (1022, 3006, '2023-03-07'),
  (1023, 4003, '2023-02-08'),
  (1024, 4005, '2023-03-09'),
  (1025, 4002, '2022-01-10');

INSERT INTO EMPLOYEE (Essn, Ename, Esalary, Eworkhour, Eshift) VALUES 
    (2001, 'John', 45000, 8, 'Morning'),
    (2002, 'Mary', 50000, 7, 'Evening'),
    (2003, 'David', 60000, 9, 'Morning'),
    (2004, 'Sarah', 55000, 8, 'Evening'),
    (2005, 'James', 65000, 7, 'Night'),
    (2006, 'Emily', 70000, 8, 'Morning'),
    (2007, 'Michael', 45000, 9, 'Night'),
    (2008, 'Jessica', 50000, 7, 'Night'),
    (2009, 'William', 60000, 8, 'Morning'),
    (2010, 'Ava', 55000, 7, 'Night');

INSERT INTO WORKS_ON (Essn, model ,Plan_regno ) VALUES 
    (2001, 'A320',1001),
    (2001, 'B737',1002),
    (2002, 'A320',1011),
    (2002, 'B787',1008),
    (2003, 'B737',1016),
    (2003, 'A330',1003),
    (2004, 'B747',1014),
    (2004, 'B737',1021),
    (2005, 'B787',1008),
    (2005, 'B737',1010),
    (2006, 'A330',1003),
    (2006, 'B747',1014),
    (2007, 'B737',1025),
	(2007, 'B787',1008),
    (2008, 'B737',1002),
    (2009, 'A330',1003),
    (2009, 'B747',1006),
    (2010, 'B737',1025),
	(2010, 'A320',1024),
    (2010, 'B747',1023);

INSERT INTO PILOT (Plic_num, PRestr, Pname, Pssn) VALUES 
    (1234567, 'R1', 'John Doe', 5111),
    (2345678, 'R1', 'Jane Smith', 5222),
    (3456789, 'R0', 'Bob Johnson', 5333),
    (4567890, 'R2', 'Alice Lee', 4444),
    (5678901, 'R3', 'David Kim', 5555),
    (6789012, 'R4', 'Karen Brown', 5666),
    (7890123, 'R6', 'Tom Wilson', 5777),
    (8901234, 'R7', 'Lisa Davis', 5888),
    (9012345, 'R4', 'Eric Chen', 5999),
    (1234598, 'R4', 'Samantha Jones', 5111);

INSERT INTO FLIES (lic_num, model) VALUES 
    (1234567, 'A320'),
    (2345678, 'B747'),
    (3456789, 'A320'),
    (4567890, 'B747'),
    (5678901, 'B747'),
    (6789012, 'A320'),
    (7890123, 'A320'),
    (8901234, 'B747'),
    (9012345, 'B737'),
    (1234598, 'B737'),
	(5678901, 'B747'),
    (6789012, 'A321'),
    (7890123, 'A380'),
    (8901234, 'B737'),
    (9012345, 'A380'),
    (1234598, 'B747');


