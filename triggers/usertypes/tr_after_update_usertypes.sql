-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_update_usertypes;

CREATE TRIGGER tr_after_update_usertypes 
AFTER UPDATE ON usertypes 
FOR EACH ROW

BEGIN

    INSERT INTO
        `logs` (`action`, `old_value`, `new_value`)
    VALUES
        (
            'UPDATE',
            JSON_OBJECT(
                'id', OLD.id,
                'user_type_code', OLD.user_type_code,
                'user_type_name', OLD.user_type_name,
                'created_at', OLD.created_at,
                'modified_at', OLD.modified_at
            ),
            JSON_OBJECT(
                'id', NEW.id,
                'user_type_code', NEW.user_type_code,
                'user_type_name', NEW.user_type_name,
                'created_at', NEW.created_at,
                'modified_at', NEW.modified_at
            )
        );

END;
