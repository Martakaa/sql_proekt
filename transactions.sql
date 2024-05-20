START TRANSACTION;

-- Вмъкване на нов филм и свързаните жанрове
INSERT INTO Movies (title, release_year, director, duration) VALUES ('The Dark Knight Rises', 2012, 'Christopher Nolan', 165);
SET @new_movie_id = LAST_INSERT_ID();
INSERT INTO MovieGenres (movie_id, genre_id) VALUES (@new_movie_id, 2), (@new_movie_id, 4);

COMMIT;
