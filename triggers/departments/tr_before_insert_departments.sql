-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_insert_departments;

CREATE TRIGGER tr_before_insert_departments 
BEFORE INSERT ON departments 
FOR EACH ROW 

BEGIN 

END;
