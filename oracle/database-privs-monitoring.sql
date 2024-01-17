--NB: The value of a username in Oracle is case-sensitive. In common case, the UPPER-CASE style should be used.
--Внимание: имя пользователя в Oracle чувствительно к регистру. В общем случае, рекомендуется использовать имена в ВЕРХНЕМ регистре.

--Obtaining information about system privileges granted to specific user
--Получение информации о системных привилегиях Oracle, назначенных конкретному пользователю
SELECT * FROM dba_sys_privs
WHERE grantee = 'USERNAME';

--Obtaining information about system roles granted to specific user
--Получение информации о ролях Oracle, назначенных конкретному пользователю
SELECT * FROM dba_role_privs
WHERE grantee = 'USERNAME';

--Obtaining information about table permitions granted to specific user
--Получение информации о правах на таблицы, выданные конкретному пользователю
SELECT * FROM dba_tab_privs
WHERE grantee = 'USERNAME';