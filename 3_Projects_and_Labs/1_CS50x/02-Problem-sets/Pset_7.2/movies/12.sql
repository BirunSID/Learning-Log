-- 12. Titles of all of movies in which both Jennifer Lawrence and Bradley Cooper starred
.mode table
.table border

SELECT title
FROM movies
WHERE id IN (
    SELECT stars.movie_id
    FROM stars
    JOIN people ON people.id = stars.person_id
    WHERE name = 'Jennifer Lawrence'
)
AND 
id IN (
    SELECT stars.movie_id
    FROM stars
    JOIN people ON people.id = stars.person_id
    WHERE name = 'Bradley Cooper'
);