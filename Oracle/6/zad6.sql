SET serveroutput ON;

--1
CREATE OR REPLACE TRIGGER task1 
BEFORE INSERT ON jobs 
FOR EACH ROW
DECLARE
    ex EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex, -20137);
BEGIN
    IF :NEW.min_salary > :NEW.max_salary THEN
        RAISE_APPLICATION_ERROR(-20137, 'Blednie wprowadzone kwoty!');
    END IF;
END;
/
INSERT INTO jobs VALUES ( 'TE_S', 'test job one', 9000, 10000);
INSERT INTO jobs VALUES ( 'TE_2', 'test job 2', 4000, 1500);


--2
CREATE OR REPLACE TRIGGER task2
AFTER DELETE ON departments
FOR EACH ROW
BEGIN
    dbms_output.put_line(:OLD.department_name);
END;
/
DELETE departments
WHERE department_id IN (
    SELECT dep.department_id
    FROM departments dep
    LEFT JOIN employees emp ON dep.department_id = emp.department_id
    WHERE emp.department_id IS NULL
);


--3
CREATE OR REPLACE TRIGGER task3
BEFORE UPDATE OF job_id ON employees
FOR EACH ROW
BEGIN
    INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id) 
    VALUES (:OLD.employee_id, :OLD.hire_date, SYSDATE, :OLD.job_id, :OLD.department_id);
END;
/
SELECT * FROM job_history;
/
UPDATE employees SET job_id = 'SA_REP' WHERE employee_id = 178;
/
SELECT * FROM job_history;
