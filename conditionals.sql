-- If Else If
DECLARE
    v_salary INTEGER;
    v_id INTEGER;
    v_msg VARCHAR(20);
BEGIN
    SELECT employee_id, salary
    INTO v_id, v_salary
    FROM employees
    WHERE employee_id = 100;

    IF v_salary >= 10000 THEN
        v_msg := 'High';
    ELSIF v_salary >=8000 AND v_salary < 10000 THEN
        v_msg := 'Medium';
    ELSE
        v_msg := 'Low';
    END IF;

    DBMS_OUTPUT.PUT_LINE('The salary of ' || v_id || ' is ' || v_salary || '. It is in ' || v_msg || ' range.');
END;

-- Switch
DECLARE
     v_grade CHAR(1) := :Enter_grade;
     v_appraisal VARCHAR(20);
BEGIN
    v_appraisal :=
        CASE v_grade
            WHEN 'A' THEN 'Excellent'
            WHEN 'B' THEN 'Good'
            WHEN 'C' THEN 'Average'
            ELSE 'No such grade'
        END;
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade || ' Remarks: ' || v_appraisal);
END;