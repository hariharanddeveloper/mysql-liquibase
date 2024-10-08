-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_delete_departments;

CREATE TRIGGER tr_before_delete_departments 
BEFORE DELETE ON departments 
FOR EACH ROW

BEGIN

    DELETE FROM `staffs`
    WHERE
        `department_id` = OLD.id;

    DELETE FROM `students`
    WHERE
        `department_id` = OLD.id;

END;
