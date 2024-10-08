-- liquibase formatted sql
-- changeset username:1

INSERT INTO
    `departments` (`department_code`, `department_name`)
VALUES
    ('CSE', 'Computer Science Engineering'),
    ('ME', 'Mechanical Engineering'),
    ('EEE', 'Electrical and Electronics Engineering'), 
    ('CE', 'Civil Engineering'),
    ('ECE', 'Electronics and Communication Engineering')
ON DUPLICATE KEY UPDATE 
    `department_code` = VALUES(`department_code`),
    `department_name` = VALUES(`department_name`);
