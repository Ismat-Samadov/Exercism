CREATE OR REPLACE FUNCTION arabic_to_roman(arabic_number IN NUMBER) RETURN VARCHAR2 IS
    roman_numeral VARCHAR2(20); -- Variable to store the Roman numeral
    temp_arabic_number NUMBER := arabic_number; -- Local variable to store the value of the input parameter
    
BEGIN
    roman_numeral := ''; -- Initialize the Roman numeral
    
    -- Convert thousands place
    IF temp_arabic_number >= 1000 THEN
        roman_numeral := roman_numeral || 'M';
        temp_arabic_number := temp_arabic_number - 1000;
    END IF;
    
    -- Convert hundreds place
    IF temp_arabic_number >= 900 THEN
        roman_numeral := roman_numeral || 'CM';
        temp_arabic_number := temp_arabic_number - 900;
    ELSIF temp_arabic_number >= 500 THEN
        roman_numeral := roman_numeral || 'D';
        temp_arabic_number := temp_arabic_number - 500;
    ELSIF temp_arabic_number >= 400 THEN
        roman_numeral := roman_numeral || 'CD';
        temp_arabic_number := temp_arabic_number - 400;
    END IF;
    
    -- Convert tens place
    IF temp_arabic_number >= 100 THEN
        roman_numeral := roman_numeral || 'C';
        temp_arabic_number := temp_arabic_number - 100;
    END IF;
    
    -- Convert tens place
    IF temp_arabic_number >= 90 THEN
        roman_numeral := roman_numeral || 'XC';
        temp_arabic_number := temp_arabic_number - 90;
    ELSIF temp_arabic_number >= 50 THEN
        roman_numeral := roman_numeral || 'L';
        temp_arabic_number := temp_arabic_number - 50;
    ELSIF temp_arabic_number >= 40 THEN
        roman_numeral := roman_numeral || 'XL';
        temp_arabic_number := temp_arabic_number - 40;
    END IF;
    
    -- Convert ones place
    IF temp_arabic_number >= 10 THEN
        roman_numeral := roman_numeral || 'X';
        temp_arabic_number := temp_arabic_number - 10;
    END IF;
    
    -- Convert ones place
    IF temp_arabic_number >= 9 THEN
        roman_numeral := roman_numeral || 'IX';
        temp_arabic_number := temp_arabic_number - 9;
    ELSIF temp_arabic_number >= 5 THEN
        roman_numeral := roman_numeral || 'V';
        temp_arabic_number := temp_arabic_number - 5;
    ELSIF temp_arabic_number >= 4 THEN
        roman_numeral := roman_numeral || 'IV';
        temp_arabic_number := temp_arabic_number - 4;
    END IF;
    
    -- Convert ones place
    IF temp_arabic_number >= 1 THEN
        roman_numeral := roman_numeral || 'I';
        temp_arabic_number := temp_arabic_number - 1;
    END IF;
    
    RETURN roman_numeral; -- Return the Roman numeral
END arabic_to_roman;
/

set SERVEROUTPUT on

SELECT arabic_to_roman(1996) AS roman_numeral FROM dual;
exit;