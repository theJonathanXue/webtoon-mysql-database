CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT,
    genre_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (genre_id)
);

CREATE TABLE Webtoon (
    webtoon_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    rating DECIMAL(3, 2) NOT NULL,
    views INT,
    subscribers INT NOT NULL,
    likes INT NOT NULL,
    summary TEXT,
    url VARCHAR(255) NOT NULL,
    webtoon_img_url VARCHAR(255) NOT NULL,
    google_img_url VARCHAR(255) NOT NULL,
    is_ongoing BOOLEAN,
    day_of_week VARCHAR(10),
    PRIMARY KEY (webtoon_id),
);

CREATE TABLE Webtoon_Genre (
    webtoon_id INT,
    genre_id INT,
    FOREIGN KEY (webtoon_id) REFERENCES Webtoon(webtoon_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
    PRIMARY KEY (webtoon_id, genre_id)
);
