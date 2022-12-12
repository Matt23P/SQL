--1
SELECT username FROM dba_users;

--2
CREATE USER new_user
IDENTIFIED BY new_password
DEFAULT TABLESPACE users
QUOTA 10M ON users
PASSWORD EXPIRE;

--3
GRANT select ON regions TO new_user;
GRANT connect TO new_user;

--4
--zmiana uzyt. na new_user poprzez properties w oracle connections
SELECT user FROM dual;

--5
--jako new user
SELECT table_name
FROM user_tables
ORDER BY table_name;

--6
--jako new user
CREATE TABLE test_table (
    myname VARCHAR2(20) NOT NULL,
    nu NUMBER NOT NULL
)

--7
--jako SYSTEM
GRANT create table TO new_user;

--8
--zmiana na new_user
CREATE TABLE test_table (
    myname VARCHAR2(20) NOT NULL,
    numer NUMBER NOT NULL
)

--9
INSERT INTO regions VALUES ( 5 , 'Antarctica');

--10
GRANT insert, delete ON regions TO new_user;
GRANT grant TO new_user;

--11
INSERT INTO regions (region_id, region_name) VALUES ( 5 , 'Antarctica');

--12
UPDATE regions
SET region_name = 'Greenland'
WHERE region_id = 5;

--13
--zmiana na SYSTEM
SELECT * FROM dba_roles;

--14
CREATE ROLE new_role; 

--15
GRANT update ON regions TO new_role;

--16
GRANT new_role TO new_user WITH ADMIN OPTION;

--17
--przelaczamy siê na new_user
SET ROLE new_role;

--18
UPDATE regions
SET region_id = 10
WHERE region_name = 'Greenland';

--19
--przelaczamy uzytkownika na SYSTEM
CREATE USER new_user2
IDENTIFIED BY new_password2;

--20
GRANT select ON regions TO new_user2;
GRANT connect TO new_user2;

--21
GRANT create table TO new_user2;

--22
GRANT insert, delete ON regions TO new_user2;

--23
--wykonujemy polecenie jako SYSTEM
REVOKE delete ON regions FROM new_user;

--24
--jako new_user2
select * from regions;
delete from regions where region_id = 10;

--25
--jak new_user
GRANT new_role TO new_user2;

--26
--jako new_user2
SET ROLE new_role;

--27
--jako SYSTEM
REVOKE new_role FROM new_user;

--28
--jako new_user2
UPDATE regions
SET region_id = 6
WHERE region_name = 'Greenland';

SELECT * FROM regions;

--29
--jako SYSTEM
REVOKE update ON regions FROM new_role;

--30
--jako SYSTEM
alter user new_user2 identified by newer_password2 replace new_password2;