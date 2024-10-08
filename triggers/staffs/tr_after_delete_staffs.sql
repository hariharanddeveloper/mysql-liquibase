-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_delete_staffs;

CREATE TRIGGER tr_after_delete_staffs
AFTER DELETE ON staffs
FOR EACH ROW

BEGIN

    INSERT INTO `logs` (`action`, `old_value`)
    VALUES (
        'DELETE',
        JSON_OBJECT(
            'id', OLD.id,
            'user_id', OLD.user_id,
            'password', OLD.password,
            'staff_id', OLD.staff_id,
            'first_name', OLD.first_name,
            'last_name', OLD.last_name,
            'designation', OLD.designation,
            'user_type_id', OLD.user_type_id,
            'department_id', OLD.department_id,
            'created_at', OLD.created_at,
            'modified_at', OLD.modified_at
        )
    );

END;
