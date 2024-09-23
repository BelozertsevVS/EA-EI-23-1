INSERT INTO STUDENTS (StudentsID,FirstName,LastName,EnrollmentDate)
VALUES
(1,'Вероніка','Цапко','20230808'),

(2,'Марія','Кравченко','20230804'),

(3,'Артем','Беспалий','20230719');

INSERT INTO COURSES (CourseID, CourseName, CourseDescriction, Credits)
VALUES
(1,'2 курс', 'Флологія','50'),
(2,'1 курс','Акторство','30'),
(3,'1курс','Митниця','45');

SELECT * FROM Students;

SELECT * FROM Courses;

ALTER TABLE Students ADD Email NVARCHAR (50);

ALTER TABLE Courses ADD Department NVARCHAR (50);

SELECT * FROM Students; 

SELECT * FROM Courses;

DROP DATABASE UNIVERSITY;