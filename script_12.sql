-- Extract the DLL of the users and create it in your target database: (http://www.techdatabasket.com/how-to-extract-ddl-for-all-users-on-oracle-database/)

— Source database:

	
SQL> set heading off;
SQL> set echo off;
SQL> set pages 2000
SQL> set long 99999
SQL> set lines 2000
SQL> spool ddl_users.sql
SQL> select dbms_metadata.get_ddl('USER',username) FROM dba_users;
##HERE WILL BE SHOWN ALL DLL USERS OF YOUR DATABASE##
SQL> spool off
