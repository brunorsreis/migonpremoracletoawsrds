If you are running FULL LOAD and CDC right away, I would suggest you create the index in the target after the FULL LOAD to speed up the CDC process. To get the DDL of the indexes in your source database to run in your AWS RDS Oracle you can use the script below: (example user BRUNORS):

— source

	
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
select dbms_metadata.get_ddl('INDEX', index_name, owner)
from all_indexes
where owner in ('BRUNORS');
set sqlblanklines on;
set define off;
set sqlprefix off;
set blockterminator OFF; ;
