Set serveroutput on;

--1
DECLARE
    emp_name employees.first_name%TYPE;
    emp_surname employees.last_name%TYPE;
BEGIN
    SELECT first_name, last_name
    INTO emp_name, emp_surname
    FROM employees
    WHERE salary = 2500;
    
    dbms_output.put_line(emp_name || ' ' || emp_surname);
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('No employee with this salary');
    WHEN OTHERS
    THEN
        dbms_output.put_line('More than one employee has the same salary');
END;

--2
DECLARE
    ex EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex,-2292);
BEGIN
    DELETE FROM departments 
    WHERE departments.department_id = 100;
EXCEPTION
    WHEN ex
    THEN
        dbms_output.put_line('No employee found');
END;

--3
DECLARE
    too_short EXCEPTION;
    email_address employees.email%TYPE;
BEGIN
    SELECT employees.email
    INTO email_address
    FROM employees
    WHERE employees.first_name = 'Pat' AND employees.last_name = 'Fay';
    IF LENGTH(email_address) < 5 THEN
        RAISE too_short;
    ELSE
        dbms_output.put_line(email_address);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('email address contains less than 5 signs');
END;

--4
DECLARE
    salary_sum INTEGER;
    limiter INTEGER := 700000;
    ex EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex, -20137);
BEGIN
    SELECT SUM(employees.salary)
    INTO salary_sum
    FROM employees;
    IF salary_sum > limiter THEN
        raise_application_error(-20137, 'The limiter has been reached');
    ELSE
        dbms_output.put_line('Sum of salaries: ' || salary_sum);
    END IF;
END;

--5
DECLARE
    CURSOR cur IS
        SELECT distinct dep.department_name, COUNT(emp.employee_id)
        FROM departments dep
        JOIN employees emp ON dep.department_id = emp.department_id
        GROUP BY dep.department_name;
    counter INTEGER;
    department_n departments.department_name%TYPE;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO department_n, counter;
        EXIT WHEN cur%NOTFOUND;
        dbms_output.put_line('Nazwa: ' || department_n);
        dbms_output.put_line('Pracownikow: ' || counter);
        dbms_output.put_line('========================');
    END LOOP;
    CLOSE cur;
END;

--6
DECLARE
    emp_name employees.first_name%TYPE;
    emp_surname employees.last_name%TYPE;
    emp_id INTEGER;
    CURSOR cur(job_name jobs.job_title%TYPE) IS
        SELECT emp.employee_id, emp.first_name, emp.last_name
        FROM employees emp
        JOIN jobs j ON j.job_id = emp.job_id
        WHERE j.job_title = job_name;
BEGIN
    OPEN cur('Sales Representative');
    LOOP
        FETCH cur INTO emp_id,emp_name,emp_surname;
        EXIT WHEN cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID:' || emp_id ||' '|| emp_name ||' '|| emp_surname);                                  
    END LOOP;
    CLOSE cur;
END;

--7
DECLARE
    CURSOR loc IS
        SELECT l.location_id,l.street_address,l.postal_code,l.city,
                l.state_province,l.country_id
        FROM locations l
        JOIN departments d ON d.location_id = l.location_id
        WHERE d.location_id IS NULL
        FOR UPDATE of l.location_id,l.street_address,l.postal_code,l.city,
                    l.state_province,l.country_id;
    loc_all locations%ROWTYPE;
BEGIN
    OPEN loc;
    LOOP
        FETCH loc INTO loc_all;
        EXIT WHEN loc%NOTFOUND;
        DELETE FROM locations 
        WHERE CURRENT OF loc;
    END LOOP;
    CLOSE loc;
END;

--8
DECLARE
    minimal EXCEPTION;
    maximum EXCEPTION;
    PRAGMA EXCEPTION_INIT(minimal, -20998);
    PRAGMA EXCEPTION_INIT(maximum, -20122);
    CURSOR job_cur IS SELECT * FROM jobs j;
    CURSOR pay(job_title jobs.job_title%TYPE) IS
        SELECT MAX(e.salary)
        FROM employees e;
    money INTEGER;
BEGIN
    FOR job_record IN job_cur LOOP
        dbms_output.put_line(job_record.job_title);
        OPEN pay(job_record.job_title);
        LOOP
            FETCH pay INTO money;
            EXIT WHEN pay%NOTFOUND;
        END LOOP;
        CLOSE pay;
        IF (job_record.min_salary < 0) THEN
            RAISE minimal;
        ELSIF money > job_record.max_salary THEN
            RAISE maximum;
        ELSIF (job_record.max_salary - job_record.min_salary > job_record.min_salary)
        THEN
            dbms_output.put_line(' - zbyt duza roznica pomiêdzy minimalnym i maksymalnym wynagrodzeniem');
        END IF;
    END LOOP;
EXCEPTION
    WHEN minimal THEN
        dbms_output.put_line('pay is lower than zero');
    WHEN maximum THEN
        dbms_output.put_line('pay limit exceeded');
END;

--9
DECLARE
    CURSOR emp_cur(dep_id departments.department_id%TYPE) IS
        SELECT emp.first_name, emp.last_name
        FROM employees emp
        WHERE emp.department_id = dep_id;
    CURSOR dep_cur IS SELECT * FROM departments;
    CURSOR counter(dep_id departments.department_id%TYPE) IS
        SELECT COUNT(emp.first_name)
        FROM employees emp
        WHERE emp.department_id = dep_id;
    c INTEGER;
BEGIN
    FOR dep_rec IN dep_cur LOOP
        dbms_output.put_line('*'||dep_rec.department_name||'*');
        OPEN counter(dep_rec.department_id);
        LOOP
            FETCH counter INTO c;
            EXIT WHEN counter%NOTFOUND;
        END LOOP;
        CLOSE counter;
        IF (c = 0) THEN
            dbms_output.put_line('NO EMPLOYEES');
        END IF;
        FOR emp_rec IN emp_cur(dep_rec.department_id) LOOP
            dbms_output.put_line(emp_rec.first_name||' '||emp_rec.last_name);
        END LOOP;
    END LOOP;
END;