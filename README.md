# webtoon-mysql-database
MySQL database component of full-stack webtoons analytics application

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

# Monthly snapshots of Webtoon data
To be able to compare changes in Webtoon data and track how Webtoon.com as a platform grows its library, I want to take a monthly snapshot of my data.

To do this, I have decided to create a Historical_Webtoon table that has a snapshot_date for the date it was taken. The main focus is on the month and year. Data will be scraped the first day of everymonth and a snapshot of the data will be created immediately. 

Another possible approach would be to create a cold database to act as a data warehouse that only contains historical data for analysis and reporting.

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
  - Establish version control practices for database schema and configurations.
  - Implement change management protocols to manage version history and facilitate team collaboration.


# Challenges
- setting up MySQL path, resolved with the help of stack overflow: https://stackoverflow.com/questions/5920136/mysql-is-not-recognised-as-an-internal-or-external-command-operable-program-or-b
- database schema design: I decided to remove the author table since webtoon doesn't have a standardized way of displaying the authors so scraping the information would be very difficult. This does have the upside of making the table relationships less complicated.
