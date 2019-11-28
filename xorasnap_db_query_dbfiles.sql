
-- xorasnap script to get the file structure from the source database
-- this script is called if auto-discover is enabled

-- this script runs against the source DB instance

select 'xorasnap db file,controlfile_list,'||name||',0,0' MSG 
from v$controlfile
union all
select 'xorasnap db file,logfile_list,'||member||',0,0' MSG 
from v$logfile
union all
select 'xorasnap db file,datafile_list,'||vf.name||','||vt.name||','||(vf.bytes/1024) MSG 
from 
  v$datafile vf,
  v$tablespace vt
where vf.ts# = vt.ts#
union all
select 'xorasnap db file,tempfile_list,'||vf.name||','||vt.name||','||(vf.bytes/1024) MSG 
from 
  v$tempfile vf,
  v$tablespace vt
where vf.ts# = vt.ts#
union all
select 'xorasnap db file,cfd,'||vp.value||',0,0'
from v$parameter vp
where vp.name = 'db_create_file_dest'
union all
select 'xorasnap db file,rfd,'||vp.value||',0,0'
from v$parameter vp
where vp.name = 'db_recovery_file_dest'
/


