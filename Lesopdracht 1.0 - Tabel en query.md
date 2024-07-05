# Backend-Database-Les-Opdrachten

## Oefening: Basis SQL-commando's met eigenaren en honden

**Doel**: Leer hoe je een tabel aanmaakt, gegevens invoegt, selecteert, bijwerkt en verwijdert in PostgreSQL. Deze oefening sluit aan bij latere oefeningen waarin relaties tussen eigenaren en hun honden worden gemaakt.

## Opdracht

1. **Maak een tabel aan** genaamd `owners` met de volgende kolommen:
    - `id` (integer, primaire sleutel)
    - `name` (varchar)
    - `address` (varchar)

2. **Voeg gegevens in** de `owners` tabel. Voeg minimaal 3 rijen toe.

3. **Selecteer** alle gegevens uit de `owners` tabel.

4. **Update** het adres van één eigenaar.

5. **Verwijder** een eigenaar uit de tabel.

<details>
<summary>Hints - stappenplan</summary>

1. **Tabel aanmaken**:
    - Gebruik het `CREATE TABLE` commando om de `owners` tabel aan te maken.
    - Zorg ervoor dat `id` de primaire sleutel is.

   ```sql
   CREATE TABLE owners (
      <vul hier aaan>
   );
   ```

2. **Gegevens invoegen**:
    - Gebruik het `INSERT INTO` commando om gegevens in de `owners` tabel in te voegen.


3. **Gegevens selecteren**:
    - Gebruik het `SELECT` commando om alle gegevens uit de `owners` tabel op te halen.

   ```sql
   select <welke kolommen> from  <tabel naam>
   ```

4. **Gegevens bijwerken**:
    - Gebruik het `UPDATE` commando om het adres van één eigenaar bij te werken.

   ```sql
   UPDATE owners
   SET address <vul aan>
   ```

5. **Gegevens verwijderen**:
    - Gebruik het `DELETE` commando om een eigenaar uit de tabel te verwijderen.

   ```sql
   DELETE FROM <vul aan en vergeet het filter niet om te voorkomen dat je alles verwijderd>
   ```
</details>

---

<details>
<summary>Volledige uitwerking</summary>

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


