-- Enable Supplemental logging in all tables

##tables without primary key

techdatabasket:techdata/scripts/mig> cat add_log_wopk.sql
-- table with primary key
set pages 200
set lines 200
select distinct'ALTER TABLE '||OWNER||'.'||TABLE_NAME||' ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;' CMD FROM DBA_CONSTRAINTS where CONSTRAINT_TYPE <>'P' and OWNER IN('APPTECH');




##tables with primary key

techdatabasket:techdata/scripts/mig> cat add_log.sql
--table without primary key
set pages 200
set lines 200
select distinct 'ALTER TABLE '||OWNER||'.'||TABLE_NAME||'  ADD SUPPLEMENTAL LOG DATA (PRIMARY KEY) COLUMNS;' CMD FROM DBA_CONSTRAINTS where CONSTRAINT_TYPE='P' and OWNER IN('APPTECH');


