

CREATE TABLE "courses" (
"id" INTEGER PRIMARY KEY,
"course_name" TEXT,
"course_number" INTEGER,
"start_time" TEXT,
"professor_id" INTEGER REFERENCES "professors"(""),
"subject_id" INTEGER REFERENCES "subjects"("")
);
INSERT INTO "courses" VALUES (1, 'Literature', 201, '9:00am', 6, 3);
INSERT INTO "courses" VALUES (2, 'English 101', 101, '10:00am', 7, 3);
INSERT INTO "courses" VALUES (3, 'Linguistics', 311, '2:00pm', 7, 3);
INSERT INTO "courses" VALUES (4, 'English 301', 301, '1:00pm', 6, 3);
INSERT INTO "courses" VALUES (5, 'Calculus 1', 105, '11:00am', 3, 1);
INSERT INTO "courses" VALUES (6, 'Calculus 3', 305, '1:00pm', 3, 1);
INSERT INTO "courses" VALUES (7, 'Statistics', 204, '8:00pm', 8, 1);
INSERT INTO "courses" VALUES (8, 'American History', 101, '9:00am', 4, 2);
INSERT INTO "courses" VALUES (9, 'Ancient History', 201, '12:00pm', 2, 2);
INSERT INTO "courses" VALUES (10, 'General Biology with Lab', 105, '3:00pm', 5, 4);
INSERT INTO "courses" VALUES (11, 'Botany', 111, '11:00am', 1, 4);
INSERT INTO "courses" VALUES (12, 'General Chemistry with Lab', 110, '8:00am', 5, 4);
INSERT INTO "courses" VALUES (13, 'Physics with Lab', 108, '10:00am', 5, 4);


CREATE TABLE "professors" (
"id" INTEGER PRIMARY KEY,
"name" TEXT,
"email_address" TEXT,
"office_location" TEXT
);
INSERT INTO "professors" VALUES (1, 'Hugh B. Correia', 'hcorreia@university.edu', '231');
INSERT INTO "professors" VALUES (2, 'Tamara R. Kane', 'tkane@university.edu', '103');
INSERT INTO "professors" VALUES (3, 'Gary A. Mathews', 'gmatthews@university.edu', '313');
INSERT INTO "professors" VALUES (4, 'Delores J. Parrish', 'dparrish@university.edu', '210');
INSERT INTO "professors" VALUES (5, 'Randy M. Murphy', 'rmurphy@university.edu', '105');
INSERT INTO "professors" VALUES (6, 'Mary D. Scott', 'mscott@university.edu', '230');
INSERT INTO "professors" VALUES (7, 'Elizabeth D. Villarreal', 'evillarreal@university.edu', '302');
INSERT INTO "professors" VALUES (8, 'Patrick M. Hatchett', 'phatchett@university.edu', '312');


CREATE TABLE "subjects" (
"id" INTEGER PRIMARY KEY,
"subject_name" TEXT
);
INSERT INTO "subjects" VALUES (1, 'Math');
INSERT INTO "subjects" VALUES (2, 'History');
INSERT INTO "subjects" VALUES (3, 'English');
INSERT INTO "subjects" VALUES (4, 'Science');


SELECT course_name FROM courses WHERE start_time = "9:00am";

select email_address from professors
where professors.name = "Delores J. Parrish"

SELECT name FROM professors WHERE office_location = "105";

select email_address FROM professors
inner join courses on
professors.id = courses.professor_id
where courses.course_name = "Botany"

select name from professors
inner join courses on 
	professors.id = courses.professor_id
inner join subjects on
	courses.subject_id = subjects.id
where subjects.subject_name = "Math"
