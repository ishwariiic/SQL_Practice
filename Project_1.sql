
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE TIMESTAMP,
    DEPARTMENT CHAR(25)
);

-- Insert Data into Worker Table
INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES 
    (1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

-- Create Bonus Table
CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE TIMESTAMP,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

-- Insert Data into Bonus Table
INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) 
VALUES 
    (1, 5000, '2016-02-20'),
    (2, 3000, '2016-06-11'),
    (3, 4000, '2016-02-20'),
    (1, 4500, '2016-02-20'),
    (2, 3500, '2016-06-11');

-- Create Title Table
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM TIMESTAMP,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

-- Insert Data into Title Table
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) 
VALUES
    (1, 'Manager', '2016-02-20 00:00:00'),
    (2, 'Executive', '2016-06-11 00:00:00'),
    (8, 'Executive', '2016-06-11 00:00:00'),
    (5, 'Manager', '2016-06-11 00:00:00'),
    (4, 'Asst. Manager', '2016-06-11 00:00:00'),
    (7, 'Executive', '2016-06-11 00:00:00'),
    (6, 'Lead', '2016-06-11 00:00:00'),
    (3, 'Lead', '2016-06-11 00:00:00');

-- Verify Data
SELECT * FROM Worker;
SELECT * FROM Bonus;
SELECT * FROM Title;
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM WORKER;
-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM WORKER;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;
-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME,'B') FROM WORKER WHERE FIRST_NAME='Amitabh';
--Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT,LENGTH(DEPARTMENT) FROM WORKER;
-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER;
-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE FROM WORKER;
SELECT LAST_NAME FROM WORKER;
SELECT CONCAT(TRIM(first_name), ' ', TRIM(last_name)) AS COMPLETE_NAME FROM Worker;
--Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT *FROM WORKER ORDER BY FIRST_NAME;
--Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT*FROM WORKER ORDER BY FIRST_NAME, DEPARTMENT DESC;
-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT *FROM WORKER WHERE FIRST_NAME IN('VIPUL','SATISH');
select * from worker where first_name IN ('Vipul', 'Satish');
-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT *FROM WORKER WHERE FIRST_NAME NOT IN('Vipul','Satish');
-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
select *from worker where department='Admin';
-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’
select *from worker where first_name LIKE '%a%';
-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’
SELECT *FROM WORKER WHERE FIRST_NAME LIKE '%A';
SELECT * FROM Worker WHERE TRIM(first_name) LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select*from worker where trim(first_name) like '_____h';
-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select*from worker where salary between 100000 and 500000;
-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker 
WHERE EXTRACT(YEAR FROM joining_date) = 2014 
AND EXTRACT(MONTH FROM joining_date) = 2;
-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT DEPARTMENT,COUNT(*) FROM WORKER GROUP BY DEPARTMENT HAVING DEPARTMENT='Admin';
-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000
SELECT CONCAT(TRIM(FIRST_NAME),' ',TRIM(LAST_NAME)) FROM WORKER WHERE SALARY BETWEEN 50000 and 100000;
-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(*) AS TOTAL_EMPLOYEES 
FROM WORKER 
GROUP BY DEPARTMENT 
ORDER BY TOTAL_EMPLOYEES DESC;
-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select w.* from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager';
