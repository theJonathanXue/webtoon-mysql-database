# webtoon-mysql-database
MySQL database component of full-stack webtoons analytics application

# MySQL vs PostgreSQL
I referenced several resources including these videos from IBM techonology [comparing the two technologies](https://www.youtube.com/watch?v=btjBNKP49Rk) and also explaining [MySQL](https://www.youtube.com/watch?v=UO-yT7Ugnls)

I decided to go with MySQL as it is excellent for web applications, its ease of use, speed and scalability. I also wanted to learn another relational database besides PostgreSQL which I have used before.

# Database schema
| Table Name   | Field        | Type          | Description                            |
|--------------|--------------|---------------|----------------------------------------|
| Author       | author_id    | INT           | Unique author ID                       |
|              | author_name  | VARCHAR(255)  | Name of the author                     |
|--------------|--------------|---------------|----------------------------------------|
| Genre        | genre_id     | INT           | Unique genre ID                        |
|              | genre_name   | VARCHAR(255)  | Genre name                             |
|--------------|--------------|---------------|----------------------------------------|
| Webtoon      | webtoon_id   | INT           | Unique webtoon ID                      |
|              | title        | VARCHAR(255)  | Title of the webtoon                   |
|              | rating       | DECIMAL(3, 2) | Webtoon rating                         |
|              | views        | INT           | Number of views                        |
|              | subscribers  | INT           | Number of subscribers                  |
|              | likes        | INT           | Number of likes                        |
|              | summary      | TEXT          | Summary of the webtoon                 |
|              | url          | VARCHAR(255)  | URL to the webtoon                     |
|              | cover_url    | VARCHAR(255)  | URL to the webtoon cover               |
|              | is_ongoing   | BOOLEAN       | Indicates if the webtoon is ongoing or not |
|              | day_of_week  | VARCHAR(10)   | Day of the week the webtoon is updated (if ongoing) |
|              | author_id    | INT           | Foreign key referencing the Author table |
|--------------|--------------|---------------|----------------------------------------|
| Webtoon_Genre| webtoon_id   | INT           | Foreign key referencing the Webtoon table |
|              | genre_id     | INT           | Foreign key referencing the Genre table  |

# Challenges
- setting up MySQL path, resolved with the help of stack overflow: https://stackoverflow.com/questions/5920136/mysql-is-not-recognised-as-an-internal-or-external-command-operable-program-or-b
