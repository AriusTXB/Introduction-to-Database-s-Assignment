-- PROCEDURE: get users by subscription type
USE csdl;

DELIMITER $$

CREATE PROCEDURE GetUsersBySubscription(IN subscription_type VARCHAR(50))
BEGIN
    SELECT u.*
    FROM Users u
    JOIN Subscriptions s ON s.user_id = u.user_id
    WHERE s.subscription_type = subscription_type;
END$$

DELIMITER ;


CALL GetUsersBySubscription("Free");
