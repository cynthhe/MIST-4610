CREATE TABLE STUDENT(
	810Number VARCHAR(9),
	lName VARCHAR(15),
	fName VARCHAR(15),
	dateOfBirth DATE,
	major VARCHAR(20),
	PRIMARY KEY(810Number)
);


INSERT INTO STUDENT(810Number,lName,fName,dateOfBirth,major) 
VALUES (811111113,'Huber','Mark','1999-01-01','MIS');

INSERT INTO STUDENT(lName,810Number,fName,dateOfBirth,major) 
VALUES ('Piercy', 811111115,,'Craig','1997-01-01','MIS');


INSERT INTO STUDENT
VALUES (811111114,'Berente','Nick','2001-01-01','MIS');
