
-- xorasnap script to determine the status of all diskgroups of the ASM instance
-- this script runs against the target ASM instance

-- this is called during mVerifyTargetASMStatus

-- the purpose is to determine which ASM diskgroups and disks
-- are used by the target SID so they can be dismounted and dropped
-- and if any other SID is using them in which case an error is thrown

select
  distinct 'xorasnap asm diskgroup client,'||
  vad.name||','||
  dsk.name||','||
  nvl(myvdi.dbname,'ASM')||','||
  nvl(myvdi.instname,'ASM') MSG
from
  v$instance vi,
  v$asm_disk dsk,
  v$asm_diskgroup vad,
  ( select
    vdi.group_number,
    vdi.dbname,
    decode(vdi.instname,vi.instance_name,'ASM',vdi.instname) instname
  from
    v$instance vi,
    v$asm_disk_iostat vdi ) myvdi
where 1=1
and dsk.group_number = vad.group_number
and dsk.group_number = myvdi.group_number(+)
--
union all
--
select
  'xorasnap asm diskgroup client,,,,,'
from dual
where not exists ( select 1 from v$asm_diskgroup )
/
