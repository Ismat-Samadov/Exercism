CREATE OR REPLACE FUNCTION is_leap_year(year IN NUMBER) RETURN VARCHAR2 IS
    leap_year VARCHAR2(20); -- Change the return type size to 20
BEGIN
    leap_year :=
        CASE
            WHEN (MOD(year, 4) = 0 AND MOD(year, 100) != 0) OR MOD(year, 400) = 0 THEN 'Leap Year'
            ELSE 'Not a Leap Year'
        END;
    
    RETURN leap_year;
END;
/



-- Test the function
SELECT is_leap_year(1997) AS year_1997,
       is_leap_year(1900) AS year_1900,
       is_leap_year(2000) AS year_2000
FROM dual;
