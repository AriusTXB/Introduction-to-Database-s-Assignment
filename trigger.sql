-- TRIGGER: automatically set date_joined to the current date when a new user is added
USE csdl;

DELIMITER $$

CREATE TRIGGER set_date_joined
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN

    IF NEW.date_joined IS NULL THEN
        SET NEW.date_joined = CURDATE();
    END IF;
END$$

DELIMITER ;
