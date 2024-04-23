CREATE OR REPLACE FUNCTION binary_to_decimal(bin_str IN VARCHAR2) RETURN NUMBER IS
    decimal_num NUMBER := 0;
    bin_length NUMBER := LENGTH(bin_str);
BEGIN
    FOR i IN REVERSE 1..bin_length LOOP
        IF SUBSTR(bin_str, i, 1) = '1' THEN
            decimal_num := decimal_num + POWER(2, bin_length - i - 1);
        ELSIF SUBSTR(bin_str, i, 1) != '0' THEN
            RAISE_APPLICATION_ERROR(-20001, 'Invalid binary input');
        END IF;
    END LOOP;
    
    RETURN decimal_num;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred while converting binary to decimal');
END binary_to_decimal;
/

--test
SET SERVEROUTPUT ON;
DECLARE
    binary_str VARCHAR2(100) := '101010';
    decimal_result NUMBER;
BEGIN
    decimal_result := binary_to_decimal(binary_str);
    DBMS_OUTPUT.PUT_LINE('Decimal equivalent of ' || binary_str || ' is ' || decimal_result);
END;
/
