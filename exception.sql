DECLARE
    v_employee_id INTEGER := :ENTER_EMPLOYEE_ID;
    v_employee employees%ROWTYPE; 
    e_int_excep EXCEPTION;
    PRAGMA EXCEPTION_INIT (e_int_excep, -01722);
BEGIN
    SELECT * 
    INTO v_employee
    FROM employees 
    WHERE employee_id = v_employee_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('There are no employees with the given ID');
    WHEN e_int_excep THEN  
        DBMS_OUTPUT.PUT_LINE('Given input is not a valid integer');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Other error');
END;
