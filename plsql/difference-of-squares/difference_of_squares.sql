CREATE OR REPLACE FUNCTION difference_of_squares (n IN NUMBER) RETURN NUMBER IS
    sum_of_squares NUMBER := 0;
    square_of_sum NUMBER := 0;
BEGIN
    FOR i IN 1..n LOOP
        sum_of_squares := sum_of_squares + (i * i);
    END LOOP;

    FOR i IN 1..n LOOP
        square_of_sum := square_of_sum + i;
    END LOOP;

    square_of_sum := square_of_sum * square_of_sum;

    RETURN square_of_sum - sum_of_squares;
END difference_of_squares;
/

CREATE OR REPLACE PACKAGE ut_difference_of_squares# IS
   PROCEDURE run;
END ut_difference_of_squares#;
/

CREATE OR REPLACE PACKAGE BODY ut_difference_of_squares# IS
   PROCEDURE TEST (
      i_descn    VARCHAR2,
      i_exp      NUMBER,
      i_act      NUMBER
   )
   IS
   BEGIN
      IF i_exp = i_act THEN
         dbms_output.put_line('SUCCESS: ' || i_descn);
      ELSE
         dbms_output.put_line(
            'FAILURE: '   || i_descn || 
            ': expected ' || i_exp || 
            ', but got '  || i_act || '!'
         );
      END IF;
   END TEST;

   PROCEDURE run IS
   BEGIN
      TEST('Test case 1', 2640, difference_of_squares(10));
      TEST('Test case 2', 170, difference_of_squares(5));
      TEST('Test case 3', 25164150, difference_of_squares(100));
   END run;
END ut_difference_of_squares#;
/

BEGIN
   ut_difference_of_squares#.run;
END;
/
