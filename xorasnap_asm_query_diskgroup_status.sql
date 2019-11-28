
-- xorasnap script to query the diskgroups 
-- this script runs against the target ASM instance

-- this script is used to verify that a diskgroup was mounted or dismounted

select 'xorasnap asm dg status,'||vad.name||','||vad.state MSG
from 
  v$asm_diskgroup vad 
order by 1;


