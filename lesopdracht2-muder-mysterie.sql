-- Opdracht 2.1 Murder mystery
-- Create and fill suspects table
CREATE TABLE suspects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    occupation VARCHAR(255)
);

INSERT INTO suspects (name, age, occupation) 
VALUES ('John Doe', 35, 'Butler'),
('Jane Smith', 28, 'Chef'),
('Emily Clark', 22, 'Maid'),
('Robert Brown', 45, 'Gardener'),
('George White', 55, 'Driver');

SELECT * FROM suspects;

-- Create and fill alibis table
CREATE TABLE alibis (
    suspect_id INTEGER REFERENCES suspects(id),
    alibi VARCHAR(255)
);

INSERT INTO alibis (suspect_id, alibi) 
VALUES (1, 'Was cleaning the study'),
(2, 'Was preparing dinner'),
(3, 'Was in her room'),
(4, 'Was watering the plants'),
(5, 'Was fixing the car');

SELECT * FROM alibis;

-- Create and fill witness table
CREATE TABLE witness_statements (
    id SERIAL PRIMARY KEY,
    suspect_id INTEGER REFERENCES suspects(id),
    statement VARCHAR(255),
    time_reported TIMESTAMP
);

INSERT INTO witness_statements (suspect_id, statement, time_reported) 
VALUES (1, 'Saw him near the study', '2024-07-05 14:00:00'),
(2, 'Heard her in the kitchen', '2024-07-05 14:05:00'),
(3, 'Saw her going upstairs', '2024-07-05 14:10:00'),
(4, 'Saw him near the garden', '2024-07-05 14:00:00'),
(5, 'Heard him fixing the car', '2024-07-05 14:00:00');

SELECT * FROM witness_statements;

-- Select all info and use JOIN to combine the data
SELECT * FROM suspects;
SELECT * FROM alibis;
SELECT * FROM witness_statements;

SELECT s.name, s.occupation, a.alibi
FROM suspects s
INNER JOIN alibis a ON s.id = a.suspect_id;

SELECT s.name, s.occupation, a.alibi, w.statement, w.time_reported
FROM suspects s
INNER JOIN alibis a ON s.id = a.suspect_id
INNER JOIN witness_statements w ON s.id = w.suspect_id;

--Based on the data suspect 3, Emily Clark, is most likely to be the murderer