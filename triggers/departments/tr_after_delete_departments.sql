-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_delete_departments;

CREATE TRIGGER tr_after_delete_departments 
AFTER DELETE ON departments 
FOR EACH ROW

BEGIN

    INSERT INTO
        `logs` (`action`, `old_value`)
    VALUES
        (
            'DELETE',
            JSON_OBJECT(
                'id', OLD.id,
                'department_code', OLD.department_code,
                'department_name', OLD.department_name,
                'created_at', OLD.created_at,
                'modified_at', OLD.modified_at
            )
        );

END;
