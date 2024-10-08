-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_update_departments;

CREATE TRIGGER tr_before_update_departments 
BEFORE UPDATE ON departments 
FOR EACH ROW 

BEGIN 

    SET
        NEW.modified_at = NOW();

END;
