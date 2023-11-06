SET SQL_SAFE_UPDATES = 0;

CREATE DATABASE IF NOT EXISTS ttm_system;
USE ttm_system;

create table Admin(ID varchar(20) primary key, password varchar(20) not null, dept char(3));
create table Faculty(Faculty_ID varchar(20) primary key, Faculty_name varchar(20) not null, Course_ID varchar(20), dept char(3));
create table Timetable(Timetable_ID varchar(20) primary key, Sem int not null, year int not null, time_slot varchar(20) not null, Course_ID varchar(20) not null, Faculty_ID varchar(20) not null);
create table Courses(Course_ID varchar(20) primary key, Course_name varchar(20) not null, total_hours int, hours_per_week int, HOD varchar(20) not null);

show tables;

alter table Timetable
add constraint fk_fk1
foreign key (Course_ID) 
references Courses (Course_ID);

alter table Timetable
add constraint fk_fk2
foreign key (Faculty_ID) 
references Faculty (Faculty_ID);

alter table Timetable
add Building varchar(10),
add Room varchar(6),
add Floor int;

-- ALTER TABLE Timetable
-- DROP COLUMN classroom;

ALTER TABLE Timetable
ADD Classroom VARCHAR(255);

UPDATE Timetable
SET Classroom = CONCAT(Building, ' - ', Room, ' - ', Floor);

-- ALTER TABLE Faculty
-- DROP COLUMN office;

alter table Faculty
add Building varchar(10),
add Floor int,
add Room varchar(6),
add Desk int,
add Contact_number int(10);

ALTER TABLE Faculty
ADD office VARCHAR(255);

UPDATE Faculty
SET office = CONCAT(Building, ' - ', Room, ' - ', Floor, ' - ', Desk, ' - ', Contact_number);
