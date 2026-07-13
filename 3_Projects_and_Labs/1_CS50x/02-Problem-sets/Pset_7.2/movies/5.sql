-- 5. Titles and years of all Harry Potter movies, in chronological order (title beginning with "Harry Potter and the ...")
.mode table
.table border

SELECT DISTINCT year, title 
FROM movies
WHERE title like '%Harry Potter and the%'
ORDER BY year;