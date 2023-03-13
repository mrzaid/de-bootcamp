-- calculate 2nd max salary

SELECT MAX(salary)
FROM Employees
WHERE salary<(SELECT MAX(salary)
FROM Employees )


-- calculate nth salary
SELECT TOP 1 SALARY FROM
(
    SELECT DISTINCT TOP 2 SALARY
    from employees
    ORDER BY SALARY DESC
)
result
order by salary;
-- using cte and window functions
with max_salary_table(salary,denserank)
AS(
SELECT salary,
DENSE_RANK() OVER(ORDER BY salary DESC) as denserank
FROM Employees
)
SELECT DISTINCT salary
from max_salary_table
WHERE denserank=2

-- delete duplicate rows
with cte as(
select *, 
row_number() over(partition by id order by id) as rownumber
from employees
)
delete from cte WHERE rownumber>1
-- PIVOT IN SQL
SELECT country, city1, city2,city3
FROM(
SELECT country,city,
'City' + CAST(row_number() over(partition by country order by country ) AS VARCHAR(10)) AS SEQ
from Countries
)
temp
PIVOT
(
MAX(city)
FOR SEQ in (city1,city2,city3)
)PIV
( 
   AggregateFunction(ColumnToBeAggregated)
   FOR PivotColumn IN (PivotColumnValues)
 )
-- join 3 tables
SELECT EmployeeName,DepartName,Gender
FROM EMPLOYEES
JOIN DEPARTMENT
    ON EMPLOYEES.departmentid=DEPARTMENT.departmentid
JOIN Genders
    ON EMPLOYEES.genderid=Genders.genderid    




    SELECT dbo.UDF_EXTRACTNumbers(IDname) as ID,
		dbo.UDF_ExtractAlphabets(IDname) AS Name
FROM TestTable        
CREATE function UDF_ExtractNumbers
(
@input varchar(255)
)
Returns varchar(255)
AS
BEGIN
	DECLARE @alphabetIndex int =Patindex('%[^0-9]%',@input)
	BEGIN 
    	WHILE @alphabetIndex >0
        BEGIN 
        	SET @input=Stuff(@input,@alphabetIndex,1,'') 
            SET @input=Stuff(@input,@alphabetIndex,1,'') 
		END
    END
    Return @input
END

        
SELECT Patindex('%[^0-9]%','1223')
SELECT Stuff('1b2c3',2,1,'')


CREATE function UDF_ExtractAlphabets
(
@input varchar(255)
)
Returns varchar(255)
AS
BEGIN
	DECLARE @alphabetIndex int =Patindex('%[^a-zA-Z]%',@input)
	BEGIN 
    	WHILE @alphabetIndex >0
        BEGIN 
        	SET @input=Stuff(@input,@alphabetIndex,1,'') 
            SET @input=Stuff(@input,@alphabetIndex,1,'') 
		END
    END
    Return @input
END


select name,dateofbirth,CAST(dateofbirth as date)as col
from employees
WHERE CAST(dateofbirth as date) ='2017-10-09'