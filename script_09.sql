-- It is also important to determine the maximum LOB column of the migrated tables by running below command if you want to migrate the user using the option “LIMITED LOB size” during the DMS migration task stage:

	
SQL> select table_name,column_name,data_type,'select (max(length(' || COLUMN_NAME || '))/(1024)) as "Size in KB" from '
|| owner || '.' || TABLE_NAME ||';' "querytogetlobsize" from dba_tab_cols where owner='&SCHEMA' and data_type in ('CLOB'','BLOB','NCLOB');


