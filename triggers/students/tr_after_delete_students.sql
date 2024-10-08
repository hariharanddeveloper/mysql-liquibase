-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_after_delete_students;

CREATE TRIGGER tr_after_delete_students
AFTER DELETE ON students
FOR EACH ROW

BEGIN

    INSERT INTO `logs` (`action`, `old_value`)
    VALUES (
        'DELETE',
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
        )
    );

END;
