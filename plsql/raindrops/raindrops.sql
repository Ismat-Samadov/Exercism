CREATE OR REPLACE FUNCTION raindrops(n IN NUMBER) RETURN VARCHAR2 IS
    result VARCHAR2(100);
BEGIN
    result := '';
    
    IF MOD(n, 3) = 0 THEN
        result := result || 'Pling';
    END IF;
    
    IF MOD(n, 5) = 0 THEN
        result := result || 'Plang';
    END IF;
    
    IF MOD(n, 7) = 0 THEN
        result := result || 'Plong';
    END IF;
    
    IF result = '' THEN
        result := TO_CHAR(n);
    END IF;
    
    RETURN result;
END;
/


-- Test cases
SET SERVEROUTPUT ON;

BEGIN
    -- Test case 1: Number divisible by 7 only
    DBMS_OUTPUT.PUT_LINE('Test case 1: ' || raindrops(28)); -- Expected output: "Plong"
    
    -- Test case 2: Number divisible by both 3 and 5
    DBMS_OUTPUT.PUT_LINE('Test case 2: ' || raindrops(30)); -- Expected output: "PlingPlang"
    
    -- Test case 3: Number not divisible by 3, 5, or 7
    DBMS_OUTPUT.PUT_LINE('Test case 3: ' || raindrops(34)); -- Expected output: "34"
    
END;
/
