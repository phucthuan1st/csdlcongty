ALTER SYSTEM SET DB_CREATE_FILE_DEST = '/home/oracle/';
/*
DROP PLUGGABLE DATABASE COMPANY INCLUDING DATAFILES;
*/
CREATE PLUGGABLE DATABASE COMPANY ADMIN USER master IDENTIFIED BY master;
ALTER PLUGGABLE DATABASE COMPANY OPEN;
/* 
ALTER PLUGGABLE DATABASE COMPANY CLOSE;
*/
ALTER SESSION SET CONTAINER = COMPANY;

-- PUBLIC COMPANY schema
CREATE USER COMPANY_PUBLIC IDENTIFIED BY astrongpassword;
GRANT CREATE SESSION, CREATE TABLE TO COMPANY_PUBLIC;
GRANT dba TO COMPANY_PUBLIC WITH ADMIN OPTION;
GRANT SELECT ANY DICTIONARY TO COMPANY_PUBLIC WITH ADMIN OPTION;

-- change to COMPANY_PUBLIC schema
ALTER SESSION SET CURRENT_SCHEMA = COMPANY_PUBLIC;
SET SERVEROUTPUT ON;