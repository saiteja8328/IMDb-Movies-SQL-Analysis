SHOW DATABASES;

USE project_movie_database;

SHOW TABLES;

# 1. Get all data about movies

SELECT *
FROM movies;

# 2. Get all data about directors
SELECT *
FROM directors;

# 3. Check how many movies are present in IMDb
SELECT COUNT(*) AS Total_Movies
FROM movies;

# 4. Find these 3 directors: James Cameron, Luc Besson, John Woo
SELECT *
FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

# 5. Find all directors with name starting with S
SELECT *
FROM directors
WHERE name LIKE 'S%';

# 6. Count female directors
SELECT COUNT(*) AS Female_Directors
FROM directors
WHERE gender = 1;

# 7. Find the name of the 10th female director
SELECT name
FROM directors
WHERE gender = 1
ORDER BY id
LIMIT 9, 1;

# 8. Find the 3 most popular movies
SELECT original_title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;

# 9. Find the 3 most bankable movies
SELECT original_title, revenue
FROM movies
ORDER BY revenue DESC
LIMIT 3;

# 10. Find the most awarded average vote since January 1st, 2000
SELECT original_title, vote_average, release_date
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

# 11. Find the movies directed by Brenda Chapman
SELECT m.original_title, d.name
FROM movies m
JOIN directors d
ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';

# 12. Find the director who made the most movies
SELECT d.name, COUNT(m.id) AS Total_Movies
FROM directors d
JOIN movies m
ON d.id = m.director_id
GROUP BY d.id, d.name
ORDER BY Total_Movies DESC
LIMIT 1;

# 13. Find the most bankable director
SELECT d.name, SUM(m.revenue) AS Total_Revenue
FROM directors d
JOIN movies m
ON d.id = m.director_id
GROUP BY d.id, d.name
ORDER BY Total_Revenue DESC
LIMIT 1;