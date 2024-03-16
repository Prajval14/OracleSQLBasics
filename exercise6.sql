-- STUDENT NAME: PRAJVAL PATEL (C0911611) AND URVESH PATEL (C0903445)

-- Exercise 14
CREATE OR REPLACE PROCEDURE Add_job(
    p_job_id  IN jobs.job_id%TYPE,
    p_job_title IN jobs.job_title%TYPE,
    p_min_salary  IN jobs.min_salary%TYPE DEFAULT 0)
IS
BEGIN
    INSERT INTO jobs(job_id, job_title, min_salary)
    VALUES(p_job_id, p_job_title, p_min_salary);
    DBMS_OUTPUT.PUT_LINE('Inserted '|| SQL%ROWCOUNT ||' row');
    DBMS_OUTPUT.PUT_LINE('Inserted '|| 'Job IB: ' || p_job_id );
    DBMS_OUTPUT.PUT_LINE('Inserted '|| 'Job Title: ' || p_job_title );
END;

BEGIN
    Add_job('SE_INT','Software Engineer Intern');

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error adding job');
END;

-- Exercise 15
CREATE OR REPLACE PROCEDURE update_job(
    p_job_id  IN jobs.job_id%TYPE,
    p_job_title IN jobs.job_title%TYPE)
IS
    v_old_job_title jobs.job_title%TYPE;
BEGIN
    SELECT job_title
    INTO v_old_job_title
    FROM jobs
    WHERE job_id = p_job_id;

    UPDATE jobs
    SET job_title = p_job_title
    WHERE job_id = p_job_id;

    DBMS_OUTPUT.PUT_LINE('Old Job Title: ' || v_old_job_title);
    DBMS_OUTPUT.PUT_LINE('New Job Title: ' || p_job_title);
END;

BEGIN
    update_job('SE_INT','Software Developer Intern');

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error updating job title');    
END;