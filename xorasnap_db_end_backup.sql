
-- xorasnap script to take the source database out of backup mode
-- this script runs against the DB instance
-- bind variables are swapped at run time

alter database end backup;

with myview as ( 
  select count(*) mycount 
  from v$backup where status != 'NOT ACTIVE' 
) 
select '{SCRIPT_ERROR}: '||mycount||' tablespace(s) are still in backup mode' MSG 
from myview where mycount > 0;

