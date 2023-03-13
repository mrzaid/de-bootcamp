with average_salary() as
    (select avg(salary) from employee)



-- CREATE VIEW v_employee_information as
-- SELECT first_name,email,e.department,salary,division,region,country
-- FROM employees e , departments d, regions r
-- WHERE e.department=d.department
-- AND e.region_id=r.region_id
-- //query saved in a table cant change and insert

get domains
-- SELECT  substring(email,POSITION ('@' IN email) +1) as email_domain , count(*)
-- FROM employees
-- WHERE email IS NOT NULL
-- GROUP BY substring(email,POSITION ('@' IN email) +1)  
DOMAIN PORTION WALOUN KO GROUP KAREIGA
SELECT MEIN WOH COLUMNS JO AGGREGATE NA HOUN 
THEY ARE SUPPOSED TO BE IN GROUP BY

SELECT gender,region_id ,max(salary),min(salary),round(avg(salary))
FROM employees
GROUP BY gender,region_id
ORDER BY gender desc,region_id asc

            SUBQUERIES 
--  SELECT a.employee_name, yearly_salary
--  FROM (SELECT first_name employee_name,salary yearly_salary
--  		FROM employees WHERE salary >150000) a,
-- 		(SELECT department employee_name FROM departments)b

--  SELECT * 
--  FROM employees
--  WHERE department IN (
--  	SELECT department FROM departments
--  )

those employees who works in Electronics division
--  SELECT *
-- FROM employees
-- WHERE department 
-- 	IN (SELECT department 
-- 		FROM departments
-- 		WHERE division='Electronics')
those employes salary greater than 150000 and region asia canada
-- SELECT * 
-- FROM employees
-- WHERE salary>130000 
-- AND region_id IN
-- (
-- 	SELECT region_id
-- 	FROM regions
-- 	 WHERE (country='Asia' OR country='Canada')
        -- WHERE country IN ('Asia' ,'Canada')
-- )
those employees how much less than max yearly_salary
-- SELECT first_name, department, (SELECT max(salary) FROM employees  )-salary as how_much
-- FROM employees
-- WHERE region_id IN
-- (
-- 	SELECT region_id
-- 	FROM regions
-- 	 WHERE (country='Asia' OR country='Canada')
--        )

 SUBQUERIES  with ALL ANY

--  SELECT * 
-- FROM employees 
-- WHERE region_id IN(SELECT region_id FROM regions WHERE country ='United States')

-- SELECT * 
-- FROM employees 
-- WHERE region_id > ALL (SELECT region_id FROM regions WHERE country ='United States')

EXCLUDING MAX MIN SALARIES
-- SELECT ROUND(AVG(salary)) 
-- from employees
-- WHERE salary NOT IN (
-- (SELECT MIN(salary) FROM employees),
-- (SELECT MAX(salary) FROM employees)
-- )

conditional expressions

-- SELECT first_name,salary,
-- CASE 
-- 	WHEN salary< 100000 THEN 'UNDER PAID'
-- 	WHEN salary> 100000 THEN 'PAID WELL'
-- 	ELSE 'UNPAID'
-- END as category
-- FROM employees
-- order by salary desc

no of employees

-- SELECT a.category,count(*) FROM (SELECT first_name,salary,
-- CASE 
-- 	WHEN salary< 100000 THEN 'UNDER PAID'
-- 	WHEN salary> 100000 AND salary < 160000 THEN 'PAID WELL'
-- 	WHEN salary> 160000 THEN 'EXECUTIVE'
-- 	ELSE 'UNPAID'
-- END as category
-- FROM employees
-- order by salary desc) a
-- Group by a.category


-- SELECT SUM(CASE WHEN salary< 100000 THEN 1 ELSE 0 END) as under_paid,
-- SUM(CASE WHEN salary> 100000 THEN 1 ELSE 0 END) as paid_well,
-- SUM(CASE WHEN salary> 150000 THEN 1 ELSE 0 END) as executive
-- FROM employees

SELECT first_name,salary,department ,
CASE WHEN salary=max_by_department THEN 'HIGHEST SALARY'
	WHEN salary=mIN_by_department THEN 'LOWEST SALARY'
END as salary_in_department
FROM(
SELECT first_name,salary,department,
	(SELECT max(salary) FROM employees e2
 	WHERE e1.department=e2.department) as max_by_department,
	(SELECT min(salary) FROM employees e2
 	WHERE e1.department=e2.department) as min_by_department
FROM employees e1
ORDER BY department) a
WHERE salary= max_by_department
OR salary = min_by_department


SELECT first_name,department,hire_date,country
from employees e 
JOIN regions r
	on e.region_id=r.region_id
WHERE hire_date=(SELECT min(hire_date)FROM employees e2)


