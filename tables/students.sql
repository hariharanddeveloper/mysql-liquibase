-- liquibase formatted sql
-- changeset username:1

CREATE TABLE IF NOT EXISTS
    `students` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `user_id` VARCHAR(25) NOT NULL,
        `password` TEXT NOT NULL,
        `student_id` VARCHAR(6) NOT NULL,
        `first_name` VARCHAR(50) NOT NULL,
        `last_name` VARCHAR(50) NOT NULL,
        `department_id` INT NOT NULL,
        `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        `modified_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT `uk_user_id` UNIQUE (`user_id`),
        CONSTRAINT `uk_student_id` UNIQUE (`student_id`),
        CONSTRAINT `fk_students_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
    );
