-- 6. Average rating of movies in 2012
.mode table
.table border

SELECT AVG(rating) 
FROM movies
JOIN ratings
ON ratings.movie_id = movies.id
WHERE year = '2012';