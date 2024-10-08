-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_update_usertypes;

CREATE TRIGGER tr_before_update_usertypes 
BEFORE UPDATE ON usertypes 
FOR EACH ROW 

BEGIN 

    SET
        NEW.modified_at = NOW();

END;
