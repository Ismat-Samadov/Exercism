sqlplus sys as sysdba@localhost:1521/xepdb1 @binary_to_decimal.sql

SELECT * FROM USER_ERRORS WHERE NAME = 'ADD_GIGASECOND';
