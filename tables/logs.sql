-- liquibase formatted sql
-- changeset username:1

CREATE TABLE IF NOT EXISTS
    `logs` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `action` ENUM('CREATE', 'UPDATE', 'DELETE') NOT NULL,
        `old_value` TEXT DEFAULT NULL,
        `new_value` TEXT DEFAULT NULL,
        `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
