
-- xorasnap script to get the source database name
-- this is required if the database is to be renamed

-- this script runs against the source DB instance as the first step of auto-discover

select 'xorasnap db name,'||vd.name||','||vi.instance_name||','||vd.log_mode||','||vi.version||','||p1.value||','||p2.value MSG
from 
  v$database vd,
  v$instance vi,
  v$parameter p1,
  v$parameter p2
where 1=1
and p1.name = 'db_create_file_dest'
and p2.name = 'db_recovery_file_dest'
/



