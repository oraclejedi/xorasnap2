
-- xorasnap script to query the disks used by the source database
-- this script runs against the source ASM instance

select 'xorasnap asm disk,'||vac.db_name||','||vac.instance_name||','||vad.path MSG
from 
  v$asm_client vac, 
  v$asm_diskgroup vag, 
  v$asm_disk vad 
where 1=1 
and vad.group_number = vag.group_number 
and vac.group_number = vag.group_number 
and vac.status = 'CONNECTED' 
and vad.mount_status = 'CACHED' 
and vad.header_status = 'MEMBER' 
and vad.state = 'NORMAL'
/

