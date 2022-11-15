CREATE OR REPLACE PROCEDURE proc1(this_date IN DATE)
IS 
BEGIN
    dbms_output.put_line('Day of week: ');
    dbms_output.put_line(TO_CHAR(this_date, 'DAY'));
END proc1;
/
EXECUTE proc1(TO_DATE('01/11/2022', 'DD/MM/YYYY'));

CREATE OR REPLACE PROCEDURE proc2(salary_input IN NUMBER DEFAULT 5000)
IS
    CURSOR avg_salary IS
        SELECT dep.department_name, ROUND(AVG(emp.salary),0) AS average
        FROM departments dep
        JOIN employees emp ON emp.department_id = dep.department_id
        GROUP BY dep.department_name;
BEGIN
    FOR i IN avg_salary LOOP
        EXIT WHEN avg_salary%NOTFOUND;
        IF i.average > salary_input THEN
            dbms_output.put_line(i.department_name || 'AVG: ' || i.average);
        END IF;
    END LOOP;
END proc2;
/
EXECUTE proc2;

CREATE OR REPLACE PROCEDURE proc3 (
    year_input IN NUMBER, percentage IN NUMBER,
    modified_records OUT NUMBER)
IS
    counter NUMBER := 0;
    CURSOR year_of_employment IS
        SELECT hire_date, salary, employee_id
        FROM employees
        WHERE EXTRACT(YEAR FROM TO_DATE(hire_date, 'YY/MM/DD')) < year_input
        FOR UPDATE;
BEGIN
    FOR i IN year_of_employment LOOP
        EXIT WHEN year_of_employment%NOTFOUND;
        counter := counter + 1;
        UPDATE employees
        SET salary = ((percentage/100) * salary + salary)
        WHERE employee_id = i.employee_id;
    END LOOP;
    modified_records := counter;
END proc3;
/
DECLARE how_many_records_was_modified NUMBER;
BEGIN
    proc3(2004, 5, how_many_records_was_modified);
    dbms_output.put_line('Modified records: ');
    dbms_output.put_line(how_many_records_was_modified);
END;

CREATE OR REPLACE FUNCTION func4(
    input_id IN employees.job_id%TYPE)
    RETURN NUMBER
IS
    job_salary NUMBER;
    salary_sum NUMBER;
    percentage NUMBER;
BEGIN
    SELECT SUM(salary) INTO salary_sum
    FROM employees;
    SELECT SUM(salary) INTO job_salary
    FROM employees
    WHERE job_id = input_id;
    percentage := ROUND((job_salary/salary_sum)*100, 2);
    RETURN percentage;
END func4;
/
DECLARE
    perc NUMBER;
    job_name jobs.job_title%TYPE;
    idjob employees.job_id%TYPE;
    CURSOR cur IS
        SELECT DISTINCT(emp.job_id), jobs.job_title
        FROM employees emp
        JOIN jobs ON jobs.job_id = emp.job_id;
BEGIN
    dbms_output.put_line('ID -=- job title -=- percent%');
    FOR i IN cur LOOP
        EXIT WHEN cur%NOTFOUND;
        dbms_output.put_line(i.job_id || ' ' || i.job_title 
        || ' ' || func4(i.job_id) || '%');
    END LOOP;
END;

CREATE OR REPLACE FUNCTION func5(region IN regions.region_name%TYPE)
    RETURN SYS_REFCURSOR
IS
    ref_cur SYS_REFCURSOR;
BEGIN
    OPEN ref_cur FOR
        SELECT location_id, city
        FROM locations loc
        JOIN countries cou ON cou.country_id = loc.country_id
        JOIN regions reg ON reg.region_id = cou.region_id
        WHERE reg.region_name = region;
    RETURN ref_cur;
END func5;
/
DECLARE
    loc_id locations.location_id%TYPE;
    city_name locations.city%TYPE;
    ref_cursor SYS_REFCURSOR;
BEGIN
    ref_cursor := func5('Asia');
    LOOP
        FETCH ref_cursor INTO loc_id, city_name;
        EXIT WHEN ref_cursor%NOTFOUND;
        dbms_output.put_line('ID '||loc_id||' --- city: '||city_name);
    END LOOP;
END;

CREATE OR REPLACE FUNCTION func6(region IN regions.region_name%TYPE) RETURN NUMBER
IS
    counter NUMBER := 0;
    CURSOR reg_cur IS
        SELECT city FROM locations loc
        JOIN countries cou ON cou.country_id = loc.country_id
        JOIN regions reg ON reg.region_id = cou.region_id
        WHERE reg.region_name = region;
BEGIN
    FOR i IN reg_cur LOOP
        EXIT WHEN reg_cur%NOTFOUND;
        counter := counter + 1;
    END LOOP;
    dbms_output.put_line('(!func6) countries: '||counter);
    RETURN counter;
END;
/
CREATE OR REPLACE PROCEDURE proc6(region IN regions.region_name%TYPE)
IS
    unable_to_delete EXCEPTION;
    PRAGMA EXCEPTION_INIT(unable_to_delete,-2292);
    num_of_countries NUMBER := func6(region);
BEGIN
    IF num_of_countries = 0 THEN
        DELETE FROM regions
        WHERE regions.region_name = region;
    ELSE
        dbms_output.put_line('(!proc6) cities: '||num_of_countries);
    END IF;
EXCEPTION
    WHEN unable_to_delete THEN
        dbms_output.put_line('(!proc6) EXCEPTION! Unable to delete; cities: '
                                ||num_of_countries);
END proc6;
/
EXECUTE proc6('Middle East and Africa');