
-- xorasnap script to rename the controlfiles of the target database
-- this script runs against the target DB instance
-- bind variables are swapped at run time

-- set the location of the new controlfiles  in the spfile
alter system set control_files={ARG0} scope=spfile;

-- set the database name to the one found in the source database
-- in case it was previously renamed
alter system set db_name={ARG1} scope=spfile;

-- set the instance name to the one specified for the target
alter system set instance_name={ARG2} scope=spfile;

-- set the create file dest
alter system set db_create_file_dest='{ARG3}' scope=spfile;

-- set the recovery dest
alter system set db_recovery_file_dest='{ARG4}' scope=spfile;

-- set the unique name
alter system set db_unique_name={ARG1}_{ARG2} scope=spfile;

