-- Extract the DLL of the profiles and create it in your target database:

— Source database:

	
select dbms_metadata.get_ddl('PROFILE', profile) as profile_ddl
from   (select distinct profile
        from   dba_profiles)
where  profile like upper('%&1%');
