drop database EcommerceDB;
CREATE DATABASE EcommerceDB;

USE EcommerceDB;

-- table employee
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT
);

-- sample values
INSERT INTO Employees VALUES
(101, 'Anjali', 60000, 1),
(102, 'Rahul', 75000, 1),
(103, 'Sneha', 50000, 2),
(104, 'Amit', 40000, 2);

DELIMITER //

CREATE PROCEDURE IncreaseSalaryByDept(
    IN dept INT,
    IN increment DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET salary = salary + increment
    WHERE dept_id = dept;
END //

DELIMITER ;

CALL IncreaseSalaryByDept(1, 5000);

--  Get Total Salary for a Department
DELIMITER //

CREATE FUNCTION GetDeptTotalSalary(dept INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(salary) INTO total
    FROM Employees
    WHERE dept_id = dept;
    RETURN total;
END //

DELIMITER ;

SELECT GetDeptTotalSalary(1);
