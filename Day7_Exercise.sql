CREATE DATABASE Student;

USE Student;


CREATE TABLE StudentDetails(ID int PRIMARY KEY, FirstName varchar(255), LastName varchar(255), Gender varchar(1), Email varchar(255), STD varchar(5));

INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,std) VALUES 
				(1,'Karthik','Surya','M','karthik.s@gmail.com','XII'),
				(2,'Jaya','Rajan','F','jsurya@gmail.com','XI'),
				(3,'Karthik','M S','M','karthikms@gmail.com','X'),
				(4,'Aswathy','Achu','F','aswathy.achu@gmail.com','VIII'),
				(5,'Ashiq','Abu','M','abuashiq@gmail.com','XII'),
				(6,'Aswathy','Achu','F','achu.aswathy@gmail.com','XI'),
				(7,'Tony','Thomas','M','tonyt@gmail.com','X'),
				(8,'Angela','Thomas','F','angiethomas@gmail.com','X'),
				(9,'Aleena','Shajan','F','aleena.s@gmail.com','XI'),
				(10,'Nandana','Gopal','F','nandu.gopal@gmail.com','XI'),
				(11,'Vishnu','K J','M','vishnukj@gmail.com','X'),
				(12,'Nihal','Mohammed','M','mohdnihal@gmail.com','XI');
				
SELECT * FROM StudentDetails WHERE Id = 9;	

CREATE index st_id on Student.StudentDetails (ID);

CREATE table Subjects (Code varchar(10) PRIMARY KEY, 
						Subject varchar(255));
					
INSERT INTO Subjects(Code, Subject) VALUES
				('S001', 'English'),
				('S002', 'Math');
			

CREATE table Marks (StudentID int, 
					SubjectCode varchar(255), 
					Mark int,  
					FOREIGN KEY(StudentID) REFERENCES StudentDetails(ID)
					ON DELETE CASCADE,
					FOREIGN KEY(SubjectCode) REFERENCES Subjects(Code)
					ON DELETE CASCADE);
				
INSERT INTO Marks(StudentID, SubjectCode, Mark) VALUES
				(1, 'S001', 89),
				(2, 'S001', 78),
				(3, 'S001', 83),
				(4, 'S001', 67),
				(5, 'S001', 94),
				(6, 'S001', 80),
				(7, 'S001',NULL),
				(8, 'S001', 99),
				(9, 'S001', 75),
				(10, 'S001', 86),
				(11, 'S001', 90),
				(12, 'S001', 69),
				(1, 'S002', 65),
				(2, 'S002', 88),
				(3, 'S002', 79),
				(4, 'S002', 76),
				(5, 'S002', 98),
				(6, 'S002', 91),
				(7, 'S002',NULL),
				(8, 'S002', 88),
				(9, 'S002', 62),
				(10, 'S002', 68),
				(11, 'S002', 77),
				(12, 'S002', 90);


SELECT * FROM StudentDetails s INNER JOIN Marks m ON s.ID = m.StudentID INNER JOIN Subjects ss ON m.SubjectCode = ss.Code;	

SELECT FirstName , Subject, Mark, STD 
	FROM StudentDetails sd 
	INNER JOIN Marks m ON sd.ID = m.StudentID 
	INNER JOIN Subjects s ON m.SubjectCode = s.Code
	WHERE Mark > 90;

SELECT FirstName , Subject, Mark, STD
	FROM StudentDetails sd , Marks m, Subjects s
	WHERE m.Mark > 90 AND sd.ID = m.StudentID AND m.SubjectCode = s.Code;

DELETE FROM StudentDetails WHERE ID = 5;

SELECT ID, FirstName, LastName
	FROM StudentDetails  sd
	LEFT JOIN Marks m ON  sd.ID = m.StudentID
	WHERE m.Mark IS NULL
	GROUP BY sd.ID;

SELECT ID, FirstName, LastName ,  SUM(m.Mark) AS TotalMarks
	FROM StudentDetails sd, Marks m
	WHERE m.StudentID = sd.ID AND STD = 'X' AND m.Mark IS NOT NULL
	GROUP BY sd.ID
	ORDER BY TotalMarks DESC 
	LIMIT 1;


SELECT ID, FirstName, LastName ,  SUM(m.Mark) AS TotalMarks
	FROM StudentDetails sd, Marks m
	WHERE m.StudentID = sd.ID AND STD = 'X' AND m.Mark IS NOT NULL
	GROUP BY sd.ID
	ORDER BY TotalMarks 
	LIMIT 1;



			