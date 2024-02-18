-- STUDENT NAME: PRAJVAL PATEL (C0911611)

-- Exercise 1

DECLARE
    v_total_purchases INTEGER := :ENTER_TOTAL_PURCHASES;
    v_member_type VARCHAR(20);
BEGIN
    IF v_total_purchases < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Please enter valid integer input');    
    ELSE
        IF v_total_purchases > 3500 THEN
            v_member_type := 'GOLD';
        ELSIF v_total_purchases >2000 AND v_total_purchases <=3500 THEN
            v_member_type := 'SILVER';
        ELSE
            v_member_type := 'BRONZE';
        END IF;
        DBMS_OUTPUT.PUT_LINE('The customer is a ' || v_member_type || ' member');    
    END IF;
END;

-- Exercise 2

DECLARE
    v_start_nn NUMBER(2) := :ENTER_START_NN;
    v_end_nn NUMBER(2) := :ENTER_END_NN;
    v_start_mmm NUMBER(3) := :ENTER_START_MMM;
    v_end_mmm NUMBER(3) := :ENTER_END_MMM;
BEGIN
    IF v_start_nn < 0 OR v_end_nn < 0 OR v_start_mmm < 0 OR v_end_mmm < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Please enter valid input');    
    ELSE
        DBMS_OUTPUT.PUT_LINE('Available License Plates are:');
        FOR i IN v_start_nn..v_end_nn LOOP
            FOR j IN v_start_mmm..v_end_mmm LOOP
                DBMS_OUTPUT.PUT_LINE(i || '-' || j);    
            END LOOP;
        END LOOP;        
    END IF;
END;

-- Exercise 3

DECLARE 
    v_loan_amount NUMBER := :ENTER_LOAN_AMOUNT;  
    v_loan_payment NUMBER := :ENTER_LOAN_PAYMENT;
    v_total_months INTEGER := 0;
    v_balance_due NUMBER := 0;
    v_remaining_balance NUMBER := 0;
BEGIN   
    IF v_loan_amount < 0 OR v_loan_payment < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Please enter valid integer input'); 
    ELSIF v_loan_amount < v_loan_payment THEN
        DBMS_OUTPUT.PUT_LINE('Loan amount cannot be less than monthly payment');
    ELSE
        v_total_months := FLOOR(v_loan_amount/v_loan_payment);        
        DBMS_OUTPUT.PUT_LINE('Loan Amount: ' || '$' || TO_CHAR(v_loan_amount, 'FM999G999D00'));
        DBMS_OUTPUT.PUT_LINE('Loan Payment: ' || '$' || TO_CHAR(v_loan_payment, 'FM999G999D00'));
        DBMS_OUTPUT.PUT_LINE('Equal Payments: ' || v_total_months);
        DBMS_OUTPUT.PUT_LINE('Payment#   Balance');
        DBMS_OUTPUT.PUT_LINE('--------   --------');
        FOR i IN 1..v_total_months LOOP
            v_balance_due := v_loan_amount - v_loan_payment;
            DBMS_OUTPUT.PUT_LINE(i || '          ' || TO_CHAR(v_balance_due, 'FM999G999D00'));
            v_loan_amount := v_balance_due;
        END LOOP;
        v_balance_due := MOD(v_loan_amount, v_loan_payment);
        DBMS_OUTPUT.PUT_LINE('Outstanding balance: ' || '$' || TO_CHAR(v_balance_due, 'FM999G999D00'));
    END IF;
END;
