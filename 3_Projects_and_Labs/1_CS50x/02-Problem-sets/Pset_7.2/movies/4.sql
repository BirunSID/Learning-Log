-- 4. Number of movies with a 10.0 rating
.mode table
.table border

SELECT COUNT(movie_id)
FROM ratings
WHERE rating = "10.00";
