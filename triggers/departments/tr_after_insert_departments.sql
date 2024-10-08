-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_insert_departments;

CREATE TRIGGER tr_after_insert_departments 
AFTER INSERT ON departments 
FOR EACH ROW

BEGIN

    INSERT INTO
        `logs` (`action`, `new_value`)
    VALUES
        (
            'CREATE',
            JSON_OBJECT(
                'id', NEW.id,
                'department_code', NEW.department_code,
                'department_name', NEW.department_name,
                'created_at', NEW.created_at,
                'modified_at', NEW.modified_at
            )
        );

END;
