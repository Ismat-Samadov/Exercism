CREATE OR REPLACE FUNCTION add_gigasecond(
    p_input_date IN DATE,
    p_input_time IN TIMESTAMP
) RETURN TIMESTAMP
IS
    v_input_timestamp TIMESTAMP := p_input_date + (p_input_time - TRUNC(p_input_time));
    v_gigasecond_interval INTERVAL DAY TO SECOND;
BEGIN
    -- Define a gigasecond interval
    v_gigasecond_interval := INTERVAL '1000000000 00:00:00' SECOND TO SECOND;

    -- Add the gigasecond interval to the input timestamp
    v_input_timestamp := v_input_timestamp + v_gigasecond_interval;

    -- Return the resulting timestamp
    RETURN v_input_timestamp;
END;
/


DECLARE
    v_input_date DATE := TO_DATE('2015-01-24', 'YYYY-MM-DD');
    v_input_time TIMESTAMP := TO_TIMESTAMP('2015-01-24 22:00:00', 'YYYY-MM-DD HH24:MI:SS');
    v_expected_result TIMESTAMP := TO_TIMESTAMP('2046-10-02 23:46:40', 'YYYY-MM-DD HH24:MI:SS');
    v_result TIMESTAMP;
BEGIN
    v_result := add_gigasecond(v_input_date, v_input_time);

    -- Check if the result matches the expected result
    IF v_result = v_expected_result THEN
        DBMS_OUTPUT.PUT_LINE('Test passed: One gigasecond after the input date and time is ' || v_result);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Test failed: Expected ' || v_expected_result || ' but got ' || v_result);
    END IF;
END;
/
