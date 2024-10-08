-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_delete_usertypes;

CREATE TRIGGER tr_before_delete_usertypes 
BEFORE DELETE ON usertypes 
FOR EACH ROW

BEGIN

    DELETE FROM `staffs`
    WHERE
        `user_type_id` = OLD.id;

END;
