--Create new user (schema) with login 'reader' and password 'passw0rd'
--Создаём нового пользователя с логином 'reader' и паролем 'passw0rd'
CREATE USER reader IDENTIFIED by passw0rd;

--Grant login permissions to the 'reader' user
--Даём пользователю 'reader' базовые права на подключение к базе
GRANT CREATE SESSION TO reader;

--Grant select permissions to specific table on different schema to the user 'reader'
--Даём пользователю 'reader' права на чтение конкретной таблицы из другой схемы БД
GRANT SELECT ON hr.locations TO reader;