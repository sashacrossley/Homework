DROP TABLE animals;
DROP TABLE countries;

CREATE TABLE countries(
    id SERIAL PRIMARY KEY,
    names VARCHAR(255) NOT NULL,
    populations INTEGER NOT NULL
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    names VARCHAR(255) NOT NULL,
    country_id INTEGER NOT NULL,

    FOREIGN KEY (country_id) REFERENCES countries(id)
);

INSERT INTO
    countries
    (names, populations)
VALUES
    ('United States', 327000000)
;

-- INSERT INTO
--     animals
--     (names, country_id)
-- VALUES
--     ('Racoon',
--     (SELECT id
--      FROM countries
--      WHERE names = 'United States')),
--     ('Black Bear',
--     (SELECT id
--      FROM countries
--      WHERE names = 'United States')),
--     ('Bald Eagle',
--     (SELECT id
--      FROM countries
--      WHERE names = 'United States')),
-- ;

INSERT INTO
    animals
    (names, country_id)
VALUES
    ('Racoon',
    (SELECT id 
     FROM countries 
     WHERE names = 'United States')),
    ('Black Bear',
    (SELECT id 
     FROM countries 
     WHERE names = 'United States')),
    ('Bald Eagle',
    (SELECT id 
     FROM countries 
     WHERE names = 'United States'))
;

