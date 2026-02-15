Create Database Universities  

use Universities  


Create Table University (
Id int Primary Key Identity(10 , 10) , 
Name varchar(30) not null , 
City varchar(30) default 'Alex'
)

create Table Faculities(
Id int primary Key Identity (1 , 1) , 
UniId int references University(Id) , 
ShortName varchar(30) not null , 
Name varchar(30) not null , 
Dean varchar(30) not null , 

)

create table Departments
(
Id int not null,
FacId int  not null,
UniId int not null,
DepName varchar(150) not null,
Director varchar(150) not null,
primary key (Id, FacId, UniId), -- Composite PK 
foreign key (FacId) references Faculities(Id),
foreign key (UniId) references University(Id)
);


create table employees (
    id int primary key ,
    uniId int references University(id),
    FacId int references  Faculities(Id),
    FName varchar(30) not null , 
    LName varchar(30) not null 
);


create Table Lecturers(
EmpId int references  employees(ID) , 
UniId int  references University(Id) ,  
FacId int references  Faculities(Id),
EmpPosition varchar(30) not null,
)

create Table Projects(
Id int Primary Key Identity(1 , 1) , 
Name varChar(50) not null ,
Director varchar(50) not null 

)

Create  Table WorksOn(
ProjId int references Projects(Id) , 
EmpId Int references Employees(Id) , 

UniId int references University(Id) , 

FacId int references  Faculities(Id), 

Primary Key (ProjId , EmpID , UniId , FacId)  -- Composite PK 

)







