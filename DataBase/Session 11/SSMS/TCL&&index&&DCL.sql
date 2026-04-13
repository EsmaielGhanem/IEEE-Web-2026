-----------------------------------------------------------------
--------------------------- Transaction -------------------------
-- 1. Implicit Transaction (DML Query [Insert, Update, Delete])

Insert Into Student(St_Id, St_Fname)
Values (100, 'Ahmed'), (101, 'Amr')

Update Student
	set St_Age = 30 
	where St_Age = 20


-- 2. Explicit Transaction (Set Of Implicit Transactions)
create table Parent
(
ParentId int primary key
)
create table Child
(
ChildId int primary key,
ParentId_FK int references Parent(ParentId)
)
insert into Parent values(1)
insert into Parent values(2)
insert into Parent values(3)



begin transaction
insert into Child values(1, 1)
insert into Child values(2, 10)
insert into Child values(3, 2)
commit tran

begin transaction
insert into Child values(4, 1)
insert into Child values(5, 10)
insert into Child values(6, 2)
rollback tran


begin try
	begin transaction
		insert into Child values(7, 1)
		save transaction p01
		insert into Child values(8, 2)
		insert into Child values(9, 10)
		insert into Child values(10, 3)
	commit tran
end try
begin catch
	rollback tran p01
end catch

================================================================
----------------------------------------------------------------
----------------------------- Index -------- --------------------
create clustered index myindex
on student(st_fname) -- Not Valid [Table already has a clustered index on PK]


create nonclustered index myindex
on student(st_fname)

create nonclustered index myindex2
on student(dept_id)

-- Primary Key   ---Constraint   ---> Clustered Index

-- Unique Key    ---Constraint   ---> Nonclustered Index
create table test
(
 X int primary key,
 Y int unique,
 Z int unique
)

create unique index i3
on student(st_age)
-- Will Make 2 Things If There is No Repeated Values
-- 1. Make Unique Constraint On St_Age 
-- 2. Make Non-Clustered Index On St_Age



-- Clustered Index Vs Nonclustered Index
-- Just One							... Many Up To 999
-- Last Level Is The Actual Data	... PreLast Level Is Pointer To Actual Data
-- Faster							...	Slower
-- PK => Clustered					... Unique => Nonclustered


-- How Can I Select The Columns To Make Indexes On It?
-- 1. Analysis
-- 2. Testing (Using SQL Server Profiler and Tuning Advisor)


=================================================================
-----------------------------------------------------------------
--------------------------- DCL ---------------------------------
-- [Login]          Server (Salma)
-- [User]           DB ITI (Salma)
-- [Schema]         HR   [Department, Instructor]
-- Permissions      Grant [select,insert]    Deny [delete Update]

Create Schema HR

alter schema HR
transfer [dbo].[Instructor]

alter schema HR
transfer Department