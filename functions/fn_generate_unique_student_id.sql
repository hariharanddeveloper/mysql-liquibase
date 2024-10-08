-- liquibase formatted sql
-- changeset username:1

DROP FUNCTION IF EXISTS fn_generate_unique_student_id;

CREATE FUNCTION fn_generate_unique_student_id (first_name VARCHAR(50), last_name VARCHAR(50)) 
RETURNS VARCHAR(6) DETERMINISTIC

BEGIN 
    
    DECLARE student_id VARCHAR(6);
    DECLARE random_num INT;
    DECLARE id_exists INT DEFAULT 1;

    SET
        random_num = FLOOR(1000 + RAND() * 9000),
        student_id = CONCAT(UPPER(LEFT (first_name, 1)), UPPER(LEFT (last_name, 1)), random_num);

    RETURN student_id;

END;
