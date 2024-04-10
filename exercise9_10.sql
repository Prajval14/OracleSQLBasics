-- STUDENT NAME: PRAJVAL PATEL (C0911611) AND URVESH PATEL (C0903445)

--Assignment 9
CREATE TABLE GL_PRO_AUDIT_LOG (
    user_id VARCHAR2(30) DEFAULT USER,
    last_change_date DATE DEFAULT SYSDATE,
    trigger_name VARCHAR2(15),
    log_action VARCHAR2(30)
);

CREATE SEQUENCE GL_PRO_AUDIT_LOG_SEQ;

CREATE OR REPLACE TRIGGER GL_PROFESSOR_TR
AFTER INSERT ON GL_PROFESSORS_COPY
FOR EACH ROW
DECLARE
BEGIN
    INSERT INTO GL_PRO_AUDIT_LOG (trigger_name, log_action, user_id, last_change_date)
    VALUES ('GL_PROFESSOR_TR', 'INSERT', USER, SYSDATE);
END;

CREATE OR REPLACE PROCEDURE ADD_PROFESSOR(
    p_school_code IN VARCHAR2,
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_office_no IN NUMBER,
    p_office_ext IN NUMBER,
    p_professor_num IN NUMBER
) AS
BEGIN
INSERT INTO GL_PROFESSORS_COPY (school_code, first_name, last_name, professor_no, office_no, office_ext)
VALUES (p_school_code, p_first_name, p_last_name, p_professor_num, p_office_no, p_office_ext);
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;

DECLARE
    v_school_code VARCHAR2(100);
    v_first_name VARCHAR2(100);
    v_last_name VARCHAR2(100);
    v_office_no NUMBER;
    v_office_ext NUMBER;
    v_professor_num NUMBER;
BEGIN
    v_school_code := :Enter_school_code;
    v_first_name := :Enter_First_Name;
    v_last_name := :Enter_last_name;
    v_office_no := :Enter_office_no;
    v_office_ext := :Enter_office_ext;
    v_professor_num := :Enter_professor_num;

    ADD_PROFESSOR(
        p_school_code => INITCAP(v_school_code),
        p_first_name => INITCAP(v_first_name),
        p_last_name => INITCAP(v_last_name),
        p_office_no => v_office_no,
        p_office_ext => v_office_ext,
        p_professor_num => v_professor_num
    );

    DBMS_OUTPUT.PUT_LINE('Professor inserted with Professor Number: ' || v_professor_num);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Duplicate professor number detected.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

--Assignment 10
CREATE OR REPLACE FUNCTION convert_numeric_grade(p_numeric_grade IN NUMBER)
RETURN VARCHAR2
IS
    v_letter_grade VARCHAR2(1);
BEGIN
    CASE
        WHEN p_numeric_grade >= 90 THEN v_letter_grade := 'A';
        WHEN p_numeric_grade >= 80 THEN v_letter_grade := 'B';
        WHEN p_numeric_grade >= 70 THEN v_letter_grade := 'C';
        WHEN p_numeric_grade >= 60 THEN v_letter_grade := 'D';
        ELSE v_letter_grade := 'F';
    END CASE;
    RETURN v_letter_grade;
END;

CREATE TABLE GL_ENROLL_UPDATE_LOG (
    user_id VARCHAR2(30) DEFAULT USER,
    last_change_date DATE DEFAULT SYSDATE,
    section_id NUMBER(5,0),
    student_no NUMBER(7,0),
    old_grade VARCHAR2(2),
    new_grade VARCHAR2(2),
    log_action VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER GL_ENROLL_UPDATE_TRG
AFTER UPDATE OF letter_grade ON gl_enrollments_copy
FOR EACH ROW
DECLARE
    v_action VARCHAR2(30);
BEGIN
    IF :OLD.letter_grade = :NEW.letter_grade THEN
        v_action := 'grade is the same';
    ELSIF :OLD.letter_grade < :NEW.letter_grade THEN
        v_action := 'grade went up';
    ELSE
        v_action := 'grade went down';
    END IF;
    INSERT INTO GL_ENROLL_UPDATE_LOG (user_id, last_change_date, section_id, student_no, old_grade, new_grade, log_action)
    VALUES (USER, SYSDATE, :OLD.section_id, :OLD.student_no, :OLD.letter_grade, :NEW.letter_grade, v_action);
END;

DECLARE
    v_old_grade VARCHAR2(2);
    v_new_grade VARCHAR2(2);
BEGIN

    v_old_grade := 'B';
    v_new_grade := 'A';

    UPDATE gl_enrollments_copy
    SET letter_grade = v_new_grade
    WHERE letter_grade = v_old_grade;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Update operation successful.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;