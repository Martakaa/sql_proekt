DELIMITER //

CREATE TRIGGER before_user_insert
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    SET NEW.username = LOWER(NEW.username);
END //

CREATE TRIGGER after_rating_insert
AFTER INSERT ON Ratings
FOR EACH ROW
BEGIN
    UPDATE Movies 
    SET avg_rating = (
        SELECT AVG(rating) FROM Ratings WHERE movie_id = NEW.movie_id
    ) 
    WHERE movie_id = NEW.movie_id;
END //

CREATE TRIGGER before_rating_update
BEFORE UPDATE ON Ratings
FOR EACH ROW
BEGIN
    IF NEW.rating < 1 OR NEW.rating > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rating must be between 1 and 10';
    END IF;
END //

CREATE TRIGGER after_comment_update
AFTER UPDATE ON Comments
FOR EACH ROW
BEGIN
    UPDATE Comments 
    SET updated_at = CURRENT_TIMESTAMP 
    WHERE comment_id = NEW.comment_id;
END //

DELIMITER ;
