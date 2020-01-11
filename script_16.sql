For full-load and CDC-enabled task, Amazon recommends that you drop primary key indexes, secondary indexes, referential integrity constraints, and data manipulation language (DML) triggers before the start of the task and create them once the full load phase has completed. If you do not perform this task the error ORA-02266: unique/primary keys in table referenced by enabled foreign keys will stop your task. So to disable the constraints in your target AWS RDS Oracle, use the script below:

	
Select 'alter table '||a.owner||'.'||a.table_name||' disable constraint '||a.constraint_name||';'
    from all_constraints a, all_constraints b
    where a.constraint_type = 'R'
and a.r_constraint_name = b.constraint_name
and a.r_owner  = b.owner
and b.table_name = '&table_name';

The output will be something like this: (Example of the table TECHDATATB):
	
Enter value for table_name: TECHDATATB
old   6:   and b.table_name = '&table_name'
new   6:   and b.table_name = 'TECHDATATB'
  
'ALTERTABLE'||A.OWNER||'.'||A.TABLE_NAME||'DISABLECONSTRAINT'||A.CONSTRAINT_NAME||';'
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
alter table BRUNO.TECHDATA_KRTSE disable constraint TECHDATA_KRTSE_ID_FK;
alter table BRUNO.TECHDATA_RESW disable constraint FKTECHDATA_RESW7263s;
