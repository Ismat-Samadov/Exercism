CREATE OR REPLACE PACKAGE UT_RAINDROPS# IS

  PROCEDURE RUN;
END UT_RAINDROPS#;
/

CREATE OR REPLACE PACKAGE BODY UT_RAINDROPS# IS

  PROCEDURE TEST (
    I_DESCN VARCHAR2,
    I_EXP VARCHAR2,
    I_ACT VARCHAR2
  ) IS
  BEGIN
    IF I_EXP = I_ACT THEN
      DBMS_OUTPUT.PUT_LINE('SUCCESS: '
                           || I_DESCN);
    ELSE
      DBMS_OUTPUT.PUT_LINE('FAILURE: '
                           || I_DESCN
                           || ' - expected '
                           || NVL(I_EXP, 'null')
                              || ', but received '
                              || NVL(I_ACT, 'null'));
    END IF;
  END TEST;

  PROCEDURE RUN IS
  BEGIN
    TEST(
      I_DESCN => 'test_1',
      I_EXP => '1',
      I_ACT => RAINDROPS.CONVERT(1)
    );
    TEST(
      I_DESCN => 'test_3',
      I_EXP => 'Pling',
      I_ACT => RAINDROPS.CONVERT(3)
    );
    TEST(
      I_DESCN => 'test_5',
      I_EXP => 'Plang',
      I_ACT => RAINDROPS.CONVERT(5)
    );
    TEST(
      I_DESCN => 'test_7',
      I_EXP => 'Plong',
      I_ACT => RAINDROPS.CONVERT(7)
    );
    TEST(
      I_DESCN => 'test_6',
      I_EXP => 'Pling',
      I_ACT => RAINDROPS.CONVERT(6)
    );
    TEST(
      I_DESCN => 'test_9',
      I_EXP => 'Pling',
      I_ACT => RAINDROPS.CONVERT(9)
    );
    TEST(
      I_DESCN => 'test_10',
      I_EXP => 'Plang',
      I_ACT => RAINDROPS.CONVERT(10)
    );
    TEST(
      I_DESCN => 'test_14',
      I_EXP => 'Plong',
      I_ACT => RAINDROPS.CONVERT(14)
    );
    TEST(
      I_DESCN => 'test_15',
      I_EXP => 'PlingPlang',
      I_ACT => RAINDROPS.CONVERT(15)
    );
    TEST(
      I_DESCN => 'test_21',
      I_EXP => 'PlingPlong',
      I_ACT => RAINDROPS.CONVERT(21)
    );
    TEST(
      I_DESCN => 'test_25',
      I_EXP => 'Plang',
      I_ACT => RAINDROPS.CONVERT(25)
    );
    TEST(
      I_DESCN => 'test_35',
      I_EXP => 'PlangPlong',
      I_ACT => RAINDROPS.CONVERT(35)
    );
    TEST(
      I_DESCN => 'test_49',
      I_EXP => 'Plong',
      I_ACT => RAINDROPS.CONVERT(49)
    );
    TEST(
      I_DESCN => 'test_52',
      I_EXP => '52',
      I_ACT => RAINDROPS.CONVERT(52)
    );
    TEST(
      I_DESCN => 'test_105',
      I_EXP => 'PlingPlangPlong',
      I_ACT => RAINDROPS.CONVERT(105)
    );
    TEST(
      I_DESCN => 'test_12121',
      I_EXP => '12121',
      I_ACT => RAINDROPS.CONVERT(12121)
    );
  END RUN;
END UT_RAINDROPS#;
/

CREATE OR REPLACE PACKAGE BODY UT_RAINDROPS# IS

  PROCEDURE TEST (
    I_DESCN VARCHAR2,
    I_EXP VARCHAR2,
    I_ACT VARCHAR2
  ) IS
  BEGIN
    IF I_EXP = I_ACT THEN
      DBMS_OUTPUT.PUT_LINE('SUCCESS: '
                           || I_DESCN);
    ELSE
      DBMS_OUTPUT.PUT_LINE('FAILURE: '
                           || I_DESCN
                           || ' - expected '
                           || NVL(I_EXP, 'null')
                              || ', but received '
                              || NVL(I_ACT, 'null'));
    END IF;
  END TEST;

  PROCEDURE RUN IS
  BEGIN
    TEST(
      I_DESCN => 'test_1',
      I_EXP => '1',
      I_ACT => RAINDROPS.CONVERT(1)
    );
    TEST(
      I_DESCN => 'test_3',
      I_EXP => 'Pling',
      I_ACT => RAINDROPS.CONVERT(3)
    );
    TEST(
      I_DESCN => 'test_5',
      I_EXP => 'Plang',
      I_ACT => RAINDROPS.CONVERT(5)
    );
    TEST(
      I_DESCN => 'test_7',
      I_EXP => 'Plong',
      I_ACT => RAINDROPS.CONVERT(7)
    );
    TEST(
      I_DESCN => 'test_6',
      I_EXP => 'Pling',
      I_ACT => RAINDROPS.CONVERT(6)
    );
    TEST(
      I_DESCN => 'test_9',
      I_EXP => 'Pling',
      I_ACT => RAINDROPS.CONVERT(9)
    );
    TEST(
      I_DESCN => 'test_10',
      I_EXP => 'Plang',
      I_ACT => RAINDROPS.CONVERT(10)
    );
    TEST(
      I_DESCN => 'test_14',
      I_EXP => 'Plong',
      I_ACT => RAINDROPS.CONVERT(14)
    );
    TEST(
      I_DESCN => 'test_15',
      I_EXP => 'PlingPlang',
      I_ACT => RAINDROPS.CONVERT(15)
    );
    TEST(
      I_DESCN => 'test_21',
      I_EXP => 'PlingPlong',
      I_ACT => RAINDROPS.CONVERT(21)
    );
    TEST(
      I_DESCN => 'test_25',
      I_EXP => 'Plang',
      I_ACT => RAINDROPS.CONVERT(25)
    );
    TEST(
      I_DESCN => 'test_35',
      I_EXP => 'PlangPlong',
      I_ACT => RAINDROPS.CONVERT(35)
    );
    TEST(
      I_DESCN => 'test_49',
      I_EXP => 'Plong',
      I_ACT => RAINDROPS.CONVERT(49)
    );
    TEST(
      I_DESCN => 'test_52',
      I_EXP => '52',
      I_ACT => RAINDROPS.CONVERT(52)
    );
    TEST(
      I_DESCN => 'test_105',
      I_EXP => 'PlingPlangPlong',
      I_ACT => RAINDROPS.CONVERT(105)
    );
    TEST(
      I_DESCN => 'test_12121',
      I_EXP => '12121',
      I_ACT => RAINDROPS.CONVERT(12121)
    );
  END RUN;
END UT_RAINDROPS#;
/

BEGIN
  UT_RAINDROPS#.RUN;
END;
/