USE practice;

#Given a Student Database with Holding Student details as below find the datatype that goes well with each column
#Table Name : StudentDetails
#ID
#FirstName
#LastName
#Gender
#Email
#YearOfBirth
#Create table using the create table command for the above specified table
CREATE TABLE StudentDetails(ID int, 
							FirstName varchar(255), 
							LastName varchar(255), 
							Gender varchar(1), 
							Email varchar(255), 
							YearOfBirth year);

#Alter above table add new Column 'Year Of Admission'
ALTER TABLE StudentDetails 
	ADD YearOfAdmission year;

#Alter above table change Column Name 'Year Of Birth' to 'Date Of Birth'
ALTER TABLE StudentDetails 
	CHANGE YearOfBirth DateOfBirth date;

INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (1,'Karthik','Surya','M','karthik.s@gmail.com','2000-01-10',2008);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (2,'Jaya','Rajan','F','jsurya@gmail.com','2001-03-28',2010);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (3,'Karthik','M S','M','karthikms@gmail.com','2002-12-12',2007);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (4,'Aswathy','Achu','F','aswathy.achu@gmail.com','2004-05-21',2009);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (5,'Ashiq','Abu','M','abuashiq@gmail.com','2000-12-25',2007);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (6,'Aswathy','Achu','F','achu.aswathy@gmail.com','2001-10-07',2008);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (7,'Tony','Thomas','M','tonyt@gmail.com','2002-07-09',2008);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (8,'Angela','Thomas','F','angiethomas@gmail.com','2003-08-28',2008);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (9,'Aleena','Shajan','F','aleena.s@gmail.com','2001-06-04',2010);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (10,'Nandana','Gopal','F','nandu.gopal@gmail.com','2001-06-16',2010);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (11,'Vishnu','K J','M','vishnukj@gmail.com','2004-01-31',2010);
INSERT INTO StudentDetails (ID,firstname,lastname,gender,email,dateofbirth,yearofadmission) VALUES (12,'Nihal','Mohammed','M','mohdnihal@gmail.com','2001-09-11',2010);

#Add New Column 'Branch' and 'Std' with appropriate data types and update entries for each column. Branch for students below 10th std would be ‘NA’
ALTER table StudentDetails add Branch varchar(20);
ALTER table StudentDetails add Std varchar(5);
UPDATE StudentDetails set branch = 'Commerce' , std = 'XII' where id = 1;
UPDATE StudentDetails set branch = 'Science' , std = 'XI' where id = 2;
UPDATE StudentDetails set branch = 'NA' , std = 'X' where id = 3;
UPDATE StudentDetails set branch = 'NA' , std = 'VIII' where id = 4;
UPDATE StudentDetails set branch = 'Science' , std = 'XII' where id = 5;
UPDATE StudentDetails set branch = 'Commerce', std = 'XI' where id = 6;
UPDATE StudentDetails set branch = 'NA', std = 'X' where id = 7;
UPDATE StudentDetails set branch = 'NA', std = 'IX' where id = 8;
UPDATE StudentDetails set branch = 'Commerce', std = 'XI' where id = 9;
UPDATE StudentDetails set branch = 'Commerce', std = 'XI' where id = 10;
UPDATE StudentDetails set branch = 'NA', std = 'VIII' where id = 11;
UPDATE StudentDetails set branch = 'Science', std = 'XI' where id = 12;

#Find students count born in year 2000
SELECT COUNT(DateOfBirth) 
	FROM StudentDetails 
	WHERE DateOfBirth 
	BETWEEN '2000-01-01' AND '2000-12-31'; 

#Group students based on year of admission along with number of students in each year
SELECT YearOfAdmission, COUNT(*) AS NumberOfStudents  
	FROM StudentDetails 
	GROUP BY YearOfAdmission;

#List number of students in each year of admission and also list them based on gender.
SELECT YearOfAdmission, COUNT(*) AS NumberOfStudents, Gender 
	FROM StudentDetails 
	GROUP BY YearOfAdmission, Gender;

#List number of students with same first name, last name and first and last name
SELECT s1.FirstName, COUNT(*) 
	FROM StudentDetails s1 ,StudentDetails  s2 
	WHERE s1.FirstName = s2.FirstName 
	AND s1.ID != s2.ID 
	GROUP BY s1.FirstName;
SELECT s1.LastName, COUNT(*) 
	FROM StudentDetails s1 ,StudentDetails  s2 
	WHERE s1.LastName = s2.LastName 
	AND s1.ID != s2.ID 
	GROUP BY s1.LastName;
SELECT s1.FirstName, s1.LastName, COUNT(*)
	FROM StudentDetails s1 ,StudentDetails  s2 
	WHERE s1.FirstName = s2.FirstName 
	AND s1.LastName = s2.LastName 
	AND s1.ID != s2.ID 
	GROUP BY s1.FirstName,s1.LastName;  

#Find the year with the maximum and minimum number of students
SELECT YearOfAdmission, COUNT(*) AS NumberOfStudents 
	FROM StudentDetails 
	GROUP BY YearOfAdmission 
	ORDER BY NumberofStudents DESC 
	LIMIT 1 ;
SELECT YearOfAdmission, COUNT(*) AS NumberOfStudents 
	FROM StudentDetails 
	GROUP BY YearOfAdmission 
	ORDER BY NumberofStudents
	LIMIT 1 ;

#Order the students by DOB and list only the top 10 students.
SELECT DateOfBirth AS DOB 
	FROM StudentDetails 
	ORDER BY DOB 
	LIMIT 10;


