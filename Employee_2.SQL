--1	Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
SELECT *
FROM [dbo].['Employee Info$']

SELECT UPPER(EmpFname) AS EmpName
	FROM [dbo].['Employee Info$']

--delete
--from [dbo].['Employee Info$']
--where EMPID IS NULL

--2	Write a query to fetch the number of employees working in the department ‘HR’.
SELECT COUNT(EmpID)
	FROM[dbo].['Employee Info$']
	WHERE Department = 'HR'

--3	Write a query to get the current date.
SELECT GETDATE()
SELECT CAST(GETDATE() AS Date)

--4	Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
SELECT LEFT(EmpLname,4) AS [First 4]
	FROM [dbo].['Employee Info$']

--5	Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT *
	,LEFT(Address, CHARINDEX('(',Address)-1) AS New_Add
	FROM[dbo].['Employee Info$']

SELECT Address
	,LEFT(Address, CHARINDEX('(',Address)-1) AS New_Add
	FROM[dbo].['Employee Info$']


--6	Write a query to create a new table that consists of data and structure copied from the other table.
SELECT I.*
	,P.[EmpPosition]
    ,P.[DateOfJoining]
    ,P.[Salary]
  INTO Full_Table
	FROM[dbo].['Employee Info$'] AS I
	JOIN[dbo].['Employee position$'] AS P
	ON I.EmpId = P.EmpID

Select *
	,CAST((DateOfJoining) AS Date) as DOJ
	From Full_Table


--7	Write a query to find all the employees whose salary is between 50000 to 100000.
SELECT *
	FROM [dbo].['Employee position$']
	WHERE Salary BETWEEN 50000 AND 100000

--8	Write a query to find the names of employees that begin with ‘S’
SELECT *
	FROM[dbo].['Employee Info$']
	WHERE EmpFname like 'S%'
	--OR EmpFname like 'A%' (To check for multiple criterias)

--9	Write a query to fetch top N records.
SELECT TOP(3) * 
from [dbo].['Employee position$']
--order by Salary DESC

--10	Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
SELECT *
,CONCAT(EmpFname,' ',EmpLname) as FullName
from[dbo].['Employee Info$']

--11	Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1995 and are grouped according to gender
--ALTER TABLE Full_Table
--	ALTER COLUMN DOB Date

--ALTER TABLE Full_Table
--	ALTER COLUMN DateOfJoining Date

--SELECT *
--	FROM Full_Table
--	WHERE DOB BETWEEN '1970-05-02' AND '1995-12-31'
--	ORDER BY Gender

SELECT Gender,
	COUNT(DOB) AS DOB_G
	FROM Full_Table
	WHERE DOB BETWEEN '1970-05-02' AND '1995-12-31'
	GROUP BY Gender
	
	
--12	Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
SELECT *
	FROM [dbo].['Employee Info$']
	ORDER BY [EmpLname] DESC, [Department];

--13	Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
SELECT *
	FROM ['Employee Info$']
	WHERE EmpLname LIKE '____A'

--14	Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
SELECT *
	FROM ['Employee Info$']
	WHERE (EmpFname != 'Sanjay') AND (EmpFname != 'Sonia')

--15	Write a query to fetch details of employees with the address as “DELHI(DEL)”
SELECT *
	FROM ['Employee Info$']
	WHERE Address = 'Delhi(DEL)'

--16	Write a query to fetch all employees who also hold the managerial position.
SELECT *
	FROM Full_Table
	WHERE EmpPosition = 'Manager'

--17	Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order
SELECT Department,
	COUNT(Department) AS DEPT_GRP
	FROM Full_Table
	GROUP BY Department


--18	Write a query to fecth Male employees in HR department
SELECT *
	FROM Full_Table
	WHERE (Gender='M') AND (Department = 'HR')
--19	Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table
--SELECT *
--	FROM ['Employee Info$']
--SELECT *
--	FROM ['Employee position$']

SELECT EI.*
,EP.DateOfJoining
from ['Employee Info$'] as EI
RIGHT JOIN ['Employee position$'] as EP
ON EI.EmpID = EP.EmpID
--where ep.DateOfJoining IS NOT NULL

--20	Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table  ,MIN(Salary)
--SELECT TOP(2) *
--	FROM ['Employee position$']
--	ORDER BY Salary

--SELECT TOP(2)*
--	FROM ['Employee position$']
--	ORDER BY Salary DESC


WITH CTE_Sal AS
			(SELECT *
					,RANK() OVER (ORDER BY Salary ASC) as Low_Sal
					,RANK() OVER (ORDER BY Salary DESC) as High_Sal
			FROM [dbo].['Employee position$']
			)
SELECT [EmpID]
      ,[EmpPosition]
      ,[DateOfJoining]
      ,[Salary]
FROM CTE_Sal
WHERE Low_Sal <=2
union
SELECT [EmpID]
      ,[EmpPosition]
	  ,[DateOfJoining]
	  ,[Salary]
FROM CTE_Sal
WHERE High_Sal <=2 
