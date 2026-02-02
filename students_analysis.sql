CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Gender CHAR(1),
    Age INT(2),
    Grade VARCHAR(2),
    MathScore INT(3),
    ScienceScore INT(3),
    EnglishScore INT(3));
INSERT INTO Students 
(Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Yukesh', 'M', 19, 'A', 92, 89, 94),
('Rekha', 'F', 19, 'A', 91, 93, 89),
('Dhivakaran', 'M', 20, 'A', 85, 88, 90),
('Asin', 'F', 21, 'B', 78, 82, 80),
('Gopika', 'F', 20, 'C', 65, 70, 68),
('Rickul', 'M', 22, 'C', 64, 66, 62),
('Priya', 'F', 20, 'B', 79, 81, 83),
('Harish', 'M', 22, 'B', 75, 73, 77),
('Jeni', 'F', 20, 'A', 88, 90, 92),
('Sunil', 'M', 21, 'B', 76, 74, 78);

SELECT * FROM Students;
SELECT 
    AVG(MathScore) AS Avg_Math,
    AVG(ScienceScore) AS Avg_Science,
    AVG(EnglishScore) AS Avg_English
FROM Students;
SELECT *,
       (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;
SELECT Grade, COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;
SELECT Gender,
       AVG(MathScore + ScienceScore + EnglishScore) AS AvgTotalScore
FROM Students
GROUP BY Gender;
SELECT * 
FROM Students
WHERE MathScore > 90;
UPDATE Students
SET Grade = 'A+'
WHERE Name = 'Yukesh';
SELECT * FROM Students WHERE Name = 'Yukesh';
