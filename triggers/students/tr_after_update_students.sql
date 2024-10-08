-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_update_students;

CREATE TRIGGER tr_after_update_students
AFTER UPDATE ON students
FOR EACH ROW

BEGIN

    INSERT INTO `logs` (`action`, `old_value`, `new_value`)
    VALUES (
        'UPDATE',
        JSON_OBJECT(
            'id', OLD.id,
            'user_id', OLD.user_id,
            'password', OLD.password,
            'student_id', OLD.student_id,
            'first_name', OLD.first_name,
            'last_name', OLD.last_name,
            'department_id', OLD.department_id,
            'created_at', OLD.created_at,
            'modified_at', OLD.modified_at
        ),
        JSON_OBJECT(
            'id', NEW.id,
            'user_id', NEW.user_id,
            'password', NEW.password,
            'student_id', NEW.student_id,
            'first_name', NEW.first_name,
            'last_name', NEW.last_name,
            'department_id', NEW.department_id,
            'created_at', NEW.created_at,
            'modified_at', NEW.modified_at
        )
    );

END;
