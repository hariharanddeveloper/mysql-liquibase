-- liquibase formatted sql
-- changeset username:1

DROP TRIGGER IF EXISTS tr_before_insert_usertypes;

CREATE TRIGGER tr_before_insert_usertypes 
BEFORE INSERT ON usertypes 
FOR EACH ROW 

BEGIN 

END;
