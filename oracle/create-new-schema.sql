--Create new user (schema) with login 'reader' and password 'passw0rd'
--Создаём нового пользователя с логином 'reader' и паролем 'passw0rd'
CREATE USER reader IDENTIFIED by passw0rd;

--Grant login permissions to the 'reader' user
--Даём пользователю 'reader' базовые права на подключение к базе
GRANT CREATE SESSION TO reader;

