CREATE TABLE Students (
    Studentid int NOT NULL AUTO_INCREMENT,
    Name varchar(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
	ClassId INT NOT NULL,
    PRIMARY KEY (StudentId),
	FOREIGN KEY (ClassId) REFERENCES Classes(ClassId)
); 

insert into students(Name, DateOfBirth, ClassId) values('John','1984-10-11',1);
insert into students(Name, DateOfBirth, ClassId) values('Mary','1983-12-13', 1);
insert into students(Name, DateOfBirth, ClassId) values('Mike','1984-07-12',2);
insert into students(Name, DateOfBirth, ClassId) values('Nicholas','1984-05-08', 2);
insert into students(Name, DateOfBirth, ClassId) values('Tom','1984-12-08', 2);
insert into students(Name, DateOfBirth, ClassId) values('Peter','1983-01-03', 3);
insert into students(Name, DateOfBirth, ClassId) values('Martina','1984-07-05', 3);
insert into students(Name, DateOfBirth, ClassId) values('Teo','1984-01-25', 3);

CREATE TABLE Classes (
    ClassId int NOT NULL AUTO_INCREMENT,
    Name varchar(50) NOT null,
    PRIMARY KEY (ClassId)
); 

insert into classes(name) values('IT Class');
insert into classes(name) values('Math Class');
insert into classes(name) values('Literature Class');

CREATE TABLE AcademicYears (
    YearId int NOT NULL AUTO_INCREMENT,
    CalendarYear int(4) unique NOT null,
    PRIMARY KEY (YearId)
); 

insert into academicyears(CalendarYear) values(2009);
insert into academicyears(CalendarYear) values(2010);
insert into academicyears(CalendarYear) values(2011);

CREATE TABLE Quarters (
    QuarterId int NOT NULL AUTO_INCREMENT,
    Name varchar(2) unique NOT null,
    PRIMARY KEY (QuarterId)
); 

insert into Quarters(Name) values('Q1');
insert into Quarters(Name) values('Q2');
insert into Quarters(Name) values('Q3');
insert into Quarters(Name) values('Q4');

CREATE TABLE QuarterYears (
    QuarterYearId int NOT NULL AUTO_INCREMENT,
    QuarterId int,
    YearId int, 
    Title varchar(7) unique NOT null,
    PRIMARY KEY (QuarterYearId),
    FOREIGN KEY (QuarterId) REFERENCES Quarters(QuarterId),
    FOREIGN KEY (YearId) REFERENCES AcademicYears(YearId)
); 

insert into QuarterYears(QuarterId, YearId, Title) values(1,1,'2009-Q1');
insert into QuarterYears(QuarterId, YearId, Title) values(2,1,'2009-Q2');
insert into QuarterYears(QuarterId, YearId, Title) values(3,1,'2009-Q3');
insert into QuarterYears(QuarterId, YearId, Title) values(4,1,'2009-Q4');

insert into QuarterYears(QuarterId, YearId, Title) values(1,2,'2010-Q1');
insert into QuarterYears(QuarterId, YearId, Title) values(2,2,'2010-Q2');
insert into QuarterYears(QuarterId, YearId, Title) values(3,2,'2010-Q3');
insert into QuarterYears(QuarterId, YearId, Title) values(4,2,'2010-Q4');

insert into QuarterYears(QuarterId, YearId, Title) values(1,3,'2011-Q1');
insert into QuarterYears(QuarterId, YearId, Title) values(2,3,'2011-Q2');
insert into QuarterYears(QuarterId, YearId, Title) values(3,3,'2011-Q3');
insert into QuarterYears(QuarterId, YearId, Title) values(4,3,'2011-Q4');

CREATE TABLE Subjects (
    SubjectId int NOT NULL AUTO_INCREMENT,
    Name varchar(50) NOT null,
    PRIMARY KEY (SubjectId)
); 

insert into Subjects(Name) values('Mathematics');
insert into Subjects(Name) values('Computer Science');
insert into Subjects(Name) values('Literature');

CREATE TABLE Grades (
    GradeId int NOT NULL AUTO_INCREMENT,
    StudentId int not null,
    QuarterYearId int not null, 
    SubjectId int not null,
    Grade int NOT null,
    PRIMARY KEY (GradeId),
	FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
	FOREIGN KEY (QuarterYearId) REFERENCES QuarterYears(QuarterYearId),
	FOREIGN KEY (SubjectId) REFERENCES Subjects(SubjectId),
    CONSTRAINT UC_Grade UNIQUE (StudentId, QuarterYearId, SubjectId)
);

insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,1,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,1,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,1,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,2,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,2,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,2,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,3,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,3,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,3,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,4,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,4,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,4,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,5,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,5,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,5,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,6,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,6,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,6,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,7,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,7,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,7,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,8,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,8,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,8,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,9,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,9,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,9,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,10,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,10,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,10,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,11,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,11,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,11,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,12,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(1,12,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(1,12,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,1,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,1,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,1,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,2,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,2,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,2,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,3,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,3,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,3,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,4,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,4,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,4,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,5,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,5,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,5,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,6,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,6,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,6,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,7,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,7,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,7,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,8,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,8,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,8,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,9,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,9,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,9,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,10,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,10,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,10,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,11,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,11,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,11,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,12,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(2,12,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(2,12,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,1,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,1,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,1,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,2,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,2,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,2,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,3,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,3,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,3,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,4,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,4,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,4,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,5,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,5,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,5,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,6,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,6,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,6,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,7,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,7,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,7,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,8,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,8,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,8,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,9,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,9,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,9,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,10,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,10,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,10,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,11,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,11,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,11,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,12,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(3,12,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(3,12,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,1,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,1,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,1,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,2,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,2,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,2,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,3,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,3,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,3,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,4,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,4,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,4,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,5,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,5,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,5,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,6,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,6,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,6,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,7,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,7,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,7,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,8,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,8,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,8,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,9,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,9,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,9,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,10,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,10,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,10,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,11,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,11,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,11,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,12,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(4,12,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(4,12,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,1,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,1,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,1,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,2,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,2,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,2,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,3,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,3,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,3,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,4,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,4,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,4,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,5,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,5,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,5,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,6,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,6,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,6,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,7,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,7,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,7,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,8,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,8,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,8,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,9,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,9,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,9,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,10,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,10,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,10,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,11,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,11,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,11,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,12,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(5,12,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(5,12,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,1,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,1,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,1,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,2,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,2,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,2,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,3,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,3,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,3,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,4,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,4,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,4,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,5,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,5,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,5,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,6,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,6,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,6,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,7,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,7,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,7,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,8,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,8,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,8,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,9,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,9,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,9,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,10,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,10,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,10,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,11,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,11,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,11,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,12,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(6,12,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(6,12,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,1,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,1,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,1,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,2,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,2,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,2,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,3,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,3,2,7);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,3,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,4,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,4,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,4,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,5,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,5,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,5,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,6,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,6,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,6,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,7,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,7,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,7,3,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,8,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,8,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,8,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,9,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,9,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,9,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,10,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,10,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,10,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,11,1,4);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,11,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,11,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,12,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(7,12,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(7,12,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,1,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,1,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,1,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,2,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,2,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,2,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,3,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,3,2,9);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,3,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,4,1,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,4,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,4,3,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,5,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,5,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,5,3,5);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,6,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,6,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,6,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,7,1,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,7,2,5);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,7,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,8,1,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,8,2,10);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,8,3,8);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,9,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,9,2,8);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,9,3,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,10,1,10);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,10,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,10,3,9);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,11,1,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,11,2,4);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,11,3,6);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,12,1,7);
insert into grades (StudentId, QuarterYearId, SubjectId, Grade) values(8,12,2,6);
insert into grades (StudentId,QuarterYearId, SubjectId, Grade) values(8,12,3,4);