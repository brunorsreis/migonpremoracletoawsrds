You also need to give a grant of SELECT on all tables to be migrated to the user MIGUSERSOURCE and for this permission, I have created this procedure:
	
CREATE PROCEDURE GIVEGRANTSELECT(
username VARCHAR2,
grantee VARCHAR2)
AS
BEGIN
FOR tech IN (
SELECT owner, table_name
FROM all_tables
WHERE owner = username
)
LOOP
EXECUTE IMMEDIATE
'GRANT SELECT ON '||tech.owner||'.'||tech.table_name||' to ' || grantee;
END LOOP;
END;
/

You will be asked to provide the name of the user that you want these grants to be given and in our case, it is the user: MIGUSERSOURCE.
The output will be something like this:

	
EXEC grant_select('TABLE1','MIGUSERSOURCE');
EXEC grant_select('TABLE2','MIGUSERSOURCE');
