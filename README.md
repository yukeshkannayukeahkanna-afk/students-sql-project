# students-sql-project
# 🎓 Student Performance Analysis using SQL

## 📌 Project Overview

This project demonstrates how **SQL can be used for data analysis** by analyzing student academic performance.
The database contains information about students, courses, and their marks. Using SQL queries, we generate insights such as **average scores, top-performing students, rankings, pass percentages, and course-wise performance.**

This project is designed to showcase **data analytics skills using SQL**, including joins, aggregations, ranking, and views.

---

# 🗂 Database Structure

The project consists of **three main tables**.

### 1️⃣ Students Table

Stores student demographic details and subject scores.

| Column       | Description               |
| ------------ | ------------------------- |
| StudentID    | Unique student identifier |
| Name         | Student name              |
| Gender       | Student gender            |
| Age          | Age of student            |
| Grade        | Class/section             |
| MathScore    | Mathematics marks         |
| ScienceScore | Science marks             |
| EnglishScore | English marks             |

---

### 2️⃣ Courses Table

Stores available subjects.

| Column     | Description              |
| ---------- | ------------------------ |
| CourseID   | Unique course identifier |
| CourseName | Name of the course       |

Courses used in this project:

* Mathematics
* Science
* English

---

### 3️⃣ Enrollments Table

Stores **student marks per course** using relational mapping.

| Column       | Description          |
| ------------ | -------------------- |
| EnrollmentID | Unique enrollment ID |
| StudentID    | Reference to student |
| CourseID     | Reference to course  |
| Grade        | Marks obtained       |

This table connects students and courses using **foreign keys**.

---

# ⚙️ SQL Concepts Used

This project demonstrates multiple SQL concepts:

* Table creation
* Primary keys and foreign keys
* Data insertion
* INNER JOIN
* GROUP BY
* Aggregate functions
* Ranking using variables
* CASE statements
* Views

---

# 📊 Data Analysis Queries

The project performs several analytical queries:

### ✔ Course-wise student marks

Displays student marks for each subject.

### ✔ Average marks per course

Calculates the average score for every subject.

### ✔ Top 3 students

Identifies the highest-performing students based on total marks.

### ✔ Student ranking

Ranks students based on their total scores.

### ✔ Failed student count

Counts students who scored below the passing mark.

### ✔ Course-wise pass percentage

Calculates the percentage of students passing each subject.

### ✔ Students enrolled in multiple courses

Shows students taking more than one course.

---

# 🏆 Example Insights

Some insights that can be derived from the analysis:

* Identify **top-performing students**
* Determine **which subject students perform best in**
* Analyze **pass percentages per course**
* Rank students based on academic performance

---

# 🧠 SQL View

A view named **StudentTotals** is created to simplify total marks calculation.

This view stores:

* Student ID
* Student name
* Total marks

This allows easy querying for **leaderboards and rankings**.

---

# 💻 Technologies Used

* SQL (MySQL)
* Relational Database Concepts
* Data Analysis using SQL Queries

---

# 📈 Learning Outcomes

Through this project, the following skills are demonstrated:

* Designing relational database schemas
* Writing analytical SQL queries
* Using joins to combine multiple tables
* Performing aggregations and ranking
* Creating views for reusable queries

---

# 🚀 How to Run the Project

1. Create the database in MySQL
2. Run the table creation queries
3. Insert the sample data
4. Execute the analysis queries

The output will show **student rankings, averages, and performance insights.**

---

## Author
**Yukesh**  
- Passionate about databases and SQL practice  
- Continuously learning and sharing SQL projects on GitHub  

---

## Connect
- LinkedIn: [www.linkedin.com/in/yukeshkanna022007]  
- GitHub: [https://github.com/yukeshkannayukeahkanna-afk]  
