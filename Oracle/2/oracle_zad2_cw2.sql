--1
define a = 8;
define b = 2;
define c = - 3;

SELECT (-&&b - sqrt( power( &&b, 2 ) - 4 * &&a * &&c ) ) / ( 2 * &&a ) "x1",
    (-&&b + sqrt( power( &&b, 2 ) - 4 * &&a * &&c ) ) / ( 2 * &&a ) "x2"
    FROM dual;
    
--2
SELECT 
REVERSE(email) "email_code",
CONCAT(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(first_name),'a','1'),'e','2'),'i','3'),'o','4'),'u','5'),'y','6'),
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(last_name),'a','1'),'e','2'),'i','3'),'o','4'),'u','5'),'y','6')
) "code"
FROM employees;

--3
SELECT COUNT( DISTINCT state_province ) "Liczba prowincji" FROM locations;
SELECT COUNT( nvl( state_province, '1' ) ) "Liczba lokalizacji" FROM locations;

--4
SELECT nullif( max_salary - min_salary, 0) "Roznica", job_title "Stanowisko"
FROM jobs
ORDER BY nullif( max_salary - min_salary, 0) ASC
FETCH FIRST 2 ROWS ONLY;

--5
WITH average_employees_number(avg_employee) AS 
(SELECT AVG(avg_count)
 FROM 
    (SELECT COUNT(department_id) AS avg_count
     FROM employees
     GROUP BY department_id) average)
SELECT department_name
FROM departments, average_employees_number average
WHERE
    (SELECT COUNT(department_id)
     FROM employees
     WHERE employees.department_id = departments.department_id) > average.avg_employee;
     
--6
SELECT E.FIRST_NAME AS FIRST_NAME, E.LAST_NAME AS LAST_NAME, J.JOB_TITLE, 'ACTUAL' AS STATE
FROM EMPLOYEES   E
JOIN JOBS J
ON E.JOB_ID = J.JOB_ID UNION ALL
    SELECT E1.FIRST_NAME AS FIRST_NAME, E1.LAST_NAME  AS LAST_NAME, J1.JOB_TITLE, 'ARCHIVE' AS STATE
    FROM EMPLOYEES   E1
    JOIN JOB_HISTORY JH ON E1.EMPLOYEE_ID = JH.EMPLOYEE_ID 
    JOIN JOBS J1 ON JH.JOB_ID = J1.JOB_ID
    WHERE JH.JOB_ID != E1.JOB_ID
    ORDER BY LAST_NAME, FIRST_NAME;

--7
SELECT city 
FROM locations 
JOIN departments ON locations.location_id = departments.location_id
WHERE departments.manager_id IS NOT NULL INTERSECT
    SELECT city
    FROM locations
    JOIN countries ON locations.country_id = countries.country_id
    WHERE countries.country_name = 'United States of America';

--8
SELECT department_name
FROM departments MINUS
    SELECT department_name
    FROM departments
    RIGHT OUTER JOIN employees
    ON departments.department_id = employees.department_id;

--9
WITH MNGR ( EMPLOYEE_LEVEL, EMPLOYEE_ID, FIRST_NAME, LAST_NAME ) AS (
  SELECT COUNT(e.EMPLOYEE_ID) - 1, e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME
  FROM EMPLOYEES e
  WHERE e.FIRST_NAME = 'Neena' AND e.LAST_NAME = 'Kochhar'
  GROUP BY e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME UNION ALL
    SELECT  MNGR.EMPLOYEE_LEVEL - 1, e1.EMPLOYEE_ID, e1.FIRST_NAME, e1.LAST_NAME
    FROM EMPLOYEES e1, MNGR
    WHERE e1.MANAGER_ID = MNGR.EMPLOYEE_ID )
SELECT EMPLOYEE_LEVEL, FIRST_NAME, LAST_NAME
FROM MNGR
WHERE FIRST_NAME != 'Neena' AND LAST_NAME != 'Kochhar';

