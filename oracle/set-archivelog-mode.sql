--Изменение режима архивирования логов в базе данных Oracle. Выполняется в командной строке от имени администратора
chcp 1251
SET ORACLE_SID=XE --Устанавливаем значение экземпляра Oracle, в котором будет меняться режим работы
sqlplus / as sysdba
--Вводим учётные данные system...
shutdown immediate;
startup mount;
ALTER DATABASE archivelog;
ALTER DATABASE open;