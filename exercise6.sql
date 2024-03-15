-- STUDENT NAME: PRAJVAL PATEL (C0911611) AND URVESH PATEL ()

-- Exercise 14
CREATE OR REPLACE PROCEDURE Add_job(
    p_job_id  IN jobs.job_id%TYPE,
    p_job_title IN jobs.job_title%TYPE)
IS
BEGIN
    INSERT INTO dept(job_id, job_title)
    VALUES(p_job_id, p_job_title);
    DBMS_OUTPUT.PUT_LINE('Inserted '|| SQL%ROWCOUNT ||' row');
    DBMS_OUTPUT.PUT_LINE('Inserted '|| 'Job IB: ' || p_job_id );
    DBMS_OUTPUT.PUT_LINE('Inserted '|| 'Job Title: ' || p_job_title );
END;

BEGIN
    Add_job('SE_INT','Software Engineer Intern');
END;

-- Exercise 15