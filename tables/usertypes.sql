-- liquibase formatted sql
-- changeset username:1

CREATE TABLE IF NOT EXISTS
    `usertypes` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `user_type_code` VARCHAR(25) NOT NULL,
        `user_type_name` VARCHAR(100) NOT NULL,
        `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        `modified_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT `uk_user_type_code` UNIQUE (`user_type_code`),
        CONSTRAINT `uk_user_type_name` UNIQUE (`user_type_name`)
    );
