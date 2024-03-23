-- STUDENT NAME: PRAJVAL PATEL (C0911611) AND URVESH PATEL (C0903445)

-- Question 1
CREATE OR REPLACE FUNCTION convert_numeric_grade(p_grade IN NUMBER)
RETURN CHAR
IS
    v_grade_class CHAR;
BEGIN
    CASE 
        WHEN p_grade >= 90 THEN v_grade_class := 'A';
        WHEN p_grade >= 80 THEN v_grade_class := 'B';
        WHEN p_grade >= 70 THEN v_grade_class := 'C';
        WHEN p_grade >= 60 THEN v_grade_class := 'D';
        ELSE v_grade_class := 'F';
    END CASE;
    
    RETURN v_grade_class;
END convert_numeric_grade;

-- Question 2
DECLARE
    v_numeric_grade NUMBER := :ENTER_NUMERIC_GRADE;
    v_letter_grade CHAR;
BEGIN
    v_letter_grade := convert_numeric_grade(v_numeric_grade);    
    DBMS_OUTPUT.PUT_LINE('Numeric grade: ' || v_numeric_grade);
    DBMS_OUTPUT.PUT_LINE('Letter grade: ' || v_letter_grade);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
