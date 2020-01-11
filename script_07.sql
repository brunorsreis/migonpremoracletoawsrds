-- For the capture and apply changes (CDC) you also need the following privileges:

	
SQL>
EXECUTE on DBMS_LOGMNR TO MIGUSERSOURCE;
SELECT on V_$LOGMNR_LOGS TO MIGUSERSOURCE;
SELECT on V_$LOGMNR_CONTENTS TO MIGUSERSOURCE;
