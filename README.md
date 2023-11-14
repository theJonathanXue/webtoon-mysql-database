# webtoon-mysql-database
MySQL database component of full-stack webtoons analytics application

A challenge I faced here was deciding between using a relational vs. non-relational database.

The database for this project is responsible for storing Webtoon metrics and metadata. Currently I have scraped metrics such as rating, views, and subscribed count. Each webtoon can belong to multiple genres. In the future I might also want to add other metadata such as a summary for each webtoon, number of episodes, author, and release date.

With this in mind, I want a database that is suitable for my data schema, scalable, performant and flexible. 

Comparing the pros and cons of using a relational vs. non-relational database for webtoon data:
| Aspect | Relational Database | Non-Relational Database |
| --- | --- | --- |
| **Structured Data** | Suitable for storing structured data such as webtoon summaries, author details, etc. | Offers schema flexibility, allowing storage of unstructured or semi-structured data. |
| **Data Integrity** | Maintains ACID compliance for data integrity and referential integrity. | Sacrifices some level of ACID compliance for scalability and flexibility. |
| **Complex Queries** | Offers powerful querying capabilities for complex operations and analysis. | May not offer the same level of query complexity as relational databases. |
| **Relational Data** | Excels at managing data with well-defined relationships. | Well-suited for handling dynamic data and metrics like ratings and views. |
| **Schema Rigidity** | Requires a predefined schema, making it less flexible for dynamic data. | Provides schema flexibility, allowing accommodation of evolving webtoon metrics. |
| **Scalability Challenges** | Scaling horizontally can be complex and expensive. | Highly scalable, suitable for handling high volumes of dynamic data. |
| **High Performance** | Well-suited for traditional workloads and complex operations. | Designed for high-performance read and write operations for dynamic data. |
| **Dynamic Data** | Limited flexibility for accommodating dynamic data changes. | Well-suited for storing evolving metrics like ratings, views, and subscribed counts. |

I decided to go with a relational database since I have decided on the structure of my data and defined the relationships. I went with a MySQL database as I've been wanting to work with another relational database other than PostgreSQL.

# MySQL vs PostgreSQL
I referenced several resources including these videos from IBM techonology [comparing the two technologies](https://www.youtube.com/watch?v=btjBNKP49Rk) and also explaining [MySQL](https://www.youtube.com/watch?v=UO-yT7Ugnls)

I decided to go with MySQL as it is excellent for web applications, its ease of use, speed and scalability. I also wanted to learn another relational database besides PostgreSQL which I have used before.

# Database schema
| Table Name   | Field        | Type          | Description                            |
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
|--------------|--------------|---------------|----------------------------------------|
| Webtoon_Genre| webtoon_id   | INT           | Foreign key referencing the Webtoon table |
|              | genre_id     | INT           | Foreign key referencing the Genre table  |

# Database creation
To create my MySQL database, I installed MySQL locally on my windows PC and created the "webtoon" database from the command line. 

Next, I installed the SQLtools extension on Visual Studio Code. After creating a connection to my database I ran my SQL scripts for creating tables and indexes.

Then I scraped [webtoon.com](https://www.webtoons.com/en/genres) for all possible genres and inserted them into the Genre table.

After that I scraped all webtoons for their author as well as all the other metrics and metadata, and inserted them into their respective tables.

With the scraping and inserting complete, I was finally ready to move on to implementing my backend.

# Creating indexes
I've decided to not get ahead of myself and leave optimizing my database to after setting up the foundation of my backend. 

# Monthly snapshots of Webtoon data
To be able to compare changes in Webtoon data and track how Webtoon.com as a platform grows its library, I want to take a monthly snapshot of my data.

To do this, I have decided to create a Historical_Webtoon table that has a snapshot_date for the date it was taken. The main focus is on the month and year. Data will be scraped the first day of everymonth and a snapshot of the data will be created immediately. 

This is perfect as a prototype as it provides a simpler setup, reducing the complexity of managing multiple databases.

Another possible approach would be to create a cold database to act as a data warehouse that only contains historical data for analysis and reporting. I think I would take this approach if I needed to optimize my main database and store a large volumn of data for long-term data retention, compliance, and archival purposes.

# User accounts
I would also like to allow users to create accounts where they can add their favourite webtoons and get recommended similar one's.

I also want a feature where you can keep track of your reading history and automatically open all taps to unread chapters at the click of a button. I want to actually do this for [mangaplus](https://mangaplus.shueisha.co.jp/manga_list/updated) as well since it is tedious to open each tab one at a time every day/week.

# Project next steps
- **Future Security Measures Implementation:**
  - Secure sensitive data by implementing encryption.
  - Use secure connections and enforce access controls and user privileges.

- **Future Regular Maintenance and Optimization:**
  - Perform routine data backups and index optimizations.
  - Tune query performance regularly to ensure efficient database operation.

- **Future Scalability and Capacity Planning:**
  - Design the database architecture for scalability.
  - Plan for increasing data volumes and user loads with techniques like sharding and clustering.

- **Future Monitoring and Logging Implementation:**
  - Implement monitoring tools to track database performance.
  - Set up logging mechanisms for auditing and troubleshooting database activities.

- **Future Data Recovery and Disaster Preparedness:**
  - Develop a comprehensive data recovery plan including regular backups.
  - Implement redundant storage and failover systems for quick data restoration in emergencies.

- **Future Compliance and Regulations Adherence:**
  - Stay informed about industry-specific regulations and data protection laws.
  - Ensure data integrity and user privacy are maintained according to the relevant standards.

- **Future Version Control and Change Management Setup:**
  - Establish version control practices for database schema and configurations using tools such as Git.
  - Implement change management protocols to manage version history and facilitate team collaboration.

- **Database Performance Testing and Benchmarking:**
  - Conduct performance testing to assess database response times under various loads.
  - Perform benchmarking to compare the performance of the database with industry standards.

# Challenges
- setting up MySQL path, resolved with the help of stack overflow: https://stackoverflow.com/questions/5920136/mysql-is-not-recognised-as-an-internal-or-external-command-operable-program-or-b
- database schema design: I decided to remove the author table since webtoon doesn't have a standardized way of displaying the authors so scraping the information would be very difficult. This does have the upside of making the table relationships less complicated.
