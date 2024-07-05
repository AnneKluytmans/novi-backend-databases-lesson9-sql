# Vervolg oefening: relaties opzetten met een nieuwe tabel van honden

**Doel**: Leer hoe je een nieuwe tabel aanmaakt en een relatie opzet tussen de `owners` en `dogs` tabellen in PostgreSQL.

## Opdracht

1. **Maak een nieuwe tabel** genaamd `dogs` met de volgende kolommen:
   - `dog_id` (integer, primaire sleutel)
   - `name` (varchar)
   - `breed` (varchar)
   - `owner_id` (integer, vreemde sleutel die verwijst naar de `id` kolom van de `owners` tabel)

2. **Voeg gegevens in** de `dogs` tabel. Voeg minimaal 3 rijen toe, waarbij elke hond gekoppeld is aan een eigenaar.

3. **Selecteer** alle gegevens uit de `dogs` tabel.

4. **Maak een query** die de namen van de honden en de namen van hun eigenaren toont.

<details>
<summary>Hints - stappenplan</summary>

1. **Nieuwe tabel aanmaken**:
   - Gebruik het `CREATE TABLE` commando om de `dogs` tabel aan te maken.
   - Zorg ervoor dat `dog_id` de primaire sleutel is en `owner_id` een vreemde sleutel die verwijst naar de `id` kolom van de `owners` tabel.

   ```sql
   CREATE TABLE dogs (
     < de basis info moet hier komen>
       FOREIGN KEY (<naam van de kolom>) REFERENCES owners(<naam van de kolom in de owners tabel>)
   );
   ```

2. **Gegevens invoegen**:
   - Gebruik het `INSERT INTO` commando om gegevens in de `dogs` tabel in te voegen.



3. **Gegevens selecteren**:
   - Gebruik het `SELECT` commando om alle gegevens uit de `dogs` tabel op te halen.


4. **Namen van honden en eigenaren weergeven**:
   - Gebruik een `JOIN` om de namen van de honden en de namen van hun eigenaren te tonen.

   ```sql
   SELECT dogs.name AS dog_name, owners.name AS owner_name
   FROM dogs
   JOIN owners ON <beschrijf de koppeling met tabelnaam.kolomnaam = andere tabelnaam.kolomnaam;
   ```

</details>

---

<details>
<summary>Volledige uitwerking</summary>

1. **Nieuwe tabel aanmaken**:

   ```sql
   CREATE TABLE dogs (
       dog_id SERIAL PRIMARY KEY,
       name VARCHAR(255),
       breed VARCHAR(255),
       owner_id INTEGER,
       FOREIGN KEY (owner_id) REFERENCES owners(id)
   );
   ```

2. **Gegevens invoegen**:

   ```sql
   INSERT INTO dogs (name, breed, owner_id) VALUES ('Buddy', 'Golden Retriever', 1);
   INSERT INTO dogs (name, breed, owner_id) VALUES ('Bella', 'Labrador', 3);
   INSERT INTO dogs (name, breed, owner_id) VALUES ('Charlie', 'Beagle', 4);
   INSERT INTO dogs (name, breed, owner_id) VALUES ('Lucy', 'Bulldog', 5);
   ```

3. **Gegevens selecteren**:

   ```sql
   SELECT * FROM dogs;
   ```

   Resultaat:
   ```
    dog_id |   name   |       breed       | owner_id
   --------+----------+-------------------+----------
         1 | Buddy    | Golden Retriever  |        1
         2 | Bella    | Labrador          |        3
         3 | Charlie  | Beagle            |        4
         4 | Lucy     | Bulldog           |        5
   ```

4. **Namen van honden en eigenaren weergeven**:

   ```sql
   SELECT dogs.name AS dog_name, owners.name AS owner_name
   FROM dogs
   JOIN owners ON dogs.owner_id = owners.id;
   ```

   Resultaat:
   ```
    dog_name |  owner_name
   ----------+-------------
    Buddy    | John Doe
    Bella    | Jim Brown
    Charlie  | Alice Johnson
    Lucy     | Robert Brown
   ```

</details>
