-- Modo de funcionamiento de la base
SELECT name, log_mode, open_mode
FROM   v$database;

-- Grupos de redo online
SELECT group#, sequence#, bytes / 1024 / 1024 AS mb, members, status, archived
FROM   v$log
ORDER  BY group#;

-- Archivos físicos de cada grupo
SELECT group#, type, member
FROM   v$logfile
ORDER  BY group#;

-- Ubicación de las copias archivadas
SELECT name, value
FROM   v$parameter
WHERE  name IN ('db_recovery_file_dest', 'db_recovery_file_dest_size',
                'log_archive_dest_1');

-- EJEMPLO PRÁCTICO: forzar un cambio de grupo (log switch)
SELECT group#, sequence#, status, archived
FROM   v$log
ORDER  BY group#;

ALTER SYSTEM SWITCH LOGFILE;

EXEC DBMS_SESSION.SLEEP(3);

SELECT group#, sequence#, status, archived
FROM   v$log
ORDER  BY group#;

-- Verificar la copia generada en V$ARCHIVED_LOG
SELECT sequence#, first_time, name
FROM   v$archived_log
WHERE  name IS NOT NULL
ORDER  BY sequence# DESC
FETCH FIRST 5 ROWS ONLY;