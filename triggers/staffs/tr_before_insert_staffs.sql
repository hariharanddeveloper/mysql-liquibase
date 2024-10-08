-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_insert_staffs;

CREATE TRIGGER tr_before_insert_staffs
BEFORE INSERT ON staffs
FOR EACH ROW

BEGIN

    SET 
        NEW.staff_id = fn_generate_unique_staff_id(NEW.first_name, NEW.last_name),
        NEW.password = SHA2(NEW.password, 256);

END;
