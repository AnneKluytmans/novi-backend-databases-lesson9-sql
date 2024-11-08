-- Opdracht 1.0
-- Create and fill Owners table

CREATE TABLE Owners (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);

INSERT INTO owners (name, address)
VALUES ('Piet Vollenhoven', 'Trompetstraat 23'),
       ('Ilse Warringa', 'Biltstraat 15'),
       ('Chantal Jansen', 'Karellaan 45');

SELECT * FROM owners;

-- Delete and update data from Owners table

DELETE FROM Owners
WHERE name = 'Piet Vollenhoven';

SELECT * FROM Owners;

UPDATE Owners
SET address = 'Biltstraat 5'
WHERE name = 'Ilse Warringa';

UPDATE Owners
SET address = 'Keizersgracht 34'
WHERE name = 'Chantal Jansen';

SELECT * FROM Owners;

-- Opdracht 1.1
-- Add and fill column: city

ALTER TABLE Owners
ADD COLUMN city VARCHAR(100);

SELECT * FROM Owners;

UPDATE Owners
SET city = 'Bilthoven'
WHERE name = 'Ilse Warringa';

UPDATE Owners
SET city = 'Amsterdam'
WHERE name = 'Chantal Jansen';

INSERT INTO Owners (id, name, address, city)
VALUES (4, 'Bob de Bouwer', 'Molenstraat 4', 'Breda'),
       (5, 'Winnie the Pooh', 'The old tree 6', 'Berenbos');

SELECT * FROM Owners;

-- Select based on city with LIKE command

SELECT * FROM owners
WHERE city LIKE '%am%';

SELECT * FROM owners
WHERE city LIKE '%da%';

SELECT * FROM owners
WHERE city LIKE '%en%';

-- Opdracht 2.0
-- Create and fill Dogs table

CREATE TABLE Dogs (
    dog_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    breed VARCHAR(255),
    owner_id INTEGER,
    FOREIGN KEY (owner_id) REFERENCES Owners(id)
);

INSERT INTO Dogs (name, breed, owner_id)
VALUES ('Buddy', 'Golden Retriever', 2),
       ('Bella', 'Labrador', 3),
       ('Charlie', 'Beagle', 4),
       ('Lucy', 'Bulldog', 5);

SELECT * FROM Dogs;

-- Select the names of the dog with the names of their owners

SELECT Dogs.name AS dog_name, Owners.name AS owner_name  --AS sets the names of the columns in the select table
FROM Dogs
JOIN Owners ON Dogs.owner_id = Owners.id;