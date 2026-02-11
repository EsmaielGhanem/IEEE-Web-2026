Create Database IEEE2026  

use IEEE2026 

create Table Employees(
FName varchar(20)  not null, -- Recuired  
LName varchar(20) not null,  -- Recuired 
Id int Primary Key Identity (1 , 1) , 
BDate  Date , 
Address varchar(20) default 'Alex' , 
Gender char(1) , -- F , M  
Salary Money , 
SuperId int references Employees(Id) , 
DNo int 

--TODO Fk
)

create Table Departments(
DNumber int Primary Key Identity(10 , 10) , 
DName varchar(20) NOT NULL , 
MGRId int references Employees(Id) , 
MGRDate Date 

)

Create Table Dept_Locations (
DNumber int references Departments(DNumber) , 
Location varchar(30) , 
Primary Key(DNumber , Location )  -- Composite PK 

)

Create table Projects(
PNumber int Primary Key Identity (0 , 10) , 
PName varchar(50)  not null,  -- Recuired  
Location varchar(20) , 
DNum int references Departments(DNumber) 
)

Create Table WorksOn(
EmpId int references Employees(Id) , 
PNo int references Projects(PNumber) , 
Hours int ,
Primary Key(EmpId , PNo)  -- Composite PK
)


Create Table Dependents(
EmpId int references Employees(Id) , 
DependentName varChar(20) not null , 
Gender char(1) ,  -- M , F
BDate Time , 
RelationShip varchar(20) , 
Primary Key(EmpId , DependentName)  -- Composite PK
)


Alter Table Employees 
Add Foreign Key (DNo) references Departments(DNumber) 


Alter Table Employees 
Add  FName varchar(20) not null


-- DML Data Manipulation Language 

-- Insert ==> Simple  , multi 
Insert Into Employees(FName , LName , BDate , Salary , Gender  ) 
Values('Omar' , 'Mohammad' , '2002-10-23' , 20000 , 'M')


Insert Into Employees(FName , LName , BDate , Salary , Gender  ) 
Values('Mohammad' , 'Ali' , '2002-11-23' , 22000 , 'M')



Insert Into Employees(FName , LName , BDate , Salary , Gender  ) 
Values
('Mohammad' , 'Ali' , '2002-11-23' , 22000 , 'M'),
('Mohammad' , 'Ali' , '2002-11-23' , 22000 , 'M'),
('Mohammad' , 'Ali' , '2002-11-23' , 22000 , 'M'),
('Mohammad' , 'Ali' , '2002-11-23' , 22000 , 'M'),
('Mohammad' , 'Ali' , '2002-11-23' , 22000 , 'M');


Update Employees 
Set Address = 'Fayoum'
where Id = 11 


update Employees 
set Salary = 15000
where Address = 'Alex' Or Address = 'Fayoum' 


delete from Employees 
where id = 15
