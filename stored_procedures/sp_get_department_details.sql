-- liquibase formatted sql
-- changeset username:1

DROP PROCEDURE IF EXISTS sp_get_department_details;

CREATE PROCEDURE sp_get_department_details_by_id ( IN department_id INT )

BEGIN

    SELECT
        `DEP`.`id` AS `DepartmentId`,
        `DEP`.`department_code` AS `DepartmentCode`,
        `DEP`.`department_name` AS `DepartmentName`,
        `DEP`.`created_at` AS `CreatedAt`,
        `DEP`.`modified_at` AS `ModifiedAt`
    FROM
        `departments` AS `DEP`
    WHERE
        `DEP`.`id` = department_id;

    SELECT * FROM `vw_staffs` WHERE `DepartmentId` = department_id;

    SELECT * FROM `vw_students` WHERE `DepartmentId` = department_id;

END;
