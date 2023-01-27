--1
SELECT owner, schedule_name, start_date FROM all_scheduler_schedules;

--2
BEGIN
 DBMS_SCHEDULER.CREATE_SCHEDULE(schedule_name => 'every_Monday',
 start_date => TO_DATE('01/01/2023', 'DD/MM/YYYY'),
 repeat_interval => 'FREQ=WEEKLY; BYDAY=MON; BYHOUR=2; BYMINUTE=0;');
END;

--3
SELECT owner, schedule_name, start_date FROM all_scheduler_schedules;

--4
CREATE TABLE user_count_log(
    ucl_id NUMBER,
    user_num NUMBER,
    log_timestamp TIMESTAMP,
    CONSTRAINT ucl_id_pk PRIMARY KEY (ucl_id)
);
CREATE SEQUENCE user_count_log_seq;

--5 
SELECT owner, job_name, job_style, job_creator, job_type FROM all_scheduler_jobs;

--6
BEGIN
    DBMS_SCHEDULER.CREATE_JOB(job_name => 'count_users',
    schedule_name => 'every_Monday', job_type => 'SQL_SCRIPT',
    job_action => 'INSERT INTO user_count_log(ucl_id, user_num, log_timestamp) VALUES (user_count_log_seq.nextval, (select
    count(*) from ALL_USERS), CURRENT_TIMESTAMP);', enabled => true);
END;

--7
SELECT owner, job_name, job_style, job_creator, job_type FROM all_scheduler_jobs;

--8
BEGIN
 DBMS_SCHEDULER.DISABLE('count_users');
END;