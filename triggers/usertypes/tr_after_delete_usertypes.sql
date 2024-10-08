-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_delete_usertypes;

CREATE TRIGGER tr_after_delete_usertypes 
AFTER DELETE ON usertypes 
FOR EACH ROW

BEGIN

    INSERT INTO
        `logs` (`action`, `old_value`)
    VALUES
        (
            'DELETE',
            JSON_OBJECT(
                `id`, OLD.id,
                `user_type_code`, OLD.user_type_code,
                `user_type_name`, OLD.user_type_name,
                `created_at`, OLD.created_at,
                `modified_at`, OLD.modified_at
            )
        );

END;
