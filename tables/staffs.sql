-- liquibase formatted sql
-- changeset username:1

CREATE TABLE IF NOT EXISTS
    `staffs` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `user_id` VARCHAR(25) NOT NULL,
        `password` TEXT NOT NULL,
        `staff_id` VARCHAR(6) NOT NULL,
        `first_name` VARCHAR(50) NOT NULL,
        `last_name` VARCHAR(50) NOT NULL,
        `designation` TEXT NOT NULL,
        `user_type_id` INT NOT NULL,
        `department_id` INT NOT NULL,
        `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        `modified_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT `uk_user_id` UNIQUE (`user_id`),
        CONSTRAINT `uk_staff_id` UNIQUE (`staff_id`),
        CONSTRAINT `fk_staffs_usertypes` FOREIGN KEY (`user_type_id`) REFERENCES `usertypes` (`id`),
        CONSTRAINT `fk_staffs_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
    );
