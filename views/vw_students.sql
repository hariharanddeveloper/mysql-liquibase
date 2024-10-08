-- liquibase formatted sql
-- changeset username:1

CREATE OR REPLACE VIEW

`vw_students` AS

SELECT
    `STU`.`id` AS `Id`,
    `STU`.`user_id` AS `UserId`,
    `STU`.`student_id` AS `StudentId`,
    CONCAT((`STU`.`first_name`), ' ', (`STU`.`last_name`)) AS `FullName`,
    `STU`.`department_id` AS `DepartmentId`,
    `DEP`.`department_code` AS `DepartmentCode`,
    `DEP`.`department_name` AS `DepartmentName`
FROM
    `students` AS `STU`
LEFT JOIN 
    `departments` AS `DEP` ON `STU`.`department_id` = `DEP`.`id`
ORDER BY
    `FullName` ASC;
