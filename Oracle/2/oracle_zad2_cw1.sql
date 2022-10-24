--1
CREATE TABLE visitors (
    visitor_id NUMBER GENERATED ALWAYS
                AS IDENTITY
                START WITH 100
                INCREMENT BY 10,
    enter_datetime DATE DEFAULT SYSDATE,
    exit_datetime DATE,
    employee_id NUMBER(6)
		CONSTRAINT visit_employee_nn NOT NULL,
    company VARCHAR2(20),
    people_number NUMBER(3),
    parking CHAR(1) DEFAULT 'N',
    CONSTRAINT visit_id_pk PRIMARY KEY (visitor_id),
    CONSTRAINT visit_emp_fk FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
    
    CONSTRAINT visit_exit_dt CHECK (exit_datetime > enter_datetime)
);
DESCRIBE visitors;

--2
INSERT INTO visitors( enter_datetime, exit_datetime, employee_id, company, people_number )
    VALUES ( TO_DATE('20-09-2022 09.00', 'dd-mm-yyyy hh24.mi'), TO_DATE('20-09-2022 10.00', 'dd-mm-yyyy hh24.mi'), 109, 'RSM', 1);
INSERT INTO visitors( enter_datetime, exit_datetime, employee_id, company, people_number, parking) 
    VALUES (TO_DATE('21-09-2022 10.00', 'dd-mm-yyyy hh24.mi'), TO_DATE('21-09-2022 11.30', 'dd-mm-yyyy hh24.mi'), 109, 'KPMG', 3, 'Y');

--3
ALTER TABLE visitors SET UNUSED (parking);
ALTER TABLE visitors DROP UNUSED COLUMNS;
DESCRIBE visitors;

--4
UPDATE visitors SET employee_id=110 WHERE company = 'RSM';

--5
DELETE FROM visitors WHERE employee_id = 109;

--6
DROP TABLE visitors;

