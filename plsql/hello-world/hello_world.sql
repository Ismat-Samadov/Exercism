CREATE OR REPLACE FUNCTION hello_world RETURN VARCHAR2 IS
BEGIN
    RETURN 'Hello, World!';
END hello_world;
/

SET SERVEROUTPUT ON;

DECLARE
    result VARCHAR2(100);
BEGIN
    result := hello_world;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/