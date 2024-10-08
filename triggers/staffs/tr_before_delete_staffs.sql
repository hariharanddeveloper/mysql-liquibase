-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_delete_staffs;

CREATE TRIGGER tr_before_delete_staffs
BEFORE DELETE ON staffs
FOR EACH ROW

BEGIN

END;
