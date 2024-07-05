# Oefening 2: Murder mystery oplossen met SQL joins

**Doel**: Gebruik SQL-commando's en joins om een moordmysterie op te lossen. Leer hoe je gegevens uit verschillende tabellen kunt combineren om informatie te analyseren en conclusies te trekken.

## Scenario

Er is een moord gepleegd in een groot landhuis en er zijn vijf verdachten. Elk van deze verdachten heeft een alibi, en er zijn getuigen die verklaringen hebben afgelegd. Aan jullie de taak om de dader te vinden door de gegevens in de database te analyseren.

## Gegevensstructuur

Er zijn drie tabellen: `suspects`, `alibis`, en `witness_statements`.

**Tabellen en Vooraf Ingevoerde Gegevens**

1. **suspects** tabel:
   - `id` (integer, primaire sleutel)
   - `name` (varchar)
   - `age` (integer)
   - `occupation` (varchar)

   ```sql
   CREATE TABLE suspects (
       id SERIAL PRIMARY KEY,
       name VARCHAR(255),
       age INTEGER,
       occupation VARCHAR(255)
   );

   INSERT INTO suspects (name, age, occupation) VALUES
   ('John Doe', 35, 'Butler'),
   ('Jane Smith', 28, 'Chef'),
   ('Emily Clark', 22, 'Maid'),
   ('Robert Brown', 45, 'Gardener'),
   ('George White', 55, 'Driver');
   ```

2. **alibis** tabel:
   - `suspect_id` (integer, verwijzing naar `suspects.id`)
   - `alibi` (varchar)

   ```sql
   CREATE TABLE alibis (
       suspect_id INTEGER REFERENCES suspects(id),
       alibi VARCHAR(255)
   );

   INSERT INTO alibis (suspect_id, alibi) VALUES
   (1, 'Was cleaning the study'),
   (2, 'Was preparing dinner'),
   (3, 'Was in her room'),
   (4, 'Was watering the plants'),
   (5, 'Was fixing the car');
   ```

3. **witness_statements** tabel:
   - `id` (integer, primaire sleutel)
   - `suspect_id` (integer, verwijzing naar `suspects.id`)
   - `statement` (varchar)
   - `time_reported` (timestamp)

   ```sql
   CREATE TABLE witness_statements (
       id SERIAL PRIMARY KEY,
       suspect_id INTEGER REFERENCES suspects(id),
       statement VARCHAR(255),
       time_reported TIMESTAMP
   );

   INSERT INTO witness_statements (suspect_id, statement, time_reported) VALUES
   (1, 'Saw him near the library', '2024-07-05 14:00:00'),
   (2, 'Heard her arguing with someone', '2024-07-05 14:05:00'),
   (3, 'Saw her going upstairs', '2024-07-05 14:10:00'),
   (4, 'Saw him near the garden', '2024-07-05 14:00:00'),
   (5, 'Heard him fixing the car', '2024-07-05 14:00:00');
   ```

## Opdracht

1. **Selecteer alle gegevens** uit de tabellen om een overzicht te krijgen.
2. **Gebruik joins** om de verdachten, alibi's en getuigenverklaringen te combineren en bepaal wie de dader is.

<details>
<summary>Hints - stappenplan</summary>

1. **Gegevens selecteren**:
   - Gebruik het `SELECT` commando om alle gegevens uit de `suspects` tabel op te halen.



   - Doe hetzelfde voor de `alibis` en `witness_statements` tabellen.



2. **Joins gebruiken**:
   - Gebruik een `INNER JOIN` om de gegevens uit de `suspects` en `alibis` tabellen te combineren.

   ```sql
   SELECT s.name, s.occupation, a.alibi
   FROM suspects s
   INNER JOIN alibis a ON s.id = a.suspect_id;
   ```

   - Gebruik een join om ook getuigenverklaringen toe te voegen.

   ```sql
   SELECT s.name, s.occupation, a.alibi, w.statement, w.time_reported
   FROM suspects s
   <vul join type in> alibis a ON s.id = a.suspect_id
   <vul join type in> witness_statements w ON s.id = w.suspect_id;
   ```

   - Analyseer de resultaten om te zien wie de dader zou kunnen zijn.

</details>

---

<details>
<summary>Volledige uitwerking</summary>

1. **Gegevens selecteren**:

   ```sql
   SELECT * FROM suspects;
   SELECT * FROM alibis;
   SELECT * FROM witness_statements;
   ```

   Resultaat:

   ```text
   suspects:
    id |    name     | age | occupation
   ----+-------------+-----+------------
     1 | John Doe    |  35 | Butler
     2 | Jane Smith  |  28 | Chef
     3 | Emily Clark |  22 | Maid
     4 | Robert Brown|  45 | Gardener
     5 | George White|  55 | Driver

   alibis:
    suspect_id |          alibi
   ------------+--------------------------
             1 | Was cleaning the study
             2 | Was preparing dinner
             3 | Was in her room
             4 | Was watering the plants
             5 | Was fixing the car

   witness_statements:
    id | suspect_id |           statement            |    time_reported
   ----+------------+---------------------------------+---------------------
     1 |          1 | Saw him near the library       | 2024-07-05 14:00:00
     2 |          2 | Heard her arguing with someone | 2024-07-05 14:05:00
     3 |          3 | Saw her going upstairs         | 2024-07-05 14:10:00
     4 |          4 | Saw him near the garden        | 2024-07-05 14:00:00
     5 |          5 | Heard him fixing the car       | 2024-07-05 14:00:00
   ```

2. **Joins gebruiken**:

   ```sql
   SELECT s.name, s.occupation, a.alibi
   FROM suspects s
   INNER JOIN alibis a ON s.id = a.suspect_id;
   ```

   Resultaat:

   ```text
      name     | occupation |          alibi
   -------------+------------+--------------------------
    John Doe    | Butler     | Was cleaning the study
    Jane Smith  | Chef       | Was preparing dinner
    Emily Clark | Maid       | Was in her room
    Robert Brown| Gardener   | Was watering the plants
    George White| Driver     | Was fixing the car
   ```

   ```sql
   SELECT s.name, s.occupation, a.alibi, w.statement, w.time_reported
   FROM suspects s
   LEFT JOIN alibis a ON s.id = a.suspect_id
   LEFT JOIN witness_statements w ON s.id = w.suspect_id;
   ```

   Resultaat:

   ```text
      name     | occupation |          alibi           |           statement            |    time_reported
   -------------+------------+--------------------------+---------------------------------+---------------------
    John Doe    | Butler     | Was cleaning the study   | Saw him near the library       | 2024-07-05 14:00:00
    Jane Smith  | Chef       | Was preparing dinner     | Heard her arguing with someone | 2024-07-05 14:05:00
    Emily Clark | Maid       | Was in her room          | Saw her going upstairs         | 2024-07-05 14:10:00
    Robert Brown| Gardener   | Was watering the plants  | Saw him near the garden        | 2024-07-05 14:00:00
    George White| Driver     | Was fixing the car       | Heard him fixing the car       | 2024-07-05 14:00:00
   ```

   Analyseer de resultaten:
   - `John Doe` heeft een alibi dat hij aan het schoonmaken was, maar een getuige zag hem bij de bibliotheek.
   - `Jane Smith` heeft een alibi dat ze aan het koken was, maar een getuige hoorde haar ruziën.
   - `Emily Clark` heeft een alibi dat ze in haar kamer was, maar een getuige zag haar naar boven gaan.
   - `Robert Brown` heeft een alibi dat hij de planten aan het water geven was en een getuige zag hem in de tuin.
   - `George White` heeft een alibi dat hij de auto aan het repareren was en een getuige hoorde hem dit doen.

   Op basis van deze gegevens lijkt het erop dat `Jane Smith` een inconsistente verklaring heeft omdat er een getuige is die haar heeft gehoord ruziën tijdens haar alibi.
</details>
