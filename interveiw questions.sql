CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;
SET autocommit = 1;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(60) NOT NULL,
    department VARCHAR(30) NOT NULL,
    city VARCHAR(40),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    employment_status ENUM('Active', 'Inactive') DEFAULT 'Active',
    phone VARCHAR(15) UNIQUE
) ENGINE = InnoDB;
INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
    (2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
    (3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
    (4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
    (5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
    (6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
    (7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
    (8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
    (9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
    (10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
    select * from employees;
insert into empployees values
(11, 'Karan Malhotra', 'IT', 'Noida', 41000.00, 'Active', '9000000011');
insert into employees
(employee_id, employee_name, department, city, salary, employment_status, phone)
values
(12, 'Simran Kaur', 'HR', 'Delhi', 35000.00, 'Active', '9000000012'),
(13, 'Rohan Das', 'Sales', 'Pune', 33000.00, 'Inactive', '9000000013');
update employees set city = 'Gurgaon', salary = 46000.00 where  employee_id = 11;
update employees set salary = salary * 1.10 where employee_id IN (1, 4, 7);  
delete from employees where employee_id in (3, 8, 13);
alter table employees add email varchar(100) null;
select * from employees;
alter table employees modify phone varchar(20) null;
alter table employees RENAME COLUMN city to work_city;
alter table employees drop COLUMN email;
rename table employees to staff;
START TRANSACTION;
insert into  staff
(employee_id, employee_name, department, work_city, salary, employment_status, phone)
values
(14, 'Nisha Rao', 'IT', 'Noida', 44000.00, 'Active', '9000000014');
update staff set salary = 45000.00 where employee_id = 2;
COMMIT;
ROLLBACK;

START TRANSACTION;
update staff set salary = 60000.00 where employee_id = 5;
DELETE FROM staff where employee_id = 6;
ROLLBACK;

START TRANSACTION;
update staff set salary = 47000.00 where employee_id = 14;
SAVEPOINT salary_saved;
update staff set work_city = 'Jaipur' where employee_id = 14;
SAVEPOINT city_saved;
delete from staff where employee_id = 14;
ROLLBACK TO city_saved;
ROLLBACK TO salary_saved;
COMMIT;

START TRANSACTION;
TRUNCATE TABLE staff;
ROLLBACK;

DROP TABLE staff;
DROP DATABASE interview_commands_practice;
