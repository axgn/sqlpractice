-- Active: 1744952858156@@127.0.0.1@13306@sakila
SELECT COUNT(*) FROM film;

SELECT COUNT(*) FROM film_actor;

SHOW FULL TABLES;

SELECT first_name, last_name FROM actor;

SELECT 1 + 2;

SHOW CREATE TABLE actor;

DESCRIBE actor;

SELECT * FROM actor WHERE last_name LIKE "A%";

SELECT *
FROM actor
WHERE
    first_name != "SUSAN"
    AND last_name = "DAVIS";

SELECT DISTINCT last_update FROM actor;

SELECT * FROM actor WHERE actor_id < 100 AND last_name = "DAVIS";

SELECT ( 1 OR 0 ) AND 0;

SELECT 1 IN (1, 2), 3 IN (1, 2), 'A' IN ('A', 'B'), 'C' IN ('A', 'B');

SELECT NULL IN (1, 2), NULL IN (1, 2, NULL);

SELECT 1 IN (1, NULL), 2 IN (1, NULL);

SELECT * FROM actor WHERE NOT( last_name NOT IN('ALLEN', 'dAVIS') );

SELECT * FROM language;

SELECT 1 BETWEEN 1 AND 3, 2 BETWEEN 1 AND 3, 3 BETWEEN 1 AND 3, 4 BETWEEN 1 AND 3;

SELECT
    film_id,
    title,
    replacement_cost
FROM film
WHERE
    replacement_cost BETWEEN 1 AND 10;

SELECT replacement_cost, COUNT(*)
FROM film
GROUP BY
    replacement_cost; 
SELECT 'a' LIKE 'a', 'a' LIKE 'a%', 'ab' LIKE 'a%', 'ab' LIKE '%a';

SELECT * FROM actor WHERE first_name LIKE '%A%M%';

SELECT * FROM actor WHERE first_name LIKE '_AY';

SELECT * FROM category WHERE name LIKE 'A%';

SELECT first_name, last_name, password
FROM staff
WHERE
    password IS NULL;

SELECT *
FROM language AS la
WHERE
    EXISTS (
        SELECT language_id
        FROM film AS fi
        WHERE
            fi.language_id = la.language_id
    );

SELECT *
FROM language
WHERE
    language_id IN (
        SELECT language_id
        FROM film
    );

SELECT * FROM film;

SELECT actor_id, first_name, last_name
FROM actor
ORDER BY last_name;

SELECT film_id, title, rating
FROM film
ORDER BY
    CASE rating
        WHEN 'G' THEN 1
        WHEN 'PG' THEN 2
        WHEN 'PG-13' THEN 3
        WHEN 'R' THEN 4
        WHEN 'NC-17' THEN 5
    END;

SELECT *
FROM film
ORDER BY FIELD(
        rating, 'G', 'PG', 'PG-13', 'R', 'NC-17'
    );

SELECT *
FROM (
        SELECT 'A' AS v
        UNION ALL
        SELECT 'B' AS v
        UNION ALL
        SELECT NULL AS v
        UNION ALL
        SELECT 0 AS b
    ) t
ORDER BY v;

SELECT film_id, title, length, rating
FROM film
WHERE
    rating = 'G'
ORDER BY length
LIMIT 10;

SELECT COUNT(*) FROM film;

SELECT film_id, title FROM film LIMIT 16, 5;

SELECT last_name FROM actor;

SELECT DISTINCT last_name FROM actor;

SELECT DISTINCT last_name, first_name FROM actor;

SELECT last_name, first_name, COUNT(*)
FROM actor
GROUP BY
    last_name,
    first_name
HAVING
    COUNT(*) > 1;


SELECT * FROM student;

SELECT * FROM student_score;

SELECT * FROM student CROSS JOIN student_score;

SELECT student.*, student_score.*
FROM student, student_score;

SELECT *
FROM student
    INNER JOIN student_score ON student.student_id = student_score.student_id;

SELECT *
FROM student, student_score
WHERE
    student.student_id = student_score.student_id;

SELECT student.*, student_score.*
FROM student
    INNER JOIN student_score USING (student_id);

SELECT *
FROM student
    INNER JOIN student_score USING (student_id);
