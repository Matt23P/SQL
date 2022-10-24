Set serveroutput on;

--1
BEGIN
    dbms_output.put_line('Hello world');
END;

--2
DECLARE
    a INTEGER NOT NULL := 5;
    sa INTEGER NOT NULL := a * a * 6;
BEGIN
    dbms_output.put_line('Pole szescianu o boku ' || a || ' = ' || sa );
END;

--3
DECLARE username VARCHAR2(20) := 'Mateusz';
        today TIMESTAMP DEFAULT SYSDATE;
        midnight TIMESTAMP := TRUNC(SYSDATE) + INTERVAL '24' HOUR;
BEGIN
    dbms_output.put_line('Witaj ' || username || '!');
    dbms_output.put_line('Aktualny czas: ' || TO_CHAR(CAST(today AS DATE), 'hh24:mi'));
    dbms_output.put_line('Minuty do polnocy: ' || (60 * EXTRACT(HOUR FROM (midnight - today)) + EXTRACT(MINUTE FROM (midnight - today))));
END;

--4
DECLARE
    this_department_name VARCHAR(25) := 'Human Resources';
    city_info locations.city%TYPE;
    number_info employees.phone_number%TYPE;
BEGIN
    SELECT locations.city
    INTO city_info
    FROM locations
    JOIN departments ON departments.location_id = locations.location_id
    WHERE departments.department_name = this_department_name
    GROUP BY locations.city;
    
    SELECT employees.phone_number
    INTO number_info
    FROM employees
    JOIN departments ON employees.department_id = departments.department_id
    WHERE departments.department_name = this_department_name
    GROUP BY employees.phone_number;
    
    dbms_output.put_line('Department: '||this_department_name);
    dbms_output.put_line('CITY: '||city_info);
    dbms_output.put_line('PHONE NB: '||number_info);
END;

--5
DECLARE 
--        this_city VARCHAR2(25) := 'Tokyo';
        this_city VARCHAR2(25) := 'London';
        CURSOR loc_cursor IS
            SELECT location_id, street_address, postal_code, city, state_province, country_id FROM locations
            WHERE city = this_city;
            loc_record loc_cursor%ROWTYPE;
BEGIN
        OPEN loc_cursor;
        LOOP
            FETCH loc_cursor INTO loc_record;
            EXIT WHEN loc_cursor%NOTFOUND;
        END LOOP;
        CLOSE loc_cursor;
        dbms_output.put_line('ID ' || loc_record.location_id);
        dbms_output.put_line('Add ' || loc_record.street_address);
        dbms_output.put_line('Code ' || loc_record.postal_code);
        dbms_output.put_line('City ' || loc_record.city);
        dbms_output.put_line('Province ' || loc_record.state_province);
        dbms_output.put_line('Country ID ' || loc_record.country_id);
END;
    
--6
DECLARE 
        random_int INTEGER;
        info VARCHAR2(30);
BEGIN
        SELECT dbms_random.value(100, 1000) INTO random_int FROM dual;
        CASE MOD(random_int, 2)
            WHEN 0 THEN info := 'Jest to liczba parzysta!';
            WHEN 1 THEN info := 'Jest to liczba nieparzysta!';
        END CASE;
        dbms_output.put_line('Wylosowano: '||random_int||'. '||info);
END;

--7
SELECT departments.department_name,
CASE
    WHEN departments.manager_id IS NULL THEN 'Brak menadzera'
    WHEN departments.manager_id = (
        SELECT employees.employee_id FROM employees
        JOIN jobs ON jobs.job_id = employees.job_id
        WHERE jobs.job_title = 'President') THEN 'Prezes firmy'
    ELSE 'Menadzer'
END AS manager_info
FROM departments;

--8
SELECT employees.salary, employees.last_name,
       departments.department_name, employees.first_name
FROM employees
JOIN departments ON departments.department_id = employees.department_id
WHERE employees.salary >= CASE departments.department_name
    WHEN 'Sales' THEN 10000
    WHEN 'Executive' THEN 20000
    WHEN 'Finance' THEN 10000
    ELSE 5000
END;

--9
DECLARE
        aaa VARCHAR2(50) := 'przykladowy tekst testowy';
        flag VARCHAR2(1) := SUBSTR(LOWER(aaa), 2, 1);
BEGIN
    IF flag BETWEEN 'a' AND 'z' THEN dbms_output.put_line('Drugi znak tekstu to litera.');
    ELSIF flag BETWEEN '0' AND '9' THEN dbms_output.put_line('Drugi znak tekstu to cyfra.');
    ELSE dbms_output.put_line('Drugi znak tekstu to nie cyfra ani litera.');
    END IF;
END;

--10
DECLARE
    dept_name_sum departments.department_name%TYPE := 'Programmer';
    dept_name_minmax departments.department_name%TYPE := 'President';
    salary_sum INTEGER;
    minmax_salary_min INTEGER;
    minmax_salary_max INTEGER;
BEGIN
    SELECT SUM(employees.salary)
    INTO salary_sum
    FROM employees
    JOIN jobs ON jobs.job_id = employees.job_id
    WHERE jobs.job_title = dept_name_sum;

    SELECT jobs.min_salary
    INTO minmax_salary_min
    FROM jobs
    WHERE jobs.job_title = dept_name_minmax;

    SELECT jobs.max_salary
    INTO minmax_salary_max
    FROM jobs
    WHERE jobs.job_title = dept_name_minmax;

    IF salary_sum >= minmax_salary_min AND salary_sum <= minmax_salary_max
        THEN dbms_output.put_line('Suma wynagrodzen pracownikow na stanowisku ' || dept_name_sum ||
            ' miesci sie w przedziale minimalnego i maksymalnego wynagrodzenia dla stanowiska ' ||
            dept_name_minmax || '.' );
    END IF;
END;

--12
DECLARE
    dname DEPARTMENTS.department_name%type;
    i INTEGER := 10;
BEGIN
    WHILE i <= 100 LOOP
        SELECT departments.department_name
        INTO dname
        FROM departments
        where departments.department_id = i;
        dbms_output.put_line(dname);
        i := i + 10;
    END LOOP;
END;

--13
DECLARE
    firstname employees.first_name%type;
    surname employees.last_name%type;
    i INTEGER := 150;
    years_hired INTEGER;
BEGIN
    WHILE i <= 160 LOOP
        SELECT first_name
        INTO firstname 
        FROM employees 
        WHERE employee_id = i;
        
        SELECT last_name
        INTO surname 
        FROM employees
        WHERE employee_id = i;

        SELECT TRUNC(months_between(CURRENT_DATE, hire_date)/12)
        INTO years_hired
        FROM employees
        WHERE employee_id = i;

        dbms_output.put(firstname||' '||surname||' ');
        FOR YEAR IN 1 .. years_hired LOOP
            dbms_output.put('*');
        END LOOP;
        dbms_output.new_line();
        i := i + 1;
    END LOOP;
END;

--14
DECLARE amount_e INTEGER;
BEGIN
    FOR i IN (SELECT * FROM departments)
    LOOP
        SELECT COUNT(employees.employee_id)
        INTO amount_e
        FROM employees
        JOIN departments ON departments.department_id = employees.department_id
        WHERE employees.department_id = i.department_id;
        dbms_output.put_line(i.department_name||': '||amount_e||' employees');
    END LOOP;
END;

--15
DECLARE
    city_employee LOCATIONS.city%type;
    city locations.city%type := 'South San Francisco';
    i INTEGER := 1;
BEGIN
    dbms_output.put_line('Miasto: ' || city);
    FOR prac IN (SELECT * FROM EMPLOYEES) 
    LOOP
        IF prac.DEPARTMENT_ID IS NULL THEN CONTINUE;
        END IF;

        SELECT locations.city
        INTO city_employee
        FROM locations 
        JOIN departments ON locations.location_id = departments.location_id
        JOIN employees ON departments.department_id = employees.department_id
        WHERE employees.employee_id = prac.employee_id;

        IF city_employee = city THEN dbms_output.put_line(i || '. ' 
                                     || prac.first_name
                                     || ' ' || prac.last_name);
            i := i + 1;
        END IF;
    END LOOP;
END;

--16
DECLARE 
--        this_city VARCHAR2(25) := 'Tokyo';
        this_city VARCHAR2(25) := 'London';
        CURSOR loc_cursor IS
            SELECT location_id, street_address, postal_code, city, state_province, country_id FROM locations 
            WHERE city = this_city;
            loc_record loc_cursor%ROWTYPE;
BEGIN
        OPEN loc_cursor;
        LOOP
            FETCH loc_cursor INTO loc_record; EXIT WHEN loc_cursor%NOTFOUND;
        END LOOP;
        CLOSE loc_cursor;
        IF loc_record.location_id IS NOT NULL THEN
            dbms_output.put_line('ID ' || loc_record.location_id); END IF;
        IF loc_record.street_address IS NOT NULL THEN
            dbms_output.put_line('Add ' || loc_record.street_address); END IF;
        IF loc_record.postal_code IS NOT NULL THEN
            dbms_output.put_line('Code ' || loc_record.postal_code); END IF;
        IF loc_record.city IS NOT NULL THEN
            dbms_output.put_line('City ' || loc_record.city); END IF;
        IF loc_record.state_province IS NOT NULL THEN
            dbms_output.put_line('Province ' || loc_record.state_province); END IF;
        IF loc_record.country_id IS NOT NULL THEN
            dbms_output.put_line('Country ID ' || loc_record.country_id); END IF;
END;

--11
BEGIN
    FOR major IN REVERSE 1 .. 5 
    LOOP
        dbms_output.put_line(major || '.');
        IF major = 5 THEN
            CONTINUE;
        END IF;
        FOR minor IN 1 .. major
        LOOP
            IF minor = 2 THEN
                CONTINUE;
            END IF;
            dbms_output.put_line(major || '.' || minor);
        END LOOP;
    END LOOP;
END;





