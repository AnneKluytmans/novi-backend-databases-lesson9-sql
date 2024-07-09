# Bonus: aanpassing van de tabel met plaatsnaam

**Doel**: Leer hoe je een tabel aanpast om extra kolommen toe te voegen, gegevens invoegt die speciale karakters bevatten en gebruik maakt van het `LIKE` commando.

## Opdracht

1. **Voeg een kolom toe** genaamd `city` aan de bestaande `owners` tabel.

2. **Voeg gegevens in** de `owners` tabel, inclusief een speciale plaatsnaam zoals `'s Hertogenbosch`.

3. **Selecteer** alle gegevens uit de `owners` tabel.

4. **Zoek gegevens** in de tabel met behulp van het `LIKE` commando. bv. alle steden met `en` in de naam.

<details>
<summary>Hints - stappenplan</summary>

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
   WHERE city LIKE '%en%';
   ```

</details>

---

<details>
<summary>Volledige uitwerking</summary>

1. **Kolom toevoegen**:

   ```sql
   ALTER TABLE owners
   ADD COLUMN city VARCHAR(255);
   ```

2. **Gegevens invoegen**:

gebruik het `insert into` commando om de data toe te voegen.

3. **Gegevens selecteren**:

Met het `select` commando

**Resultaat:**

| id | name          | address          | city             |
|----|---------------|------------------|------------------|
| 1  | John Doe      | 321 Birch Lane   | NULL             |
| 3  | Jim Brown     | 789 Pine Road    | NULL             |
| 4  | Alice Johnson | 111 Maple Street | Amsterdam        |
| 5  | Robert Brown  | 222 Oak Street   | Rotterdam        |
| 6  | Emily Clark   | 333 Pine Street  | Eindhoven        |
| 7  | George White  | 444 Birch Lane   | Den Haag         |
| 8  | Hannah Black  | 555 Cedar Avenue | 's Hertogenbosch |


4. **Gegevens zoeken**:

gebruik like en een wildcard

**Resultaat:**

| id | name         | address          | city             |
|----|--------------|------------------|------------------|
| 7  | George White | 444 Birch Lane   | Den Haag         |
| 8  | Hannah Black | 555 Cedar Avenue | 's Hertogenbosch |

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
