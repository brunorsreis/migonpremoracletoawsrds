-- Extract the DDL of the tables and create it in your target database:
(Example to list all tables that belongs to the user BRUNORS)

— Source database:

	
SQL> select owner, table_name from dba_tables where owner='BRUNORS;
BRUNORS     TECHDATB01
BRUNORS     TECHDATB02

-- Creating a script that it will create the DDL of the tables TECHDATB01 and TECHDATB02 of the user BRUNORS:

— Source database:

set long 1000000;
set longchunksize 32000;
set linesize 32000;
set trimspool on;
set heading off;
set pages 0;
set newpage none;
set embedded on;
set tab off;
set feedback off;
set echo off;
SELECT  dbms_metadata.get_ddl('TABLE','TECHDATB01','BRUNORS')||';' from dual ;   
SELECT  dbms_metadata.get_ddl('TABLE','TECHDATB02','BRUNORS')||';' from dual ;  
set sqlblanklines on;
set define off;
set sqlprefix off;
set blockterminator OFF;  
