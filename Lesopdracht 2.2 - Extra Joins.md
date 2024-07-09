## Opdracht: Basis SQL-commando's met meerdere tabellen

### Doel:
Leer hoe je meerdere tabellen aanmaakt, gegevens invoegt, selecteert met joins, bijwerkt en verwijdert in PostgreSQL. Deze oefening bouwt voort op de vorige en laat zien hoe tabellen kunnen worden gekoppeld en hoe gegevens over verschillende tabellen heen kunnen worden bewerkt.

### SQL-script:

```sql
-- Maak de Subjects tabel aan
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL UNIQUE
);

-- Maak de Teachers tabel aan
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50) NOT NULL,
    SubjectID INT,
    Salary DECIMAL(10, 2) DEFAULT 50000 CHECK (Salary > 0),
    CONSTRAINT FK_Teachers_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID)
);

-- Maak de StudyRecords tabel aan
CREATE TABLE StudyRecords (
    StudyRecordID INT PRIMARY KEY,
    RecordDetails VARCHAR(255) NOT NULL,
    GPA DECIMAL(3, 2) CHECK (GPA >= 0.0 AND GPA <= 4.0)
);

-- Maak de Classes tabel aan
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50) NOT NULL UNIQUE,
    TeacherID INT,
    MaxStudents INT DEFAULT 30 CHECK (MaxStudents > 0 AND MaxStudents <= 100),
    CONSTRAINT FK_Classes_Teachers FOREIGN KEY (TeacherID) REFERENCES Teachers (TeacherID)
);

-- Maak de Students tabel aan
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    ClassID INT,
    StudyRecordID INT,
    Age INT CHECK (Age >= 5 AND Age <= 100),
    EnrollmentDate DATE DEFAULT CURRENT_DATE,
    CONSTRAINT FK_Students_Classes FOREIGN KEY (ClassID) REFERENCES Classes (ClassID),
    CONSTRAINT FK_Students_StudyRecords FOREIGN KEY (StudyRecordID) REFERENCES StudyRecords (StudyRecordID)
);

-- Maak de Enrollments tabel aan
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    EnrollmentDate DATE DEFAULT CURRENT_DATE,
    CONSTRAINT FK_Enrollments_Students FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    CONSTRAINT FK_Enrollments_Classes FOREIGN KEY (ClassID) REFERENCES Classes (ClassID),
    CONSTRAINT UQ_Enrollments UNIQUE (StudentID, ClassID)
);

-- Maak de SubjectsTeachers tabel aan
CREATE TABLE SubjectsTeachers (
    SubjectsTeachersID INT PRIMARY KEY,
    SubjectID INT,
    TeacherID INT,
    CONSTRAINT FK_SubjectsTeachers_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID),
    CONSTRAINT FK_SubjectsTeachers_Teachers FOREIGN KEY (TeacherID) REFERENCES Teachers (TeacherID),
    CONSTRAINT UQ_SubjectsTeachers UNIQUE (SubjectID, TeacherID)
);

-- Voeg voorbeeldgegevens toe aan de Subjects tabel
INSERT INTO Subjects (SubjectID, SubjectName)
VALUES (1, 'Mathematics'),
       (2, 'Science'),
       (3, 'History');

-- Voeg voorbeeldgegevens toe aan de Teachers tabel
INSERT INTO Teachers (TeacherID, TeacherName, SubjectID, Salary)
VALUES (1, 'John Doe', 1, 55000),
       (2, 'Jane Smith', 2, 60000),
       (3, 'Emily Johnson', 3, 58000);

-- Voeg voorbeeldgegevens toe aan de StudyRecords tabel
INSERT INTO StudyRecords (StudyRecordID, RecordDetails, GPA)
VALUES (1, 'Excellent', 3.8),
       (2, 'Good', 3.2),
       (3, 'Average', 2.5);

-- Voeg voorbeeldgegevens toe aan de Classes tabel
INSERT INTO Classes (ClassID, ClassName, TeacherID, MaxStudents)
VALUES (1, 'Math 101', 1, 25),
       (2, 'Science 101', 2, 28),
       (3, 'History 101', 3, 30);

-- Voeg voorbeeldgegevens toe aan de Students tabel
INSERT INTO Students (StudentID, StudentName, ClassID, StudyRecordID, Age, EnrollmentDate)
VALUES (1, 'Alice Brown', 1, 1, 20, '2023-09-01'),
       (2, 'Bob White', 2, 2, 22, '2023-09-01'),
       (3, 'Charlie Black', 3, 3, 23, '2023-09-01');

-- Voeg voorbeeldgegevens toe aan de Enrollments tabel
INSERT INTO Enrollments (EnrollmentID, StudentID, ClassID, EnrollmentDate)
VALUES (1, 1, 1, '2023-09-01'),
       (2, 2, 2, '2023-09-01'),
       (3, 3, 3, '2023-09-01');

-- Voeg voorbeeldgegevens toe aan de SubjectsTeachers tabel
INSERT INTO SubjectsTeachers (SubjectsTeachersID, SubjectID, TeacherID)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 3);
```

### Toelichting op de tabellen:
- **Subjects:** Bevat de verschillende vakken.
- **Teachers:** Bevat gegevens van leraren, inclusief het vak dat ze onderwijzen.
- **StudyRecords:** Bevat studieresultaten van studenten.
- **Classes:** Bevat de verschillende klassen, inclusief de leraar die de klas onderwijst.
- **Students:** Bevat gegevens van studenten, inclusief de klas en studieresultaten.
- **Enrollments:** Bevat de inschrijvingen van studenten in klassen.
- **SubjectsTeachers:** Bevat de koppelingen tussen vakken en leraren.

### Opdracht:
1. **Maak een SELECT-query met een enkele JOIN**
   - Selecteer alle studenten en hun klassen.

2. **Maak een SELECT-query met meerdere JOINs**
   - Selecteer alle studenten, hun klassen en de leraren van die klassen.

3. **Update een leraar zijn salaris op basis van een LIKE en JOIN**
   - Verhoog het salaris van leraren die een specifiek vak onderwijzen.

4. **Voeg nieuwe gegevens toe aan de Students tabel**
   - Voeg een nieuwe student toe en controleer met een SELECT-query.

### Hints:

<details>
  <summary>Hints als Stappenplan</summary>

1. **SELECT met een enkele JOIN:**
   - Gebruik `SELECT` en `JOIN` om gegevens uit `Students` en `Classes` te combineren.
   ```sql
   SELECT [kolom_namen]
   FROM [tabel1]
   INNER JOIN [tabel2] ON [tabel1.kolom] = [tabel2.kolom];
   ```

**Resultaat:**

| Student Name    | Class Name  |
|-----------------|-------------|
| Alice Brown     | Math 101    |
| Bob White       | Science 101 |
| Charlie Black   | History 101 |


2. **SELECT met meerdere JOINs:**
   - Gebruik meerdere `JOIN`s om gegevens uit `Students`, `Classes` en `Teachers` te combineren.
   ```sql
   SELECT [kolom_namen]
   FROM [tabel1]
   INNER JOIN [tabel2] ON [tabel1.kolom] = [tabel2.kolom]
   INNER JOIN [tabel3] ON [tabel2.kolom] = [tabel3.kolom];
   ```

**Resultaat:**

| Student Name    | Class Name  | Teacher Name   |
|-----------------|-------------|----------------|
| Alice Brown     | Math 101    | John Doe       |
| Bob White       | Science 101 | Jane Smith     |
| Charlie Black   | History 101 | Emily Johnson  |



3. **UPDATE met LIKE en JOIN:**
   - Gebruik `UPDATE`, `JOIN` en `LIKE` om het salaris van leraren bij te werken.
   ```sql
   UPDATE [tabel1]
   SET [kolom] = [waarde]
   FROM [tabel2]
   WHERE [tabel1.kolom] = [tabel2.kolom]
   AND [tabel2.kolom] LIKE '[waarde]';
   ```
**Resultaat:**

UPDATE 1



4. **Gegevens toevoegen en controleren:**
   - Gebruik `INSERT INTO` om een nieuwe student toe te voegen en `SELECT` om te controleren.
   ```sql
   INSERT INTO [tabel] ([kolom1], [kolom2], ...)
   VALUES ([waarde1], [waarde2], ...);

   SELECT * FROM [tabel] WHERE [kolom] = [waarde];
   ```
</details>

<details>
  <summary>Volledige Uitwerking</summary>

1. **SELECT met een enkele JOIN:**

   ```sql
   SELECT Students.StudentName, Classes.ClassName
   FROM Students
   INNER JOIN Classes ON Students.ClassID = Classes.ClassID;
   ```

**Resultaat:**

| Student Name    | Class Name  |
|-----------------|-------------|
| Alice Brown     | Math 101    |
| Bob White       | Science 101 |
| Charlie Black   | History 101 |

2. **SELECT met meerdere JOINs:**

   ```sql
   SELECT Students.StudentName, Classes.ClassName, Teachers.TeacherName
   FROM Students
   INNER JOIN Classes ON Students.ClassID = Classes.ClassID
   INNER JOIN Teachers ON Classes.TeacherID = Teachers.TeacherID;
   ```
   
**Resultaat:**

| Student Name    | Class Name  | Teacher Name   |
|-----------------|-------------|----------------|
| Alice Brown     | Math 101    | John Doe       |
| Bob White       | Science 101 | Jane Smith     |
| Charlie Black   | History 101 | Emily Johnson  |


3. **UPDATE met LIKE en JOIN:**

   ```sql
   UPDATE Teachers
   SET Salary = Salary + 5000
   FROM Subjects
   WHERE Teachers.SubjectID = Subjects.SubjectID
   AND Subjects.SubjectName LIKE '%Math%';
   ```

4. **Gegevens toevoegen en controleren:**

   ```sql
   INSERT INTO Students (StudentID, StudentName, ClassID, StudyRecordID, Age, EnrollmentDate)
   VALUES (4, 'David Green', 1, 1, 19, '2023-09-02');

   SELECT * FROM Students WHERE StudentID = 4;
   ```

**Resultaat:**

| Student ID | Student Name | Class ID | Study Record ID | Age | Enrollment Date |
|------------|--------------|----------|-----------------|-----|-----------------|
| 4          | David Green  | 1        | 1               | 19  | 2023-09-02      |


</details>

### Belangrijke punten:
- **Gebruik van JOINs:** Zorg ervoor dat je de juiste syntaxis gebruikt voor het combineren van gegevens uit meerdere tabellen.
- **Voorwaardelijke UPDATE:** Gebruik `LIKE` en `JOIN` om specifieke rijen bij te werken.
- **Testen van wijzigingen:** Controleer na elke wijziging de gegevens in de tabel om er zeker van te zijn dat de wijzigingen correct zijn doorgevoerd.
