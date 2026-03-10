CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Grade VARCHAR(2),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Yukesh', 'M', 19, 'A', 92, 89, 94),
('Dhivakaran', 'M', 20, 'A', 85, 88, 90),
('Rekha', 'F', 19, 'A', 91, 93, 89),
('Asin', 'F', 21, 'B', 78, 82, 80),
('Gopika', 'F', 20, 'C', 65, 70, 68),
('Rickul', 'M', 22, 'C', 64, 66, 62),
('Priya', 'F', 20, 'B', 79, 81, 83),
('Harish', 'M', 22, 'B', 75, 73, 77),
('Jeni', 'F', 20, 'A', 88, 90, 92),
('Sunil', 'M', 21, 'B', 76, 74, 78);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50)
);

INSERT INTO Courses (CourseName)
VALUES 
('Mathematics'),
('Science'),
('English');


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Grade INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Enrollments (StudentID, CourseID, Grade)
SELECT StudentID, 1, MathScore FROM Students;

INSERT INTO Enrollments (StudentID, CourseID, Grade)
SELECT StudentID, 2, ScienceScore FROM Students;

INSERT INTO Enrollments (StudentID, CourseID, Grade)
SELECT StudentID, 3, EnglishScore FROM Students;

SELECT c.CourseName, s.Name, e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
ORDER BY c.CourseName;


SELECT c.CourseName, AVG(e.Grade) AS AverageMarks
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName;


SELECT s.Name, SUM(e.Grade) AS TotalMarks
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY s.Name
ORDER BY TotalMarks DESC
LIMIT 3;


SELECT COUNT(*) AS FailedCount
FROM Enrollments
WHERE Grade < 40;


SET @rank := 0;

SELECT 
    @rank := @rank + 1 AS RankPosition,
    t.Name,
    t.TotalMarks
FROM
(
    SELECT s.Name, SUM(e.Grade) AS TotalMarks
    FROM Enrollments e
    JOIN Students s ON e.StudentID = s.StudentID
    GROUP BY s.Name
    ORDER BY TotalMarks DESC
) t;



SELECT 
    c.CourseName,
    s.Name,
    e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
ORDER BY c.CourseName, e.Grade DESC;



SELECT 
    c.CourseName,
    ROUND(SUM(CASE WHEN e.Grade >= 40 THEN 1 ELSE 0 END) * 100 / COUNT(*),2) AS PassPercentage
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName;



SELECT s.Name, COUNT(e.CourseID) AS CourseCount
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY s.Name
HAVING COUNT(e.CourseID) > 1;




CREATE VIEW StudentTotals AS
SELECT s.StudentID, s.Name, SUM(e.Grade) AS TotalMarks
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY s.StudentID, s.Name;


SELECT * 
FROM StudentTotals
ORDER BY TotalMarks DESC;
