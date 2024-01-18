--Grant select permission to specific table on different schema to the user 'reader'
--Даём пользователю 'reader' права на чтение конкретной таблицы из другой схемы БД
GRANT SELECT ON hr.locations TO reader;

--Grant several permissions (SELECT, ALTER) to specific table on different schema to the user 'reader' 
GRANT SELECT, UPDATE ON hr.locations TO reader;