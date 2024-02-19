-- STUDENT NAME: PRAJVAL PATEL (C0911611)

-- Exercise 1

DECLARE
    CURSOR c_course_cursor IS 
    SELECT * 
    FROM gl_courses;

    v_course_record c_course_cursor%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Course Code   Course Title');
	DBMS_OUTPUT.PUT_LINE('-----------   --------');
    OPEN c_course_cursor;
    LOOP
        FETCH c_course_cursor INTO v_course_record;
        EXIT WHEN c_course_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_course_record.course_code || '        ' || v_course_record.course_title);
    END LOOP;
    CLOSE c_course_cursor;
END;

-- Exercise 2

DECLARE
    CURSOR c_department_cursor IS 
    SELECT department_id, department_name 
    FROM departments
    WHERE department_id < 100;

    v_department_record c_department_cursor%ROWTYPE;

    CURSOR c_employee_cursor(p_department_id departments.department_id%TYPE) IS 
    SELECT * 
    FROM employees 
    WHERE department_id = p_department_id AND employee_id < 120;

    v_employee_record c_employee_cursor%ROWTYPE;
BEGIN
    OPEN c_department_cursor;
    LOOP
        FETCH c_department_cursor INTO v_department_record;
        EXIT WHEN c_department_cursor%NOTFOUND;    
        OPEN c_employee_cursor(v_department_record.department_id);
        LOOP
            FETCH c_employee_cursor INTO v_employee_record;
            EXIT WHEN c_employee_cursor%NOTFOUND;     
            DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_record.employee_id);
            DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_record.first_name || ' ' || v_employee_record.last_name);
            DBMS_OUTPUT.PUT_LINE('Department Name: ' || v_department_record.department_name);
        END LOOP;
        CLOSE c_employee_cursor;
    END LOOP;
    CLOSE c_department_cursor;
END;
