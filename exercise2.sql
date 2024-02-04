DECLARE
     v_sectionid INTEGER := :ENTER_SECTION_ID;
     v_totalstudents INTEGER;
BEGIN
    SELECT SUM(DB.students)
    INTO v_totalstudents
    FROM DB
    WHERE DB.sectionid = v_sectionid;
    DBMS_OUTPUT.PUT_LINE('There are ' || v_totalstudents || ' students in section ' || v_sectionid);
END;

DECLARE
     v_sectionid INTEGER := :ENTER_SECTION_ID;
     v_avggrade FLOAT;
BEGIN
    SELECT AVG(DB.grades)
    INTO v_avggrade
    FROM DB
    WHERE DB.sectionid = v_sectionid;
    DBMS_OUTPUT.PUT_LINE('The average grade in section ' || v_sectionid || ' is ' || v_avggrade);
END;

DECLARE
     v_studentno INTEGER := :ENTER_STUDENT_NO;
     v_sectionid INTEGER := :ENTER_SECTION_ID;
     v_studentrecord students%ROWTYPE;   
     v_today DATE :=SYSDATE;  
BEGIN
    SELECT *
    INTO v_studentrecord
    FROM DB
    WHERE DB.sectionid = v_sectionid AND DB.studentno = v_studentno;
    DBMS_OUTPUT.PUT_LINE('Student Grade: ' || TO_CHAR(v_date, 'Day, Month DD, YYYY'));
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Student: ' || v_studentrecord.);
    DBMS_OUTPUT.PUT_LINE('Major: ' || v_studentrecord.);
    DBMS_OUTPUT.PUT_LINE('Course: ' || v_studentrecord.);
    DBMS_OUTPUT.PUT_LINE('Section: ' || v_studentrecord.);
    DBMS_OUTPUT.PUT_LINE('Professor: ' || v_studentrecord.);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_studentrecord.);
END;