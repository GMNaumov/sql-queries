--Create new user (schema) with login 'reader' and password 'passw0rd'
--Создаём нового пользователя с логином 'reader' и паролем 'passw0rd'
CREATE USER reader IDENTIFIED by passw0rd;

--Grant login permissions to the 'reader' user
--Даём пользователю 'reader' базовые права на подключение к базе
GRANT CREATE SESSION TO reader;

--Revoke login permissions from the 'reader' user
--Убираем у пользователя 'reader' права на подключение к базе
REVOKE CREATE SESSION FROM reader;

--Revoke ALL permissions from the 'reader' user
--Убираем у пользователя 'reader' все выданные ранее права
REVOKE ALL PRIVILEGES FROM reader;
