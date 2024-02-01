--Однажды, в студёную зимнюю пору
--Мне потребовалось создавать публичные синонимы для всех новых таблиц в схеме

--...для этого в схеме была создана отдельная таблица, в которую писались все события создания новых таблиц
CREATE TABLE ngm_created_tables (
    operation   VARCHAR2(30),
    obj_owner   VARCHAR2(30),
    object_name VARCHAR2(30),
    object_type VARCHAR2(130),
    attempt_by  VARCHAR2(30),
    attempt_dt  DATE,
    status      VARCHAR2(100)
);

--...затем был создан триггер, который добавлял записи в эту таблицу
CREATE OR REPLACE TRIGGER ngm_add_created_table AFTER DDL ON SCHEMA DECLARE
    v_event     VARCHAR2(200);
    v_obj_type  VARCHAR2(200);
    v_obj_name  VARCHAR2(200);
    v_obj_owner VARCHAR2(200);
BEGIN
    IF
        ora_sysevent = 'CREATE'
        AND ora_dict_obj_type = 'TABLE'
    THEN
        INSERT INTO ngm_created_tables (
            operation,
            obj_owner,
            object_name,
            object_type,
            attempt_by,
            attempt_dt,
            status
        )
            SELECT
                ora_sysevent,
                ora_dict_obj_owner,
                ora_dict_obj_name,
                ora_dict_obj_type,
                user,
                sysdate,
                'NEW'
            FROM
                dual;   
    END IF;
END;

--...а затем была создана процедура, которая выполнялась в JOB-е каждые 5 минут, читала данные из таблицы и создавала новые публичные синонимы
DECLARE 
  v_str VARCHAR2 (2000);
  v_str2 VARCHAR2 (2000);
BEGIN
  for rc in (SELECT t.*, t.rowid row_id FROM ngm_created_tables t WHERE t.status = 'NEW')
  LOOP
    v_str := 'CREATE OR REPLACE PUBLIC SYNONYM ' ||  rc.object_name ||  ' FOR ' ||  rc.object_name;
    v_str2 := 'GRANT SELECT ON ' ||  rc.object_name || ' TO reader';
    
    
    dbms_output.put_line (v_str);
    execute immediate (v_str);

    dbms_output.put_line (v_str2);
    execute immediate (v_str2);

    UPDATE ngm_created_tables t
    SET t.status = 'DONE'
    WHERE t.rowid = rc.row_id;
    null;
  END LOOP;
END;

--так вот и четверг прошёл