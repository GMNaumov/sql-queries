--Show all active processes
EXEC sp_who2 'active';

--Duplicate a table between two databases
SELECT * INTO 
    [DATABASE_NAME].[SCHEMA_NAME].[NEW_TABLE_NAME] 
FROM 
    [DATABASE_NAME].[SCHEMA_NAME].[OLD_TABLE_NAME]