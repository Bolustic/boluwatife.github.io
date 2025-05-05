---
--Employee Queries --
--Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.-
select *
from Employee_Details$
where ManagerId = '986'

--Write an SQL query to fetch the different projects available from the EmployeeSalary table.
select Project
from Employee_Salary$
group by Project

--Write an SQL query to fetch the count of employees working in project ‘P1’.

select count(EmpID)
from Employee_Salary$
WHERE Project = 'P1'

--Write an SQL query to find the maximum, minimum, and average salary of the employees.
select MAX(Salary)
from Employee_Salary$

select MIN(Salary)
from Employee_Salary$

select AVG(Salary)
from Employee_Salary$

--Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
select EmpId
from Employee_Salary$
where Salary between 9000 and 15000


--Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
select *
from Employee_Details$
Where City = 'Toronto' and ManagerId = 321

--Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
select *
from Employee_Details$
where City = 'California' or ManagerId = 321

--Write an SQL query to fetch all those employees who work on Projects other than P1.
select * 
from Employee_Salary$
where Project !='P1'

--Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
select *
from Employee_Salary$


alter table [dbo].[Employee_Salary$]
add SalaryVar int

update Employee_Salary$
set SalaryVar = Salary + Variable

--Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
select *
from Employee_Details$
where FullName like '__hn%'

--Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
SELECT EmpId
FROM [dbo].[Employee_Details$]
UNION
SELECT EmpId
FROM [dbo].[Employee_Salary$]

