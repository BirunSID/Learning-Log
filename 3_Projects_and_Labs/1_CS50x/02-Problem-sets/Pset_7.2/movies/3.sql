-- 3. Titles of all movies since 2018, in alphabetical order
.mode table
.table border

SELECT title
FROM movies
WHERE year >= '2018'
ORDER BY title;