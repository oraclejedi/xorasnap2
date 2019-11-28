
-- query the status of the database

-- this is called by mChangeDatabaseStatus to verify the state of the database
-- executed against the target database

select 'xorasnap db status,'||status MSG from v$instance;

