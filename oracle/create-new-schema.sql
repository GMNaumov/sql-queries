--Create new user (schema) with login 'reader' and password 'passw0rd'
CREATE USER reader IDENTIFIED by passw0rd;

--Grant login permissions to the 'reader' user
GRANT CREATE SESSION TO reader;

--Grant select permissions to specific table on different schema to the user 'reader'
GRANT SELECT ON hr.locations TO reader;