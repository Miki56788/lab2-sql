\c lab2

--
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL,
    region_id INTEGER,
    population INTEGER
);

INSERT INTO countries (country_name, region_id, population)
VALUES ('Finland', 117, 5608218);

INSERT INTO countries (country_id, country_name) VALUES (5, 'Francr');

INSERT INTO countries (country_name, region_id, population)
VALUES ('Italy', NULL, 500000);

INSERT INTO countries (country_name, region_id, population) VALUES
('USA', 4, 1200000),
('China', 3, 800000),
('Japan', 7, 400000);

 ALTER TABLE countries ALTER COLUMN country_name
     SET DEFAULT 'Kazakhstan';

INSERT INTO countries (region_id, population)
VALUES (6, 600000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

SELECT country_name, population * 1.10 AS "New Population" FROM countries;

DELETE FROM countries WHERE population < 100000;


SELECT * FROM countries;
--избавляюсь от дубликатов в таблице почему то три раза кахастан
DELETE FROM countries
WHERE country_name = 'Kazakhstan'
AND ctid NOT IN (
    SELECT min(ctid)
    FROM countries
    WHERE country_name = 'Kazakhstan'
    GROUP BY country_name
);
--добавила ограничения по уникальности без дубликатов
ALTER TABLE countries ADD CONSTRAINT unique_country_name UNIQUE (country_name);

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries
RETURNING *;






