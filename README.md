🎬 Netflix Data Analysis using SQL

📌 Project Overview

This project performs end-to-end data analysis on Netflix dataset using SQL, solving real-world business problems and extracting actionable insights.

The goal is to simulate how a data analyst works with large-scale streaming platform data to support business decisions.

---

🎯 Objectives

- Analyze Netflix content distribution
- Understand viewer trends and content patterns
- Solve real-world business questions using SQL
- Practice data cleaning and transformation

---

🗂️ Dataset Description

The dataset includes:

- Content type (Movie / TV Show)
- Title, Director, Cast
- Country of origin
- Release year & date added
- Ratings & Duration
- Genre classification
- Description

---

🛠️ Tech Stack

- SQL (PostgreSQL)
- Data Cleaning
- Data Analysis

---

🧱 Database Schema

CREATE TABLE netflix (
    show_id VARCHAR(7) PRIMARY KEY,
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(500),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(100),
    description VARCHAR(250)
);

---

🔍 Key Business Problems Solved

📊 Content Analysis

- Total number of shows available on Netflix
- Distribution of Movies vs TV Shows

⭐ Ratings Analysis

- Most common ratings for Movies and TV Shows

📅 Time-Based Analysis

- Content released in a specific year
- Year-wise content growth (India)

🌍 Geographic Insights

- Top countries producing Netflix content

🎭 Genre Analysis

- Most popular genres on Netflix

⏱️ Duration Insights

- Longest movies and TV shows

📺 TV Show Analysis

- Shows with more than 5 seasons

🎬 Special Analysis

- Documentary content
- Content without directors
- Movies featuring Salman Khan (last 10 years)
- Top actors with highest appearances

---

🧠 Sample Queries

🎯 Movies vs TV Shows

SELECT type, COUNT(*) AS total
FROM netflix
GROUP BY type;

🌍 Top 5 Countries

SELECT country, COUNT(*) AS total_content
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;

🎭 Genre-wise Distribution

SELECT 
    unnest(string_to_array(listed_in, ',')) AS genre,
    COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1;

---

📊 Key Insights

- 🎬 Movies dominate Netflix content compared to TV shows
- 🌍 USA and India are among the top content producers
- 🎭 Drama and International genres are most common
- 📈 Content growth significantly increased after 2015

---

📁 Project Structure

Netflix_SQL_Project/
│── SqlProject.sql
│── README.md

---

🚀 What I Learned

- Writing optimized SQL queries
- Data cleaning techniques in SQL
- Handling NULL values and string manipulation
- Solving real-world analytical problems
- Converting raw data into insights

---

🔮 Future Improvements

- Integrate with Python (Pandas + Matplotlib)
- Build interactive dashboard (Power BI / Tableau)
- Use window functions & advanced SQL
- Optimize queries using indexing

---

👨‍💻 Author

Kaustubh Singh

📧 kaustubhsingh1845@gmail.com
🔗 LinkedIn: (Add your link)
💻 GitHub: (Add your profile)

---

⭐ Support

If you found this project useful, give it a ⭐ on GitHub!
