In the “as-is” migration, I like to get all the grants from the source and also apply it in the target and after work in the security for each user but this is just an optional step.
If you also would like to get all grants from your source and apply to your target, here it is:

— Source database:

	
SELECT t0.INSTANCE_NAME||' ' || t0.HOST_NAME||' ' || t0.VERSION|| ' '||t0.STATUS Comando from V$instance t0
 union all
 select 'grant '||t.privilege|| ' on '||t.owner||'.'||t.table_name||' to '||grantee
 ||case when t.grantable = 'YES' then ' with grant option' else null end
 ||';'
 from dba_tab_privs t
 WHERE grantee not in ('DBA','PUBLIC','IMP_FULL_DATABASE','SELECT_CATALOG_ROLE',
'EXECUTE_CATALOG_ROLE','ORACLE_OCM','SRVMON','AQ_ADMINISTRATOR_ROLE','APPQOSSYS','EXP_FULL_DATABASE','ADM_PARALLEL_EXECUTE_TASK','DBFS_ROLE','GATHER_SYSTEM_STATISTICS','SYSTEM','DELETE_CATALOG_ROLE','XDB','WMSYS','EXFSYS','DATAPUMP_EXP_FULL_DATABASE','DATAPUMP_IMP_FULL_DATABASE','RECOVERY_CATALOG_OWNER','SYS','AQ_USER_ROLE','HS_ADMIN_SELECT_ROLE','OEM_MONITOR','LOGSTDBY_ADMINISTRATOR','DBSNMP','XDBADMIN','WM_ADMIN_ROLE','RESOURCE','CONNECT')
 Union all
 select 'grant '||t1.privilege||' to '||grantee
 ||case when t1.admin_option = 'YES' then ' with grant option' else null end
 ||';'
 from dba_sys_privs t1
 WHERE grantee not in ('DBA','PUBLIC','IMP_FULL_DATABASE','SELECT_CATALOG_ROLE',
'EXECUTE_CATALOG_ROLE','ORACLE_OCM','SRVMON','AQ_ADMINISTRATOR_ROLE','APPQOSSYS','EXP_FULL_DATABASE','ADM_PARALLEL_EXECUTE_TASK','DBFS_ROLE','GATHER_SYSTEM_STATISTICS','SYSTEM','DELETE_CATALOG_ROLE','XDB','WMSYS','EXFSYS','DATAPUMP_EXP_FULL_DATABASE',
'DATAPUMP_IMP_FULL_DATABASE','RECOVERY_CATALOG_OWNER','SYS','AQ_USER_ROLE','HS_ADMIN_SELECT_ROLE','OEM_MONITOR','LOGSTDBY_ADMIN
