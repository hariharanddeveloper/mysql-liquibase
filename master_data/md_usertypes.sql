-- liquibase formatted sql
-- changeset username:1

INSERT INTO `usertypes` (`user_type_code`, `user_type_name`)
VALUES
    ('ASSTPROF', 'Assistant Professor'),
    ('PROF', 'Professor'),
    ('HOD', 'Head of the Department'),
    ('DEAN', 'Dean'),
    ('PRINC', 'Principal'),
    ('VICEPRINC', 'Vice Principal'),
    ('LIBR', 'Librarian'),
    ('LABTECH', 'Lab Technician'),
    ('PLACEOFFICER', 'Placement Officer')
ON DUPLICATE KEY UPDATE 
    `user_type_code` = VALUES(`user_type_code`),
    `user_type_name` = VALUES(`user_type_name`);
