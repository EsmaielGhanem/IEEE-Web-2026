--------------------------- Comments  -----------------------------
-- Single Line Comment
/*
 Multi Line Comment
 .....
 .....
*/
===================================================================
===================================================================
--------------------------- Data Types ----------------------------
------------------- Numeric Data Types
bit         -- Boolean Value 0[false]: 1[true] 
tinyint		-- 1 Byte => -128:127		| 0:255 [Unsigned]
smallint	-- 2 Byte => -32768:32767	| 0:65555 [Unsigned] 
int			-- 4 Byte 
bigint		-- 8 Byte

------------------- Fractions Data Types
smallmoney	4B.0000            -- 4 Numbers After Point
money		8B.0000            -- 4 Numbers After Point 
real		  .0000000         -- 7 Numbers After Point
float		  .000000000000000 -- 15 Numbers After Point
dec			-- Datatype and Make Valiadtion at The Same Time => Recommended
dec(5, 2) 124.22	18.1	12.2212 XXX 2.1234

------------------- Char Data Types [String]
char(10)		[Fixed Length Character]	Ahmed 10	Ali 10	
varchar(10)		[Variable Length Character]	Ahmed 5		Ali 3
nchar(10)		[like char(), But With UniCode] ксь ???
nvarchar(10)	[like varchar(), But With UniCode] ксь
nvarchar(max)	[Up to 2GB]
varchar(max)

------------------- DateTime Data Types
Date			MM/dd/yyyy
Time			hh:mm:ss.123 --Defualt=> Time(3)
Time(5)			hh:mm:ss.12345
smalldatetime	MM/dd/yyyy hh:mm:00
datetime		MM/dd/yyyy hh:mm:ss.123
datetime2(4)	MM/dd/yyyy hh:mm:ss.1234
datetimeoffset	11/23/2020 10:30 +2:00 Timezone

------------------- Binary Data Types
binary 01110011 11110000
image

------------------- Other Data Types
Xml
sql_variant -- Like Var In Javascript

==================================================================
--------------------------- Variables ----------------------------
-- 1. Global Variables
select @@Version
select @@ServerName

-- 2. Local Variables
declare @age int = 3
set @age = 55
print @age
