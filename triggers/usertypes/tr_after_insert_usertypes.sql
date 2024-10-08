-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_insert_usertypes;

CREATE TRIGGER tr_after_insert_usertypes 
AFTER INSERT ON usertypes 
FOR EACH ROW

BEGIN

    INSERT INTO
        `logs` (`action`, `new_value`)
    VALUES
        (
            'CREATE',
            JSON_OBJECT(
                'id', NEW.id,
                'user_type_code', NEW.user_type_code,
                'user_type_name', NEW.user_type_name,
                'created_at', NEW.created_at,
                'modified_at', NEW.modified_at
            )
        );

END;
