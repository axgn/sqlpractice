-- Active: 1744952858156@@127.0.0.1@13306@sakila
SELECT COUNT(*)
FROM film;
SELECT COUNT(*)
FROM film_actor;
SHOW FULL TABLES;
SELECT first_name,
    last_name
FROM actor;
SELECT 1 + 2;
SHOW CREATE TABLE actor;
DESCRIBE actor;
SELECT *
FROM actor
WHERE last_name LIKE "A%";
SELECT *
FROM actor
WHERE first_name != "SUSAN"
    AND last_name = "DAVIS";
SELECT DISTINCT last_update
FROM actor;
SELECT *
FROM actor
WHERE actor_id < 100
    AND last_name = "DAVIS";
SELECT (
        1
        OR 0
    )
    AND 0;
SELECT 1 IN (1, 2),
    3 IN (1, 2),
    'A' IN ('A', 'B'),
    'C' IN ('A', 'B');
SELECT NULL IN (1, 2),
    NULL IN (1, 2, NULL);
SELECT 1 IN (1, NULL),
    2 IN (1, NULL);
SELECT *
FROM actor
WHERE NOT (last_name NOT IN ('ALLEN', 'dAVIS'));
SELECT *
FROM language;
SELECT 1 BETWEEN 1 AND 3,
    2 BETWEEN 1 AND 3,
    3 BETWEEN 1 AND 3,
    4 BETWEEN 1 AND 3;
SELECT film_id,
    title,
    replacement_cost,
    COUNT(*)
FROM film
WHERE replacement_cost BETWEEN 1 AND 10;
SELECT replacement_cost,
    COUNT(*)
FROM film
GROUP BY replacement_cost;
SELECT 'a' LIKE 'a',
    'a' LIKE 'a%',
    'ab' LIKE 'a%',
    'ab' LIKE '%a';
SELECT *
FROM actor
WHERE first_name LIKE '%A%M%';
SELECT *
FROM actor
WHERE first_name LIKE '_AY';
SELECT *
FROM category
WHERE name LIKE 'A%';
SELECT first_name,
    last_name,
    password
FROM staff
WHERE password IS NULL;
SELECT *
FROM language AS la
WHERE EXISTS (
        SELECT language_id
        FROM film AS fi
        WHERE fi.language_id = la.language_id
    );
SELECT *
FROM language
WHERE language_id IN (
        SELECT language_id
        FROM film
    );
SELECT *
FROM film;
SELECT actor_id,
    first_name,
    last_name
FROM actor
ORDER BY last_name;
SELECT film_id,
    title,
    rating
FROM film
ORDER BY CASE
        rating
        WHEN 'G' THEN 1
        WHEN 'PG' THEN 2
        WHEN 'PG-13' THEN 3
        WHEN 'R' THEN 4
        WHEN 'NC-17' THEN 5
    END;
SELECT *
FROM film
ORDER BY FIELD(
        rating,
        'G',
        'PG',
        'PG-13',
        'R',
        'NC-17'
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
SELECT film_id,
    title,
    length,
    rating
FROM film
WHERE rating = 'G'
ORDER BY length
LIMIT 10;
SELECT COUNT(*)
FROM film;
SELECT film_id,
    title
FROM film
LIMIT 16, 5;
SELECT last_name
FROM actor;
SELECT DISTINCT last_name
FROM actor;
SELECT DISTINCT last_name,
    first_name
FROM actor;
SELECT last_name,
    first_name,
    COUNT(*)
FROM actor
GROUP BY last_name,
    first_name
HAVING COUNT(*) > 1;
CREATE TABLE `student` (
    `student_id` int NOT NULL,
    `name` varchar(45) NOT NULL,
    PRIMARY KEY (`student_id`)
);
CREATE TABLE `student_score` (
    `student_id` int NOT NULL,
    `subject` varchar(45) NOT NULL,
    `score` int NOT NULL
);
INSERT INTO `student` (`student_id`, `name`)
VALUES (1, 'Tim'),
    (2, 'Jim'),
    (3, 'Lucy');
INSERT INTO `student_score` (
        `student_id`,
        `subject`,
        `score`
    )
VALUES (1, 'English', 90),
    (1, 'Math', 80),
    (2, 'English', 85),
    (2, 'Math', 88),
    (5, 'English', 92);
SELECT *
FROM student;
SELECT *
FROM student_score;
SELECT *
FROM student
    CROSS JOIN student_score;
SELECT student.*,
    student_score.*
FROM student,
    student_score;
SELECT *
FROM student
    INNER JOIN student_score ON student.student_id = student_score.student_id;
SELECT *
FROM student,
    student_score
WHERE student.student_id = student_score.student_id;
SELECT student.*,
    student_score.*
FROM student
    INNER JOIN student_score USING(student_id);
SELECT *
FROM student
    INNER JOIN student_score USING (student_id);
SELECT student.*, student_score.*
FROM student
    LEFT JOIN student_score ON student.student_id = student_score.student_id;
SELECT *
FROM student
    LEFT JOIN student_score ON student.student_id = student_score.student_id;
SELECT student.*, student_score.*
FROM student
    RIGHT JOIN student_score ON student.student_id = student_score.student_id;
SELECT student.*, student_score.*
FROM student_score
    LEFT JOIN student ON student.student_id = student_score.student_id;

SELECT ANY_VALUE(first_name),last_name ,COUNT(*) FROM actor  GROUP BY last_name HAVING COUNT(*) = 4;
-- 如何实现将每一行数据都记录下来同时又可以使用聚合函数的效果。
SELECT last_name, COUNT(*)
FROM actor
GROUP BY
    last_name
ORDER BY COUNT(*) DESC;
SELECT customer_id, SUM(amount) AS total
FROM payment
GROUP BY
    customer_id
ORDER BY total DESC
LIMIT 10;
SELECT customer_id, SUM(amount) total
FROM payment
GROUP BY
    customer_id
HAVING
    total > 180
ORDER BY total DESC;

SELECT * FROM a UNION ALL SELECT * FROM b;
SELECT * FROM a UNION SELECT * FROM b UNION SELECT * FROM c;
SELECT * FROM a UNION ALL SELECT * FROM b UNION ALL SELECT * FROM c;
SELECT * FROM a UNION SELECT * FROM b UNION ALL SELECT * FROM c;
SELECT * FROM a UNION ALL SELECT * FROM b ORDER BY v;
SELECT 1 UNION SELECT 2;
SELECT 2 UNION SELECT 1;
SELECT 2 AS c UNION SELECT 1;
SELECT
    first_name `First Name`,
    last_name `Last Name`,
    CONCAT(first_name, ', ', last_name) `Full Name`
FROM actor
LIMIT 5;
SELECT *
FROM language l
WHERE
    EXISTS (
        SELECT *
        FROM film `f a`
        WHERE
            `f a`.language_id = l.language_id
    );

SELECT * FROM (SELECT customer_id FROM payment) b, (SELECT AVG(t.customer_total) customer_avg
FROM (
        SELECT customer_id, SUM(amount) customer_total
        FROM payment
        GROUP BY
            customer_id
        HAVING
            customer_total > 180
    ) t) a;
SELECT AVG(t.customer_total) customer_avg
FROM (
        SELECT customer_id, SUM(amount) customer_total
        FROM payment
        GROUP BY
            customer_id
        HAVING
            customer_total > 180
    ) t;

SELECT *
FROM language
WHERE
    EXISTS (
        SELECT *
        FROM film
        WHERE
            film.language_id = language.language_id
    );
SELECT *
FROM language
WHERE
    language_id IN (
        SELECT DISTINCT
            language_id
        FROM film
    );

SELECT *
FROM (
        SELECT last_name, COUNT(*) count
        FROM actor
        GROUP BY
            last_name
    ) t
WHERE
    t.last_name LIKE 'A%';

SELECT * FROM (SELECT 1,1) t;


