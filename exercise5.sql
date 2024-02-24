-- STUDENT NAME: PRAJVAL PATEL (C0911611)

-- Exercise 1

DECLARE
    v_department_id departments.department_id%TYPE := :ENTER_DEPARTMENT_ID;
    v_error_message VARCHAR(200);
    child_record_found EXCEPTION;
    PRAGMA EXCEPTION_INIT(child_record_found, -2292);
BEGIN    
    DELETE FROM departments
    WHERE department_id = v_department_id;
    DBMS_OUTPUT.PUT_LINE('Department number ' || v_department_id || ' has been deleted.');

EXCEPTION
    WHEN child_record_found THEN
        v_error_message := 'You are not allowed to delete department number ';
        DBMS_OUTPUT.PUT_LINE(v_error_message || v_department_id || '.');    
    WHEN OTHERS THEN
        v_error_message := SQLERRM;
        DBMS_OUTPUT.PUT_LINE(v_error_message);    
END;

-- Exercise 2

DECLARE
    l_name employees.LAST_NAME%TYPE;
    emp_id employees.employee_id%TYPE := :employee_id; 
    v_error_message VARCHAR(200);
BEGIN
    SELECT LAST_NAME
    INTO l_name
    FROM employees
    WHERE employee_id = emp_id;
    DBMS_OUTPUT.PUT_LINE('Employee name is ' || l_name); 
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_error_message := 'Employee does not exist';
        DBMS_OUTPUT.PUT_LINE(v_error_message); 
    WHEN OTHERS THEN
        v_error_message := SQLERRM;
        DBMS_OUTPUT.PUT_LINE(v_error_message);    
END;

