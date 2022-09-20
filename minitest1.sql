CREATE DATABASE QuanLyHocVien;
use QuanLyHocVien;
create table Address(
idAddress int not null Primary key auto_increment,
address varchar(50)
);
create table Classes(
idClass int not null Primary key auto_increment,
name varchar(50),
language varchar(50),
description varchar(20)
);
create table Students (
idStudent int not null Primary key auto_increment,
fullName varchar(20),
idAddress int,
age int,
phone varchar(10) UNIQUE ,
idClass int,
foreign key (idAddress) references Address(idAddress),
foreign key (idClass) references Classes(idClass)
);
CREATE TABLE Course(
    idCourse int not null Primary key auto_increment,
    Name VARCHAR(20),
    description VARCHAR(50)
);
CREATE TABLE Points(
    idPoint int not null Primary key auto_increment,
    idStudent int,
    idCourse int,
    point int,
    check(point between 0 and 100),
    foreign key (idStudent) references Students(idStudent),
	foreign key ( idCourse) references  Course( idCourse)
);
insert into Address(idAddress, address) value (1, 'Ha Noi');
insert into Address(idAddress, address) value (2, 'Quang Binh');
insert into Address(idAddress, address) value (3, 'Hue');
insert into Address(idAddress, address) value (4, 'Da Nang');
insert into Address(idAddress, address) value (5, 'Ho Chi Minh');
insert into Classes( name, language, description) value('C0622I1','Java','in 6 months');
insert into Classes( name, language, description) value('C0722I1','Java','in 6 months');
insert into Classes( name, language, description) value('C0822I1','Java','in 6 months');
insert into Classes( name, language, description) value('C0922I1','Java','in 6 months');
insert into Classes( name, language, description) value('C1022I1','Java','in 6 months');
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (1, 'Le Minh Tuan', 1, 24, 0987878787,1);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (2, 'Pham Van Han', 2, 27, 0983456543,2);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (3, 'Nguyen Thanh Vinh', 3, 22, 0962656456,3);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (4, 'Duong Van Hieu', 4, 25, 0978951234,4);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (5, 'Nguyen Van THuong', 5, 24, 0923453456,5);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (6, 'Truong Huy Hoang', 1, 23, 0954565346,1);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (7, 'Nguyen Duy Hung', 2, 24, 0976567456,2);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (8, 'Vu Thi Kieu Anh', 3, 29, 0945653452,3);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (9, 'Le Hong Quan', 4, 30, 0955643465,4);
insert into Students(idStudent,fullname,idAddress,age,phone,idClass) value (10, 'Pham Huy Trung', 5, 30, 0912323432,5);
insert into Course(idCourse,name,description) value(1, 'Preparation', 'in one month');
insert into Course(idCourse,name, description) value(2, 'Java Advanced', 'in one month');
insert into Points(idPoint,idCourse,idStudent,point) value (1,1,1,80);
insert into Points(idPoint,idCourse,idStudent,point) value (2,1,2,90);
insert into Points(idPoint,idCourse,idStudent,point) value (3,1,3,95);
insert into Points(idPoint,idCourse,idStudent,point) value (4,1,4,100);
insert into Points(idPoint,idCourse,idStudent,point) value (5,1,5,80);
insert into Points(idPoint,idCourse,idStudent,point) value (6,1,6,75);
insert into Points(idPoint,idCourse,idStudent,point) value (7,1,7,65);
insert into Points(idPoint,idCourse,idStudent,point) value (8,1,8,75);
insert into Points(idPoint,idCourse,idStudent,point) value (9,1,9,89);
insert into Points(idPoint,idCourse,idStudent,point) value (10,1,10,71);
insert into Points(idPoint,idCourse,idStudent,point) value (11,2,1,65);
insert into Points(idPoint,idCourse,idStudent,point) value (12,2,2,72);
insert into Points(idPoint,idCourse,idStudent,point) value (13,2,3,73);
insert into Points(idPoint,idCourse,idStudent,point) value (14,2,4,75);
insert into Points(idPoint,idCourse,idStudent,point) value (15,2,5,80);
select * from students where fullname like 'Nguyen%';
select * from students where fullname like '%Anh';
select * from students where age between 18 and 25;
select * from students where idStudent =12 or idStudent =13;
select idClass from Students where idClass like 5;
SELECT students.idClass, classes.name, count(students.idStudent) AS 'Số hoc viên'
FROM students, classes
WHERE students.idClass = classes.idClass
GROUP BY students.idClass, classes.name;
SELECT students.idClass, address.address, COUNT(students.idStudent) AS 'Số hocviên'
FROM students, address
WHERE students.idAddress  = address.idAddress 
GROUP BY students.idAddress , address.address;
select Course.name, avg(points.point) 'AverageScore'
from Points join Course on Points.idCourse=Course.idCourse
group by Course.idCourse
;