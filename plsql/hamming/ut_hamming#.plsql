SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION HAMMING_DISTANCE(
  P_STRAND1 IN VARCHAR2,
  P_STRAND2 IN VARCHAR2
) RETURN NUMBER IS
  V_DISTANCE NUMBER := 0;
BEGIN
  IF LENGTH(P_STRAND1) != LENGTH(P_STRAND2) THEN
    RAISE_APPLICATION_ERROR(-20001, 'DNA strands must be of equal length');
  END IF;

  FOR I IN 1..LENGTH(P_STRAND1) LOOP
    IF SUBSTR(P_STRAND1, I, 1) != SUBSTR(P_STRAND2, I, 1) THEN
      V_DISTANCE := V_DISTANCE + 1;
    END IF;
  END LOOP;

  RETURN V_DISTANCE;
END;
/

CREATE OR REPLACE PACKAGE UT_HAMMING# IS

  PROCEDURE RUN;
END UT_HAMMING#;
/

CREATE OR REPLACE PACKAGE BODY UT_HAMMING# IS

  PROCEDURE TEST (
    I_DESCN VARCHAR2,
    I_EXP PLS_INTEGER,
    I_ACT PLS_INTEGER
  ) IS
  BEGIN
    IF I_EXP = I_ACT THEN
      DBMS_OUTPUT.PUT_LINE('SUCCESS: '
                           || I_DESCN);
    ELSE
      DBMS_OUTPUT.PUT_LINE( 'FAILURE: '
                            || I_DESCN
                            || ': expected '
                            || NVL(TO_CHAR(I_EXP), 'null')
                               || ', but got '
                               || NVL(TO_CHAR(I_ACT), 'null')
                                  || '!' );
    END IF;
  END TEST;

  PROCEDURE RUN IS
  BEGIN
    TEST('test_no_difference_between_identical_strands', 0, HAMMING_DISTANCE('A', 'A'));
 -- Uncomment the following lines as you enable more tests:
 -- test('test_complete_hamming_distance_of_for_single_nucleotide_strand', 1, hamming_distance('A', 'G'));
 -- test('test_complete_hamming_distance_of_for_small_strand', 2, hamming_distance('AG', 'CT'));
 -- test('test_small_hamming_distance', 1, hamming_distance('AG', 'AT'));
 -- test('test_small_hamming_distance_in_longer_strand', 1, hamming_distance('GGACG', 'GGTCG'));
 -- test('test_nonunique_characters_within_first_strand', 1, hamming_distance('AGA', 'AGG'));
 -- test('test_nonunique_characters_within_second_strand', 1, hamming_distance('AGG', 'AGA'));
 -- test('test_large_hamming_distance', 4, hamming_distance('GATACA', 'GCATAA'));
 -- test('test_hamming_distance_in_very_long_strand', 9, hamming_distance('GGACGGATTCTG', 'AGGACGGATTCT'));
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Test execution failed.');
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END RUN;
END UT_HAMMING#;
/

BEGIN
  UT_HAMMING#.RUN;
END;
/