 
-- xorasnap script to place the source database into backup mode 
-- this script runs against the DB instance
-- bind variables are swapped at run time

with myview as ( 
  select 1 log_mode 
  from v$database 
  where log_mode != 'ARCHIVELOG' 
) 
select '{SCRIPT_ERROR}: database is not in archivelog mode - database quiesce not possible' MSG 
from myview;

alter database begin backup;

with myview as ( 
  select count(*) mycount 
  from v$backup 
  where status != 'ACTIVE' 
) 
select '{SCRIPT_ERROR}: '||mycount||' tablespace(s) are not in backup mode' MSG 
from myview where mycount > 0;

