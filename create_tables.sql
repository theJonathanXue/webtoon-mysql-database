CREATE TABLE Author (
    author_id INT AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (author_id)
);

CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT,
    genre_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (genre_id)
);

CREATE TABLE Webtoon (
    webtoon_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    rating DECIMAL(3, 2) NOT NULL,
    views INT NOT NULL,
    subscribers INT NOT NULL,
    likes INT NOT NULL,
    summary TEXT NOT NULL,
    url VARCHAR(255) NOT NULL,
    cover_url VARCHAR(255) NOT NULL,
    is_ongoing BOOLEAN NOT NULL,
    day_of_week VARCHAR(10),
    author_id INT,
    PRIMARY KEY (webtoon_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

CREATE TABLE Webtoon_Genre (
    webtoon_id INT,
    genre_id INT,
    FOREIGN KEY (webtoon_id) REFERENCES Webtoon(webtoon_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
    PRIMARY KEY (webtoon_id, genre_id)
);
