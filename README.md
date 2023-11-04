# webtoon-mysql-database
MySQL database component of full-stack webtoons analytics application

# MySQL vs PostgreSQL
I referenced several resources including these videos from IBM techonology [comparing the two technologies](https://www.youtube.com/watch?v=btjBNKP49Rk) and also explaining [MySQL](https://www.youtube.com/watch?v=UO-yT7Ugnls)

I decided to go with MySQL as it is excellent for web applications, its ease of use, speed and scalability. I also wanted to learn another relational database besides PostgreSQL which I have used before.

# Database schema
1. Table: Webtoons:

Contains data directly related to each webtoon, such as title, summary, number of episodes, and release date, without any repeating groups or multivalued dependencies.
2. Table: Authors:

Stores author information separately, preventing redundant storage of author data for each webtoon.
3. Table: Genres:

Maintains a separate table for genres, enabling the storage of unique genre data and preventing redundant genre information for each webtoon.
4. Table: Webtoon_Authors (Many-to-Many Relationship):

Establishes a separate table to manage the many-to-many relationship between webtoons and authors, preventing data duplication and enabling efficient storage of author relationships.
5. Table: Webtoon_Genres (Many-to-Many Relationship):

Manages the many-to-many relationship between webtoons and genres, ensuring that each genre is stored only once and linked to multiple webtoons as needed.
6. Table: Metrics:

Stores the various metrics related to each webtoon, maintaining a separate table for metrics while linking them to the corresponding webtoons via foreign keys.

