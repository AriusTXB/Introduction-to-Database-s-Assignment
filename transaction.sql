USE csdl;

START TRANSACTION;

INSERT INTO Users (name, email, password, date_joined) 
VALUES ('Test User', 'test.user@example.com', 'testpassword123', '2024-12-11');

ROLLBACK;