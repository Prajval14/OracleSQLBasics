DECLARE
    v_test_date DATE := TO_DATE('2025-01-31', 'YYYY-MM-DD');
BEGIN
    DBMS_OUTPUT.PUT_LINE('The test date is ' || v_test_date);
END;

DECLARE
    v_today DATE :=SYSDATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Today is ' || TO_CHAR(v_today, 'YYYY-MM-DD'));
END;

DECLARE
    v_default_date DATE DEFAULT SYSDATE;
BEGIN    
    DBMS_OUTPUT.PUT_LINE('Today is ' || TO_CHAR(v_default_date, 'YYYY-MM-DD'));
END;

DECLARE
    C_TAX_RATE CONSTANT NUMBER(3,2) := 0.13;
BEGIN
    DBMS_OUTPUT.PUT_LINE('The tax rate is: ' || TO_CHAR(C_TAX_RATE * 100) || ' percent.');
END;