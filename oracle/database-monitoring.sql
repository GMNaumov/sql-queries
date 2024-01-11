--Obtaining basic information about user sessions
--Получение базовой информации о пользовательских сессиях
SELECT sid, username, status, schemaname, osuser, machine, program FROM v$session;

--Obtaining basic information about Oracle instance
--Получение базовой информации об экземпляре Oracle
SELECT dbid, name, log_mode FROM V$DATABASE;

--Obtaining Oracle version information
--Получение информации о версии СУБД Oracle
SELECT * FROM v$version;

--Директории операционной системы, используемые Oracle для хранения файлов
SELECT * FROM dba_directories;