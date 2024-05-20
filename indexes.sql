-- Прости индекси
CREATE INDEX idx_movie_title ON Movies(title);

-- Съставени индекси
CREATE INDEX idx_user_movie_rating ON Ratings(user_id, movie_id);

-- Префиксни индекси
CREATE INDEX idx_user_email_prefix ON Users(email(10));
