CREATE OR REPLACE FUNCTION add_gigasecond(input_date IN DATE) RETURN DATE IS
    result_date DATE;
BEGIN
    -- Add one gigasecond (1,000,000,000 seconds) to the input date
    result_date := input_date + (1000000000 / (24 * 60 * 60)); -- Convert seconds to days
    
    RETURN result_date;
END;
/

-- Test the function
SET SERVEROUTPUT ON;

DECLARE
    input_date DATE;
    gigasecond_date DATE;
BEGIN
    -- Test case 1: January 1st, 2000 at 00:00:00
    input_date := TO_DATE('2000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS');
    gigasecond_date := add_gigasecond(input_date);
    DBMS_OUTPUT.PUT_LINE('Test case 1:');
    DBMS_OUTPUT.PUT_LINE('Input Date: ' || TO_CHAR(input_date, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Gigasecond Date: ' || TO_CHAR(gigasecond_date, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Test case 2: December 31st, 2019 at 23:59:59
    input_date := TO_DATE('2019-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS');
    gigasecond_date := add_gigasecond(input_date);
    DBMS_OUTPUT.PUT_LINE('Test case 2:');
    DBMS_OUTPUT.PUT_LINE('Input Date: ' || TO_CHAR(input_date, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Gigasecond Date: ' || TO_CHAR(gigasecond_date, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Test case 3: February 29th, 2020 at 12:00:00 (leap year)
    input_date := TO_DATE('2020-02-29 12:00:00', 'YYYY-MM-DD HH24:MI:SS');
    gigasecond_date := add_gigasecond(input_date);
    DBMS_OUTPUT.PUT_LINE('Test case 3:');
    DBMS_OUTPUT.PUT_LINE('Input Date: ' || TO_CHAR(input_date, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Gigasecond Date: ' || TO_CHAR(gigasecond_date, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('');
END;
/
