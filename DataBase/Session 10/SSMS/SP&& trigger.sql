--------------------- Relationship Rules ---------------------------
--- 1. Delete Rule

--- Before Delete Department No (40) With Its Instructors and Students
Delete From Department
	Where Dept_Id = 40

-- Firstly, For Instructors
	-- 1. Transfer Instructors Of Department No (40) to another Department
Update Instructor	
	Set Dept_Id = 10
	Where Dept_Id = 40

	-- 2. Transfer Instructors Of Department No (40) To No Department (Null)
Update Instructor	
	Set Dept_Id = Null
	Where Dept_Id = 40

	-- 3. Transfer Instructors Of Department No (40) To No Department (Null)
Delete From Instructor
	Where Dept_Id = 40

-- Secondly, For Students also The Same Idea

-- 2. Update Rule [The Same Idea Of Delete Rule]

===================================================================
------------------------ Delete Vs Truncate -----------------------
Delete From Student

Truncate Table Student

===================================================================
-------------------------------------------------------------------
------------------------ Stored Procedure -------------------------
-- Benefits Of SP:
-- 1. Performance
-- 2. Security (Hide Meta Data)
-- 3. Network Wise 
-- 4. Hide Business Rules
-- 5. Handle Errors (SP Contain DML)
-- 6. Accept Input And Out Parameteres => Make It More Flexbile 


Create Procedure SP_GetStudentById @StdId int
as
	Select *
	from Student
	Where St_Id =  @StdId

	SP_GetStudentById 1

	declare @X  int = 1 
	exec HR.SP_GetStudentById @X



alter schema hr 
transfer SP_GetStudentById



Delete From Topic
	Where Top_Id = 1

Alter Proc SP_DeleteTopicById @TopicId int
With Encryption
as
	Begin Try
		Delete From Topic
			Where Top_Id = @TopicId
	End Try 
	Begin Catch
		Select 'Error'
	End Catch

DeleteStudent 6


Sp_HelpText 'SP_DeleteTopicById'


Alter Procedure SP_SumData @X int = 2, @Y varchar(10) = '8'
as
	Select @X + @Y

SP_SumData 3,7			-- Passing Parameters by Position
SP_SumData @y=7,@x=3    -- Passing Parameters by name
SP_SumData 6			-- Default Values
SP_SumData				-- Default Values


-- Using SP in Dynamic Queries (Worst Security[Objects Names are Known])
Alter Proc SP_GetData @TableName varchar(20), @ColumName varchar(20)
With Encryption
As
	--Select @ColumName from @TableName
	execute('Select ' +  @ColumName + ' From ' + @TableName)

	SP_GetData 'Department', '*'

Create Proc SP_GetStudentByAddress @StdAddress varchar(20)
With Encryption
As
	Select St_Id, St_FName, St_Address
	From Student
	Where St_Address = @StdAddress

	SP_GetStudentByAddress 'Alex'


Create Table StudentsWithAddresss
(
StdId int Primary Key,
StdName varchar(20),
StdAddress varchar(20)
)

-- Insert Based On Execute
Insert Into StudentsWithAddresss
exec SP_GetStudentByAddress 'Alex'
---------------------------------------
-- Return Of SP

---------------------------------------
-- Return Of SP

Create Proc SP_GetStudentNameAndAgeByIdV02 @Data int output, @Name varchar(20) output
With Encryption
As
	Select @Name = St_FName, @Data = St_Age -- [Output]
	from Student
	Where St_Id = @Data -- 10 [Input]

	declare @StudentName varchar(20), @Data int = 10
	exec SP_GetStudentNameAndAgeByIdV02 @Data output, @StudentName output
	Select @StudentName, @Data


====================================================================
--------------------------------------------------------------------
-- Types of SP
---- 1. User defined
			SP_GetStudentById   SP_Getdata   SP_Sumdata
---- 2. Built-In SP
			Sp_helptext      
---- 3. Trigger (Special Stored Procedure)
----------- Can't Call
----------- Can't take parameters

--- Types of Triggers (Through Its Level)
---------- Server Level
---------- DB Level
---------- Table Level (Our Interest)
----------------- Actions In Table?(Insert   Update   Delete) [Events]
---------------------------------(Select Truncate) Not Logged In Log File

Create Trigger Tri01
on Student
after insert
as
	Select 'Welcome To Route'


	Insert Into Student(St_Id, St_FName)
	Values(23723, 'Amr')

	Alter Schema HR
	Transfer Student 

Alter Trigger HR.Tri02
on HR.Student
after Update
as
	Select GetDate(), SUser_Name()


	Update HR.Student
		Set St_Address = 'Cairo'
		Where St_Id = 23723
Drop Trigger HR.Tri03
Create Trigger Tri03
On HR.Student
Instead of Delete
as
	Select 'U Can Not Delete From This Table'


	Delete From HR.Student
		Where St_Id = 23723


Alter Trigger Tri04
on Department
instead of Delete, Insert, Update
as
	Select 'You Can Not Do Any Operation On This Table  ' + SUser_Name()

	Insert into Department(Dept_Id, Dept_Name)
	Values(8232, 'Test')



-- Drop | Disable | Enable Trigger
Drop Trigger Tri04

Alter Table Department
Enable Trigger Tri04



----------------------------------------------------
-- When You Write Trigger, You Must Write Its Schema (Except Default [dbo])
-- Trigger Take By Default The Schema Of Its Table In Creation
-- When You Change The Schema Of Table, All Its Triggers Will Follow


Alter trigger HR.tri1
on student
after insert
as
	Select 'Welcome To ITI'

--------------------------------------------
--------------------------------------------
-- The Most Important Point Of Trigger 
-- 2 Tables: Inserted & Deleted Will Be Created With Each Fire Of Trigger
-- In Case Of Delete:  Deleted Table Will Contain Deleted Values
-- In Case Of Insert:  Inserted Table Will Contain Inserted Values
-- In Case Of Update:  Deleted Table Will Contain Old Values
--						Inserted Table Will Contain New Values		


-- Error (Have No Meaning Without Trigger): Just Created at RunTime 
Select * from inserted
select * from deleted

-- With Trigger
create trigger tri6
on course
after update
as
	Select * from inserted
	select * from deleted


update course
	set Crs_Name='Cloud'
	where crs_id=200


Create Trigger Tri06
on Course 
Instead OF Delete
as
	Select 'U Can Not Delete From This Table : ' + (Select Crs_Name from deleted)

Delete From Course	
	Where Crs_Id = 900


Alter Trigger HR.Tri07
on HR.Student
Instead OF Delete
as
	if Format( GETDATE(), 'dddd') != 'Wednesday'
		Delete From HR.Student
			Where St_Id in (Select St_Id from deleted)

			
Delete from HR.Student
	Where St_Id = 3242
