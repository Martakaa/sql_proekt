-- Създаване на роли
CREATE ROLE db_admin;
CREATE ROLE table_manager;
CREATE ROLE column_manager;

-- Привилегии за роли
GRANT ALL PRIVILEGES ON MovieRatingDB.* TO db_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON MovieRatingDB.Users TO table_manager;
GRANT SELECT (username, email) ON MovieRatingDB.Users TO column_manager;

-- Създаване на потребители и присвояване на роли
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_pass';
CREATE USER 'table_user'@'localhost' IDENTIFIED BY 'table_pass';
CREATE USER 'column_user'@'localhost' IDENTIFIED BY 'column_pass';

GRANT db_admin TO 'admin_user'@'localhost';
GRANT table_manager TO 'table_user'@'localhost';
GRANT column_manager TO 'column_user'@'localhost';
