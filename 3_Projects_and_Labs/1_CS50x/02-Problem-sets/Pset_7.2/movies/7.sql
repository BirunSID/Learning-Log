-- 7. All movies and ratings from 2010, in decreasing order by rating (alphabetical for those with same rating)
.mode table
.table border

SELECT title, rating
FROM movies
JOIN ratings 
ON ratings.movie_id = movies.id
WHERE rating <> ' ' 
    AND year = '2010'
ORDER BY rating DESC, title ASC;