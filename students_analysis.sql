DROP TABLE IF EXISTS student_details;

CREATE TABLE student_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    gender CHAR(1),
    age INT,
    section CHAR(1),
    mark1 INT,
    mark2 INT,
    mark3 INT
);

INSERT INTO student_details (name, gender, age, section, mark1, mark2, mark3) VALUES
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

SELECT * FROM student_details;

SELECT name, 
       mark1 + mark2 + mark3 AS total_marks
FROM student_details;

SELECT name,
       (mark1 + mark2 + mark3)/3 AS average_marks
FROM student_details;

SELECT name,
       (mark1 + mark2 + mark3)/3 AS average_marks
FROM student_details
ORDER BY average_marks DESC
LIMIT 3;

SELECT section,
       AVG((mark1 + mark2 + mark3)/3) AS section_average
FROM student_details
GROUP BY section;

SELECT name
FROM student_details
WHERE mark1 < 40
   OR mark2 < 40
   OR mark3 < 40;
