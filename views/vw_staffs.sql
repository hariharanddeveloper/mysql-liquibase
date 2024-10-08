-- liquibase formatted sql
-- changeset username:1

CREATE OR REPLACE VIEW 

`vw_staffs` AS

SELECT
    `STA`.`id` AS `Id`,
    `STA`.`user_id` AS `UserId`,
    `STA`.`staff_id` AS `StaffId`,
    CONCAT((`STA`.`first_name`), ' ', (`STA`.`last_name`)) AS `FullName`,
    `STA`.`designation` AS `Designation`,
    `STA`.`user_type_id` AS `UserTypeId`,
    `UTY`.`user_type_code` AS `UserTypeCode`,
    `UTY`.`user_type_name` AS `UserTypeName`,
    `STA`.`department_id` AS `DepartmentId`,
    `DEP`.`department_code` AS `DepartmentCode`,
    `DEP`.`department_name` AS `DepartmentName`
FROM
    `staffs` AS `STA`
LEFT JOIN 
    `usertypes` AS `UTY` ON `STA`.`user_type_id` = `UTY`.`id`
LEFT JOIN 
    `departments` AS `DEP` ON `STA`.`department_id` = `DEP`.`id`
ORDER BY
    `FullName` ASC;
