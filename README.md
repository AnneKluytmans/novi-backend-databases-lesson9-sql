# Backend-Database-Les-Opdrachten

### Oefening: Basis SQL-commando's met Eigenaren en Honden

**Doel**: Leer hoe je een tabel aanmaakt, gegevens invoegt, selecteert, bijwerkt en verwijdert in PostgreSQL. Deze oefening sluit aan bij latere oefeningen waarin relaties tussen eigenaren en hun honden worden gemaakt.

#### Opdracht

1. **Maak een tabel aan** genaamd `owners` met de volgende kolommen:
   - `id` (integer, primaire sleutel)
   - `name` (varchar)
   - `address` (varchar)

2. **Voeg gegevens in** de `owners` tabel. Voeg minimaal 3 rijen toe.

3. **Selecteer** alle gegevens uit de `owners` tabel.

4. **Update** het adres van één eigenaar.

5. **Verwijder** een eigenaar uit de tabel.

<details>
<summary>Hints als Stappenplan</summary>

1. **Tabel aanmaken**:
   - Gebruik het `CREATE TABLE` commando om de `owners` tabel aan te maken.
   - Zorg ervoor dat `id` de primaire sleutel is.

   ```sql
   CREATE TABLE owners (
       id SERIAL PRIMARY KEY,
       name VARCHAR(255),
       address VARCHAR(255)
   );
   ```

2. **Gegevens invoegen**:
   - Gebruik het `INSERT INTO` commando om gegevens in de `owners` tabel in te voegen.
   - Hier zijn enkele voorbeeldinserts. Probeer eerst zelf na te denken over de insert queries en vergelijk dan met de gegeven voorbeelden.

   ```sql
   INSERT INTO owners (name, address) VALUES ('John Doe', '123 Elm Street');
   INSERT INTO owners (name, address) VALUES ('Jane Smith', '456 Oak Avenue');
   INSERT INTO owners (name, address) VALUES ('Jim Brown', '789 Pine Road');
   ```

3. **Gegevens selecteren**:
   - Gebruik het `SELECT` commando om alle gegevens uit de `owners` tabel op te halen.

   ```sql
   SELECT * FROM owners;
   ```

4. **Gegevens bijwerken**:
   - Gebruik het `UPDATE` commando om het adres van één eigenaar bij te werken.

   ```sql
   UPDATE owners
   SET address = '321 Birch Lane'
   WHERE name = 'John Doe';
   ```

5. **Gegevens verwijderen**:
   - Gebruik het `DELETE` commando om een eigenaar uit de tabel te verwijderen.

   ```sql
   DELETE FROM owners
   WHERE name = 'Jane Smith';
   ```
</details>

<details>
<summary>Volledige Uitwerking</summary>

1. **Maak de tabel aan**:

   ```sql
   CREATE TABLE owners (
       id SERIAL PRIMARY KEY,
       name VARCHAR(255),
       address VARCHAR(255)
   );
   ```

2. **Voeg gegevens in**:

   ```sql
   INSERT INTO owners (name, address) VALUES ('John Doe', '123 Elm Street');
   INSERT INTO owners (name, address) VALUES ('Jane Smith', '456 Oak Avenue');
   INSERT INTO owners (name, address) VALUES ('Jim Brown', '789 Pine Road');
   ```

3. **Selecteer gegevens**:

   ```sql
   SELECT * FROM owners;
   ```

   Resultaat:
   ```
    id |    name    |      address
   ----+------------+-----------------
     1 | John Doe   | 123 Elm Street
     2 | Jane Smith | 456 Oak Avenue
     3 | Jim Brown  | 789 Pine Road
   ```

4. **Update gegevens**:

   ```sql
   UPDATE owners
   SET address = '321 Birch Lane'
   WHERE name = 'John Doe';
   ```

5. **Verwijder gegevens**:

   ```sql
   DELETE FROM owners
   WHERE name = 'Jane Smith';
   ```

   Controleer na elke stap de wijzigingen door opnieuw een `SELECT` query uit te voeren:

   ```sql
   SELECT * FROM owners;
   ```

   Resultaat na verwijderen:
   ```
    id |    name   |     address
   ----+-----------+----------------
     1 | John Doe  | 321 Birch Lane
     3 | Jim Brown | 789 Pine Road
   ```
</details>

### Bonus Oefening: Aanpassing van de Tabel met Plaatsnaam

**Doel**: Leer hoe je een tabel aanpast om extra kolommen toe te voegen, gegevens invoegt die speciale karakters bevatten en gebruik maakt van het `LIKE` commando.

#### Opdracht

1. **Voeg een kolom toe** genaamd `city` aan de bestaande `owners` tabel.

2. **Voeg gegevens in** de `owners` tabel, inclusief een speciale plaatsnaam zoals `'s Hertogenbosch`.

3. **Selecteer** alle gegevens uit de `owners` tabel.

4. **Zoek gegevens** in de tabel met behulp van het `LIKE` commando.

<details>
<summary>Hints als Stappenplan</summary>

1. **Kolom toevoegen**:
   - Gebruik het `ALTER TABLE` commando om de `city` kolom aan de `owners` tabel toe te voegen.

   ```sql
   ALTER TABLE owners
   ADD COLUMN city VARCHAR(255);
   ```

2. **Gegevens invoegen**:
   - Gebruik het `INSERT INTO` commando om nieuwe gegevens in de `owners` tabel in te voegen, inclusief een plaatsnaam met speciale karakters.

   ```sql
   INSERT INTO owners (name, address, city) VALUES ('Alice Johnson', '111 Maple Street', 'Amsterdam');
   INSERT INTO owners (name, address, city) VALUES ('Robert Brown', '222 Oak Street', 'Rotterdam');
   INSERT INTO owners (name, address, city) VALUES ('Emily Clark', '333 Pine Street', 'Eindhoven');
   INSERT INTO owners (name, address, city) VALUES ('George White', '444 Birch Lane', 'Den Haag');
   INSERT INTO owners (name, address, city) VALUES ('Hannah Black', '555 Cedar Avenue', '\'s Hertogenbosch');
   ```

3. **Gegevens selecteren**:
   - Gebruik het `SELECT` commando om alle gegevens uit de `owners` tabel op te halen.

   ```sql
   SELECT * FROM owners;
   ```

4. **Gegevens zoeken**:
   - Gebruik het `LIKE` commando om gegevens in de `owners` tabel te zoeken die een bepaalde stad bevatten.

   ```sql
   SELECT * FROM owners
   WHERE city LIKE '%den%';
   ```

</details>

<details>
<summary>Volledige Uitwerking</summary>

1. **Kolom toevoegen**:

   ```sql
   ALTER TABLE owners
   ADD COLUMN city VARCHAR(255);
   ```

2. **Gegevens invoegen**:

   ```sql
   INSERT INTO owners (name, address, city) VALUES ('Alice Johnson', '111 Maple Street', 'Amsterdam');
   INSERT INTO owners (name, address, city) VALUES ('Robert Brown', '222 Oak Street', 'Rotterdam');
   INSERT INTO owners (name, address, city) VALUES ('Emily Clark', '333 Pine Street', 'Eindhoven');
   INSERT INTO owners (name, address, city) VALUES ('George White', '444 Birch Lane', 'Den Haag');
   INSERT INTO owners (name, address, city) VALUES ('Hannah Black', '555 Cedar Avenue', '\'s Hertogenbosch');
   ```

3. **Gegevens selecteren**:

   ```sql
   SELECT * FROM owners;
   ```

   Resultaat:
   ```
    id |     name     |       address        |       city
   ----+--------------+-----------------------+----------------
     1 | John Doe     | 321 Birch Lane        | NULL
     3 | Jim Brown    | 789 Pine Road         | NULL
     4 | Alice Johnson| 111 Maple Street      | Amsterdam
     5 | Robert Brown | 222 Oak Street        | Rotterdam
     6 | Emily Clark  | 333 Pine Street       | Eindhoven
     7 | George White | 444 Birch Lane        | Den Haag
     8 | Hannah Black | 555 Cedar Avenue      | 's Hertogenbosch
   ```

4. **Gegevens zoeken**:

   ```sql
   SELECT * FROM owners
   WHERE city LIKE '%den%';
   ```

   Resultaat:
   ```
    id |     name     |       address        |     city
   ----+--------------+-----------------------+--------------
     7 | George White | 444 Birch Lane        | Den Haag
     8 | Hannah Black | 555 Cedar Avenue      | 's Hertogenbosch
   ```

   Gebruik ook andere variaties van het `LIKE` commando om te zien welke resultaten je kunt krijgen, bijvoorbeeld:

   ```sql
   SELECT * FROM owners
   WHERE city LIKE '%am%';
   ```

   ```sql
   SELECT * FROM owners
   WHERE city LIKE 'Rot%';
   ```

</details>
