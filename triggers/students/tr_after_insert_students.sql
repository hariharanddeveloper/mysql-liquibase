-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_insert_students;

CREATE TRIGGER tr_after_insert_students
AFTER INSERT ON students
FOR EACH ROW

BEGIN

    INSERT INTO `logs` (`action`, `new_value`)
    VALUES (
        'CREATE',
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
