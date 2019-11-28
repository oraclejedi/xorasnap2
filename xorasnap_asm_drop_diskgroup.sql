
-- xorasnap script to drop ASM disk groups
-- this script runs against the target ASM instance
-- bind variables are swapped at run time

drop diskgroup {ARG0} force including contents;
