-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_update_departments;

CREATE TRIGGER tr_after_update_departments 
AFTER UPDATE ON departments 
FOR EACH ROW

BEGIN

    INSERT INTO
        `logs` (`action`, `old_value`, `new_value`)
    VALUES
        (
            'UPDATE',
            JSON_OBJECT(
                'id', OLD.id,
                'department_code', OLD.department_code,
                'department_name', OLD.department_name,
                'created_at', OLD.created_at,
                'modified_at', OLD.modified_at
            ),
            JSON_OBJECT(
                'id', NEW.id,
                'department_code', NEW.department_code,
                'department_name', NEW.department_name,
                'created_at', NEW.created_at,
                'modified_at', NEW.modified_at
            )
        );

END;
