-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_delete_students;

CREATE TRIGGER tr_before_delete_students
BEFORE DELETE ON students
FOR EACH ROW

BEGIN

END;
