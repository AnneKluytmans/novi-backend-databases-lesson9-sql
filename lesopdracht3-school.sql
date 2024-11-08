-- Create Subjects table
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL UNIQUE
);

-- Create Teachers table
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50) NOT NULL,
    SubjectID INT,
    Salary DECIMAL(10, 2) DEFAULT 50000 CHECK (Salary > 0),
    CONSTRAINT FK_Teachers_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID)
);

-- Create StudyRecords table
CREATE TABLE StudyRecords (
    StudyRecordID INT PRIMARY KEY,
    RecordDetails VARCHAR(255) NOT NULL,
    GPA DECIMAL(3, 2) CHECK (GPA >= 0.0 AND GPA <= 4.0)
);

-- Create Classes table
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50) NOT NULL UNIQUE,
    TeacherID INT,
    MaxStudents INT DEFAULT 30 CHECK (MaxStudents > 0 AND MaxStudents <= 100),
    CONSTRAINT FK_Classes_Teachers FOREIGN KEY (TeacherID) REFERENCES Teachers (TeacherID)
);

-- Create Students table
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

-- Create Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    EnrollmentDate DATE DEFAULT CURRENT_DATE,
    CONSTRAINT FK_Enrollments_Students FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    CONSTRAINT FK_Enrollments_Classes FOREIGN KEY (ClassID) REFERENCES Classes (ClassID),
    CONSTRAINT UQ_Enrollments UNIQUE (StudentID, ClassID)
);

-- Create SubjectsTeachers table
CREATE TABLE SubjectsTeachers (
    SubjectsTeachersID INT PRIMARY KEY,
    SubjectID INT,
    TeacherID INT,
    CONSTRAINT FK_SubjectsTeachers_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID),
    CONSTRAINT FK_SubjectsTeachers_Teachers FOREIGN KEY (TeacherID) REFERENCES Teachers (TeacherID),
    CONSTRAINT UQ_SubjectsTeachers UNIQUE (SubjectID, TeacherID)
);

-- Fill all the tables with data
INSERT INTO Subjects (SubjectID, SubjectName)
VALUES (1, 'Mathematics'),
       (2, 'Science'),
       (3, 'History');

INSERT INTO Teachers (TeacherID, TeacherName, SubjectID, Salary)
VALUES (1, 'John Doe', 1, 55000),
       (2, 'Jane Smith', 2, 60000),
       (3, 'Emily Johnson', 3, 58000);

INSERT INTO StudyRecords (StudyRecordID, RecordDetails, GPA)
VALUES (1, 'Excellent', 3.8),
       (2, 'Good', 3.2),
       (3, 'Average', 2.5);

INSERT INTO Classes (ClassID, ClassName, TeacherID, MaxStudents)
VALUES (1, 'Math 101', 1, 25),
       (2, 'Science 101', 2, 28),
       (3, 'History 101', 3, 30);

INSERT INTO Students (StudentID, StudentName, ClassID, StudyRecordID, Age, EnrollmentDate)
VALUES (1, 'Alice Brown', 1, 1, 20, '2023-09-01'),
       (2, 'Bob White', 2, 2, 22, '2023-09-01'),
       (3, 'Charlie Black', 3, 3, 23, '2023-09-01');

INSERT INTO Enrollments (EnrollmentID, StudentID, ClassID, EnrollmentDate)
VALUES (1, 1, 1, '2023-09-01'),
       (2, 2, 2, '2023-09-01'),
       (3, 3, 3, '2023-09-01');

INSERT INTO SubjectsTeachers (SubjectsTeachersID, SubjectID, TeacherID)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 3);

-- Select all students with their classes
SELECT * FROM Students;
SELECT * FROM Classes;

SELECT s.StudentName, c.ClassName
FROM Students s
INNER JOIN Classes c ON s.ClassID = c.ClassID;

-- Select all students with their classes and their teachers
SELECT * FROM Students;
SELECT * FROM Classes;
SELECT * FROM Teachers;

SELECT s.StudentName, c.ClassName, t.TeacherName
FROM Students s
INNER JOIN Classes c ON s.ClassID = c.ClassID
INNER JOIN Teachers t ON c.TeacherID = t.TeacherID;

-- Update the salary of the Match teachers
SELECT * FROM Teachers;

UPDATE Teachers
SET Salary = Salary + 5000.00
FROM Subjects
WHERE Teachers.SubjectID = Subjects.SubjectID
AND Subjects.SubjectName LIKE '%Math%';


-- Add student to Students table
INSERT INTO Students (StudentID, StudentName, ClassID, StudyRecordID, Age, EnrollmentDate)
VALUES (4, 'David Green', 1, 1, 19, '2023-09-02');

SELECT * FROM Students
WHERE StudentID = 4;

SELECT * FROM Students;