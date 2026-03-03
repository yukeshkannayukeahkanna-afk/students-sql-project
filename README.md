# students-sql-project
# Student Performance Analysis (SQL)

## 📌 Project Overview

This project was developed as part of a **SQL Data Analysis Internship** task.

The goal is to design a relational database for managing student data and analyzing academic performance using SQL queries.

The project is divided into two parts:

* **Task 1:** Create a Student Management Database and perform basic analysis.
* **Task 2:** Extend the database with Courses and Enrollments tables and perform advanced analysis using JOINs and aggregations.

---

## 🗂 Database Structure

### 1️⃣ Students Table

Stores student personal details and subject-wise scores.

**Columns:**

* StudentID (Primary Key)
* Name
* Gender
* Age
* Grade
* MathScore
* ScienceScore
* EnglishScore

---

### 2️⃣ Courses Table

Stores course details.

**Columns:**

* CourseID (Primary Key)
* CourseName

---

### 3️⃣ Enrollments Table

Creates a relationship between Students and Courses.

**Columns:**

* EnrollmentID (Primary Key)
* StudentID (Foreign Key)
* CourseID (Foreign Key)
* Grade (Marks scored in the course)

---

## 🔗 Relationships

* One student can enroll in multiple courses.
* One course can have multiple students.
* This forms a **one-to-many relationship**, implemented using foreign keys.

---

## 📊 SQL Concepts Used

✔ CREATE TABLE
✔ INSERT INTO
✔ SELECT
✔ WHERE
✔ UPDATE
✔ ORDER BY
✔ GROUP BY
✔ Aggregate Functions (AVG, SUM, COUNT)
✔ JOIN (INNER JOIN)
✔ Subqueries

---

## 📈 Analysis Performed

* View all students
* Calculate average marks per subject
* Find top-performing students
* Count students per grade
* List students enrolled in each course
* Calculate average grade per course
* Find top 3 students overall
* Count students who failed

---

## 🛠 Tools Used

* MySQL / PostgreSQL
* DB Fiddle (Online SQL Runner)
* VS Code

---

## 🎯 Learning Outcomes

* Designed a relational database structure
* Implemented foreign key constraints
* Practiced SQL joins and aggregations
* Developed analytical thinking using SQL
* Understood normalization and table relationships

---

## 🚀 How to Run

1. Copy the SQL script into MySQL / DB Fiddle.
2. Execute the script.
3. Run the queries provided at the end of the file to view results.

---

## 📌 Author

Developed by: **Yukesh Kanna**
SQL Data Analysis Internship Project

---

## Author
**Yukesh**  
- Passionate about databases and SQL practice  
- Continuously learning and sharing SQL projects on GitHub  

---

## Connect
- LinkedIn: [www.linkedin.com/in/yukeshkanna022007]  
- GitHub: [https://github.com/yukeshkannayukeahkanna-afk]  
