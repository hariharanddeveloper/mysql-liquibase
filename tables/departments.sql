-- liquibase formatted sql
-- changeset username:1

CREATE TABLE IF NOT EXISTS
    `departments` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `department_code` VARCHAR(25) NOT NULL,
        `department_name` VARCHAR(100) NOT NULL,
        `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        `modified_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT `uk_department_code` UNIQUE (`department_code`),
        CONSTRAINT `uk_department_name` UNIQUE (`department_name`)
    );
