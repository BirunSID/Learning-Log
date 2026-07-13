-- 1. Titles of all movies from 2008

.mode table
.table border

SELECT title
FROM movies
WHERE year = '2008';