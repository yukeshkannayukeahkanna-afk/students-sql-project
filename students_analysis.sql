-- =========================================
-- CREATE DATABASE
-- =========================================

CREATE DATABASE StudentAnalytics;
USE StudentAnalytics;

-- =========================================
-- STUDENTS TABLE
-- =========================================

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    gender CHAR(1),
    age INT,
    grade VARCHAR(2),
    math_score INT,
    science_score INT,
    english_score INT
);

INSERT INTO students 
(name, gender, age, grade, math_score, science_score, english_score)
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

-- =========================================
-- COURSES TABLE
-- =========================================

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50)
);

INSERT INTO courses (course_name)
VALUES ('Mathematics'), ('Science'), ('English');

-- =========================================
-- ENROLLMENTS TABLE
-- =========================================

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade INT
);

-- Insert scores
INSERT INTO enrollments SELECT NULL, student_id, 1, math_score FROM students;
INSERT INTO enrollments SELECT NULL, student_id, 2, science_score FROM students;
INSERT INTO enrollments SELECT NULL, student_id, 3, english_score FROM students;

-- =========================================
-- BASIC QUERY
-- =========================================

SELECT name,
ROUND((math_score+science_score+english_score)/3,2) AS avg_score
FROM students;

-- =========================================
-- TOP 3 STUDENTS
-- =========================================

SELECT s.name, AVG(e.grade) AS avg_score
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.name
ORDER BY avg_score DESC
LIMIT 3;

-- =========================================
-- AVERAGE PER COURSE
-- =========================================

SELECT c.course_name, AVG(e.grade) AS avg_score
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- =========================================
-- TOP STUDENT PER COURSE
-- =========================================

SELECT c.course_name, s.name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = (
    SELECT MAX(e2.grade)
    FROM enrollments e2
    WHERE e2.course_id = e.course_id
);

-- =========================================
-- STUDENTS ABOVE AVG
-- =========================================

SELECT s.name, c.course_name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade > (
    SELECT AVG(e2.grade)
    FROM enrollments e2
    WHERE e2.course_id = e.course_id
);
