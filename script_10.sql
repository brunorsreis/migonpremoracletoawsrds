-- Here is how you can extract the DDL from your source: (http://www.techdatabasket.com/how-to-extract-all-tablespaces-ddl-on-oracle-database/):

— Source database:

SQL> set heading off;
SQL> set echo off;
SQL> set pages 2000
SQL> set lines 2000
SQL> set long 99999
SQL> spool ddl_tablespaces.sql
SQL> select dbms_metadata.get_ddl('TABLESPACE', tablespace_name) from dba_tablespaces  ;
##HERE WILL BE SHOWN ALL  TABLESPACES DLL ABOUT YOUR DATABASE##
SQL> spool off
