--1
SELECT
    departments.department_name "NAZWA DEPARTAMENTU"
FROM
    departments 
JOIN locations
ON departments.location_id = locations.location_id
WHERE
    locations.city = 'Seattle'
ORDER BY 
    department_name DESC;

--2
SELECT
    jobs.job_title "NAZWA STANOWISKA"
FROM 
    jobs
JOIN employees
ON jobs.job_id = employees.job_id
HAVING
    COUNT(employees.employee_id) >= 5
    AND COUNT(employees.employee_id) <= 10
GROUP BY 
    jobs.job_title;

--3
SELECT
    departments.department_name "NAZWA DEPARTAMENTU",
    COUNT(employees.employee_id)
FROM 
    departments
JOIN employees 
ON departments.department_id = employees.department_id
HAVING
    COUNT(employees.employee_id) = 0
GROUP BY 
    departments.department_name;

--4 
SELECT
    employees.last_name "NAZWISKO",
    FLOOR(
        MONTHS_BETWEEN(CURRENT_DATE, employees.hire_date) / 12) "WORKING_YEARS"
FROM 
    employees
WHERE
    FLOOR(
        MONTHS_BETWEEN(CURRENT_DATE,employees.hire_date) / 12) <= 16;

--5
SELECT  
    employees.last_name "NAZWISKO"
FROM
    employees
JOIN departments 
ON employees.department_id = departments.department_id
JOIN locations
ON departments.location_id = locations.location_id
WHERE
    REGEXP_LIKE(
    LOWER(SUBSTR(locations.city, -2, 1)), '^[aeiou]');

----6
SELECT
    employees.first_name "IMIE",
    employees.last_name "NAZWISKO"
FROM
    employees
JOIN jobs
ON jobs.job_id = employees.job_id
WHERE 
    employees.hire_date = (SELECT
                                MIN(employees.hire_date)
                           FROM
                                employees
                           WHERE
                                employees.job_id = jobs.job_id);

--7
SELECT
    departments.department_name "Nazwa departamentu",
    employees.last_name "Nazwisko"
FROM 
    employees
JOIN departments
ON employees.department_id = departments.department_id
WHERE 
    employees.salary = (
        SELECT
            MIN(employees.salary)
        FROM 
            employees
        WHERE
            employees.department_id = departments.department_id
    );

--8
SELECT
    locations.city "MIASTO"
FROM
    locations
JOIN departments
ON locations.location_id = departments.location_id
HAVING
    COUNT(departments.location_id) >= ALL(
        SELECT
            COUNT(departments.location_id)
        FROM
            departments
        JOIN locations 
        ON departments.location_id = locations.location_id
        GROUP BY
            departments.location_id)
GROUP BY
    city;

--9
SELECT
    employees_1.first_name "IMIE",
    employees_1.last_name "NAZWISKO"
FROM 
    employees EMPLOYEES_1
JOIN employees EMPLOYEES_2 
ON employees_2.employee_id = employees_1.manager_id
WHERE
    employees_2.manager_id IS NULL;
    
    
    
    
    
    