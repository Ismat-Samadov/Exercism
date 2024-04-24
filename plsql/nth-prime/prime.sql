CREATE OR REPLACE FUNCTION nth_prime(n IN NUMBER) RETURN NUMBER IS
    primes SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST(); 
    count_primes NUMBER := 0;  
    num NUMBER := 2; 
    
    FUNCTION is_prime(num IN NUMBER) RETURN BOOLEAN IS
        divisor NUMBER := 2;
    BEGIN
        WHILE divisor * divisor <= num LOOP
            IF MOD(num, divisor) = 0 THEN
                RETURN FALSE;
            END IF;
            divisor := divisor + 1;
        END LOOP;
        RETURN TRUE; 
    END is_prime;
BEGIN
    WHILE count_primes < n LOOP
        IF is_prime(num) THEN
            primes.EXTEND;
            primes(count_primes + 1) := num; 
            count_primes := count_primes + 1; 
        END IF;
        num := num + 1; 
    END LOOP;
    
    RETURN primes(n); 
END;
/

DECLARE
    nth_prime_number NUMBER;
BEGIN
    nth_prime_number := nth_prime(6);
    DBMS_OUTPUT.PUT_LINE('The 6th prime number is: ' || nth_prime_number);
END;
/


SET SERVEROUTPUT ON-- This command enables DBMS_OUTPUT

DECLARE
    nth_prime_number NUMBER;
BEGIN
    nth_prime_number := nth_prime(6);
    DBMS_OUTPUT.PUT_LINE('The 6th prime number is: ' || nth_prime_number);
END;
/
