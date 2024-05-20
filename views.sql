-- Изглед за средна оценка на филм
CREATE VIEW MovieAverageRatings AS
SELECT movie_id, AVG(rating) as avg_rating
FROM Ratings
GROUP BY movie_id;

-- Изглед за коментари на потребителите
CREATE VIEW UserComments AS
SELECT u.username, c.comment_text, c.created_at
FROM Comments c
JOIN Users u ON c.user_id = u.user_id;

-- Изглед за филми с жанрове
CREATE VIEW MoviesWithGenres AS
SELECT m.title, GROUP_CONCAT(g.name SEPARATOR ', ') as genres
FROM Movies m
JOIN MovieGenres mg ON m.movie_id = mg.movie_id
JOIN Genres g ON mg.genre_id = g.genre_id
GROUP BY m.movie_id;
