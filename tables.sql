CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Таблица за филми
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year YEAR NOT NULL
);

-- Таблица за жанрове
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Таблица за оценки
CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    rating TINYINT NOT NULL CHECK (rating >= 1 AND rating <= 10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Таблица за коментари
CREATE TABLE Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Таблица за много-към-много релация между филми и жанрове
CREATE TABLE MovieGenres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Вмъкване на данни
INSERT INTO Users (username, email, password) VALUES 
('john_doe', 'john@example.com', 'password123'),
('jane_smith', 'jane@example.com', 'password456'),
('bob_jones', 'bob@example.com', 'password789');

INSERT INTO Movies (title, release_year) VALUES 
('Inception', 2010),
('The Matrix', 1999),
('Interstellar', 2014);

INSERT INTO Genres (name) VALUES 
('Sci-Fi'),
('Action'),
('Drama');

INSERT INTO Ratings (user_id, movie_id, rating) VALUES 
(1, 1, 9),
(2, 2, 8),
(3, 3, 7);

INSERT INTO Comments (user_id, movie_id, comment_text) VALUES 
(1, 1, 'Amazing movie!'),
(2, 2, 'Mind-blowing!'),
(3, 3, 'Very thought-provoking.');

INSERT INTO MovieGenres (movie_id, genre_id) VALUES 
(1, 1),
(2, 1),
(3, 3);
