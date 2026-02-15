use ITI 

-- DQL Data Query Language  [Select]

Select * from Student 


Select St_Fname + ' ' + St_Lname as FullName from Student 


Select St_Fname + ' ' + St_Lname as [Full Name] from Student 

Select St_Fname + ' ' + St_Lname  [Full Name] from Student

Select [Full Name] =  St_Fname + ' ' + St_Lname  from Student



Select St_Fname as FirstName from Student 

Select * from Student
where St_Age >= 24 and St_Age <= 28 

Select * from Student 
where St_Age between 24 and 28 

Select * from Student 
where St_Address = 'Cairo' or St_Address = 'Alex'  or St_Address = 'Tanta'  ; 

Select * from Student 
where St_Address in ('Cairo' , 'Alex' , 'Tanta') ;


Select * from Student 
where St_Address not in ('Cairo' , 'Alex' , 'Tanta') ;


Select St_Fname , St_Lname from Student
where St_super is null

Select St_Fname , St_Lname from Student
where St_super is not null 

--------------------------
-- like With Some Patterns
/*
_ => one Char
% => Zero or More Chars 

*/ 


/*
'a%h'			ah axxxxxh akhjkhfgsdjkghh 
'%a_'			aX   fdsafdaa
'[ahm]%'		a , h , m  , auc ,
'[^ahm]%'       bcd , ddddddddddddd , bahm	
'ahm%'          ahmed , ahmm , ahm 
'[a-h]%'		
'[^a-h]%'
'%[%]'			ahemd% , bedo% 
'%[_]%'			ahmed_  , ____ 
'[_]%[_]'		_ahmed_ , __ 

*/

Select * From Student 
where  St_Fname like '%[%]' 

Select St_Fname , St_Lname from Student
where St_Fname like '_a%' and St_Lname like '_h%' 


Select Distinct(St_Fname) from Student
order by St_Fname Desc 

select * from Student
where St_Address is not null
order by 4 

select S.St_Fname , D.Dept_Name
from Student S , Department D 


select S.St_Fname , D.Dept_Name
from Student S  cross join Department D 








select S.St_Fname , D.*
from Student S , Department D 
where D.Dept_Id = S.Dept_Id


select S.St_Fname , D.Dept_Name
from Student S inner join  Department D 
on D.Dept_Id = S.Dept_Id




select S.St_Fname , D.Dept_Name
from Student S left outer  join  Department D 
on D.Dept_Id = S.Dept_Id
 

select S.St_Fname , D.Dept_Name
from Student S Right  outer  join  Department D 
on D.Dept_Id = S.Dept_Id 



select S.St_Fname , D.Dept_Name
from Student S Full outer  join  Department D 
on D.Dept_Id = S.Dept_Id

--  Self Join , Multi Join [TODO]
 
 


 











