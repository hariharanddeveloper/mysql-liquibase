-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_update_students;

CREATE TRIGGER tr_before_update_students
BEFORE UPDATE ON students
FOR EACH ROW

BEGIN

    SET 
        NEW.password = IF(NEW.password <> OLD.password, SHA2(NEW.password, 256), OLD.password),
        NEW.modified_at = NOW();

END;
