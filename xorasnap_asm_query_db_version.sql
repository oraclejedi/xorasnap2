
-- xorasnap script to query the database versions of the source systems
-- this is for 12c systems as the ASM instance does not show up in the ASM_CLIENT view anymore
-- this script runs against the source ASM instance

select 
  distinct 'xorasnap asm version,'||
  decode(vac.instance_name,vi.instance_name,'ASM',vac.db_name)||','||
  decode(vac.instance_name,vi.instance_name,'ASM',vac.instance_name)||','||
  vac.software_version MSG 
from 
  v$asm_client vac,
  v$instance vi
union all
select
  'xorasnap asm version,ASM,ASM,'||version
from v$instance
/
