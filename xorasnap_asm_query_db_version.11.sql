
-- xorasnap script to query the database versions of the source systems
-- this script runs against the source ASM instance

select 
  distinct 'xorasnap asm version,'||
  decode(vac.instance_name,vi.instance_name,'ASM',vac.db_name)||','||
  decode(vac.instance_name,vi.instance_name,'ASM',vac.instance_name)||','||
  vac.software_version MSG 
from 
  v$asm_client vac,
  v$instance vi;



