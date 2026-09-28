CREATE DATABASE university_db

CREATE TABLE departments(
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
)

CREATE TABLE cources(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
)

CREATE TABLE students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL
)

CREATE TABLE enrollments(
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY(course_id) REFERENCES cources(course_id) ON DELETE CASCADE
)

CREATE TABLE health_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    blood_group VARCHAR(3),
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE
)

INSERT INTO departments
VALUES
(NULL, "computer science"),
(NULL, "mathematics"),
(NULL, "physics")

INSERT INTO cources VALUES
(NULL, "database systems", 4, 1),
(NULL, "algorithms", 3, 1),
(NULL, "calculus", 4, 2),
(NULL, "quantum mechanics", 5, 3)

INSERT INTO students VALUES 
(NULL, "alice"),
(NULL, "bob"),
(NULL, "charlie"),
(NULL, "sami"),
(NULL, "eva")

INSERT INTO enrollments VALUES
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 2),
(NULL, 3, 3),
(NULL, 4, 3),
(NULL, 4, 4),
(NULL, 5, NULL)

INSERT INTO health_records VALUES 
(NULL, 1, "A+"),
(NULL, 2, "B+"),
(NULL, 3, "O-"),
(NULL, 4, "AB+"),
(NULL, 5, "A-")

SELECT students.student_name, health_records.blood_group
FROM students INNER JOIN health_records
ON health_records.student_id = students.student_id

SELECT students.student_name, cources.course_name
FROM students INNER JOIN enrollments ON students.student_id = enrollments.student_id_id
INNER JOIN cources ON cources.course_id = enrollments.course_id

SELECT students.student_name, cources.course_name
FROM students LEFT JOIN enrollments ON students.student_id = enrollments.student_id_id
LEFT JOIN cources ON cources.course_id = enrollments.course_id

SELECT students.student_name, cources.course_name
FROM students INNER JOIN enrollments ON students.student_id = enrollments.student_id_id
RIGHT JOIN cources ON cources.course_id = enrollments.course_id

DELETE FROM departments
WHERE dept_id = 3; 

DELETE FROM departments
WHERE student_id_id = 3; 

SELECT COUNT(student_id) AS "total_nb_of_students"
FROM students;

SELECT AVG(credits) AS "average_of_credits"
FROM cources;

SELECT MAX(credits) AS "maximum_course_credits"
FROM courses;

SELECT MIN(credits) AS "minimum_course_credits"
FROM courses;

SELECT COUNT(*) AS "nb_of_a_blood_group"
FROM students INNER JOIN health_records ON students.student_id = health_records.student_id
WHERE health_records.blood_group = "A+";