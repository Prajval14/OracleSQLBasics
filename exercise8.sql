-- STUDENT NAME: PRAJVAL PATEL (C0911611) AND URVESH PATEL (C0903445)

-- Question 1
CREATE OR REPLACE FUNCTION get_full_name(p_student_no IN students.student_no)
RETURN VARCHAR2
IS
    v_student_name VARCHAR2(100); 
    v_first_name students.first_name%TYPE;
    v_last_name students.last_name%TYPE;
BEGIN
    SELECT first_name, last_name
    INTO v_first_name, v_last_name
    FROM students
    WHERE student_no = p_student_no;
    v_student_name := v_first_name || ' ' || v_last_name;
    RETURN v_student_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN TOO_MANY_ROWS THEN
        RETURN NULL;
END get_full_name;


-- Question 2
DECLARE
    v_student_no students.student_no := :ENTER_STUDENT_NO;
    v_student_name VARCHAR2(100);
BEGIN
    v_student_name := get_full_name(v_student_no);   
    IF v_student_name IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Student ' || v_student_no || ' not found');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_no);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_student_name);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' An error occurred: ' || SQLERRM);
END;
