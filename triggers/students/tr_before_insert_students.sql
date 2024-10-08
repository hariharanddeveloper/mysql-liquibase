-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_insert_students;

CREATE TRIGGER tr_before_insert_students
BEFORE INSERT ON students
FOR EACH ROW

BEGIN

    SET 
        NEW.student_id = fn_generate_unique_student_id(NEW.first_name, NEW.last_name),
        NEW.password = SHA2(NEW.password, 256);

END;
