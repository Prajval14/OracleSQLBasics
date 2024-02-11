-- STUDENT NAME: PRAJVAL PATEL (C0911611)

-- Exercise 1

-- A. Create an anonymous block that returns the number of students in a section. Prompt for section id.
DECLARE
     v_sectionid INTEGER := :ENTER_SECTION_ID;
     v_totalstudents INTEGER;
BEGIN
    SELECT COUNT(gl_enrollments.student_no)
    INTO v_totalstudents
    FROM gl_enrollments
    WHERE gl_enrollments.section_id = v_sectionid;
    DBMS_OUTPUT.PUT_LINE('There are ' || v_totalstudents || ' students in section ' || v_sectionid);
END;

-- B.Create an anonymous block that return the average numeric grade for a section. Prompt for section id and return the average grade. 
DECLARE
     v_sectionid INTEGER := :ENTER_SECTION_ID;
     v_avggrade FLOAT;
BEGIN
    SELECT AVG(NVL(gl_enrollments.numeric_grade, 0))
    INTO v_avggrade
    FROM gl_enrollments
    WHERE gl_enrollments.section_id = v_sectionid;
    DBMS_OUTPUT.PUT_LINE('The average grade in section ' || v_sectionid || ' is ' || v_avggrade);
END;

-- Exercise 2

CREATE OR REPLACE VIEW gl_stdV1 AS
SELECT s.student_no, s.first_name AS student_first_name, s.last_name AS student_last_name, p.program_name, c.course_title, e.section_id, pf.first_name, pf.last_name, e.letter_grade
FROM gl_students s
JOIN gl_programs p ON p.program_code = s.major_code
JOIN gl_courses c ON c.program_code = p.program_code
JOIN gl_enrollments e ON e.student_no = s.student_no
JOIN gl_sections sc ON sc.section_id = e.section_id
JOIN gl_professors pf ON pf.professor_no = sc.professor_no;

DECLARE
    v_studentno gl_enrollments.student_no%TYPE := :ENTER_STUDENT_NO;
    v_sectionid gl_enrollments.section_id%TYPE := :ENTER_SECTION_ID;
    v_student_record gl_stdV1%ROWTYPE;
    v_today DATE :=SYSDATE;
BEGIN
    SELECT *
    INTO v_student_record
    FROM gl_stdV1
    WHERE gl_stdV1.student_no = v_studentno
    AND gl_stdV1.section_id = v_sectionid
    FETCH FIRST 1 ROW ONLY;
    
    DBMS_OUTPUT.PUT_LINE('Student Grade: ' || TO_CHAR(SYSDATE, 'Day, Month DD, YYYY'));
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_record.student_first_name || ' ' || v_student_record.student_last_name);
    DBMS_OUTPUT.PUT_LINE('Major: ' || v_student_record.program_name);
    DBMS_OUTPUT.PUT_LINE('Course: ' || v_student_record.course_title);
    DBMS_OUTPUT.PUT_LINE('Section: ' || v_student_record.section_id);
    DBMS_OUTPUT.PUT_LINE('Professor: ' || v_student_record.first_name || ' ' || v_student_record.last_name);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_student_record.letter_grade);
END;

-- Exercise 3