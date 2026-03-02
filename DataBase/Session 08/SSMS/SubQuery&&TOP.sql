---------------------- Sub Query -----------------------------
-- Output Of Sub Query[Inner] As Input To Another Query[Outer]
-- SubQuery Is Very Slow (Not Recommended Except Some Cases)

/* 
select *
from student
where st_age>avg(st_age) => Not Valid
*/

select *
from student
where st_age>(select avg(st_age) from student) --23 just value

/*
select *, count(st_id)
from student => Not Valid
*/
select *,(select count(st_id) from student) --14
from student

-- SubQuery Vs Join

-- Get Departments Names That Have Students

select distinct D.Dept_Name
from Department D inner join Student S
on D.Dept_Id = S.Dept_Id

select dept_name
from Department
where Dept_Id in (	select distinct(Dept_Id)
					from Student
					where Dept_Id is not null
				)

-- SubQuery With DML
--------- SubQuery With Delete

--Delete Students Grades Who Are Living in Cairo
delete from Stud_Course
where St_Id in (
				Select St_Id from Student 
				where St_Address = 'Cairo'
				)
delete SC
from Student S inner join Stud_Course SC
on S.St_Id = SC.St_Id 
where S.St_Address = 'Cairo'


==========================================================
------------------------- Top ---------------------------

-- First 5 Students From Table
select top(5)*
from  student

select top(5)st_fname
from  student

-- Last 5 Students From Table
select top(5)*
from  student
order by st_id desc

-- Get The Maximum 2 Salaries From Instractors Table
select Max(Salary)
from Instructor

select Max(Salary)
from Instructor
where Salary <> (Select Max(Salary) from Instructor)

select top(2)salary
from Instructor
order by Salary desc


-- Top With Ties, Must Make Order by
select top(5) st_age
from student 
order by st_age desc

select top(5) with ties st_age
from student
order by st_age  desc

