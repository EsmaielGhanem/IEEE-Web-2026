--Self Join 
select S.St_Fname , Super.*
from Student S , Student Super 
where Super.St_Id = S.St_super 


select S.St_Fname , Super.*
from Student S join  Student Super 
on Super.St_Id = S.St_super 


-- multi Join 


-- Equi Join 
select S.St_Fname , C.Crs_Name , SC.Grade
from Student S , Stud_Course SC , Course  C
where S.St_Id = Sc.St_Id  and Sc.Crs_Id = C.Crs_Id 



-- Join + DML 
-- Update 
Update SC 
set grade += grade *0.1 
from Student S join Stud_Course SC
on S.St_Id = Sc.ST_Id and st_Address = 'Cairo' 

-- Self Study insert , Delete 


select count(St_Address)  NumberOfStudents
from Student 



select Max(St_address) MAX_Age 
from student 


select sum(St_Age) / Count(St_Age) 
from student 

select AVG(ST_age) MAX_Age 
from student 


select AVG(St_Age) AVG_Age
from student  where St_Address = 'cairo'



select  St_Address , ST_FName  , AVG(ST_Age)
from Student
group by St_address , ST_FName

 -- Having Self Study 


Select  SC.ST_Id , AVG(SC.Grade)
from Student S , Stud_Course SC 
where S.ST_Id = Sc.ST_Id 
group by SC.ST_Id , SC.Grade 
Having SC.grade = Max(SC.Grade)












 




