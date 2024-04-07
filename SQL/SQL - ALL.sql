# my comment is working
# 1. Show databases
# it show existing databases
show databases;
# 2. create database
#it create new database and cant use same name
create database db_arvind;
create database db_remove;
#also update/refresh schemas (click on Schemas and in upper left
#there will be BOLD Schemas written click on update)

# 3.Use database
# use new create database
# active database which you want to use
use db_arvind;
use sys;

# 4. Drop database
# remove unwanted database
drop database db_remove;

# 5. show tables
show tables;

#6. create tables
#syntax: create table table_name(column1 datatype, column2 datatype,..)
#Example: create table hello (id int, name varchar(15),location varchar(20),salary int)

#string = "name ... " >> Varchar(size of string)
#var=10 >> int
create table emp (empid int,
				  firstName varchar(15),
                  lastName varchar(20),
                  salary int,
                  location varchar(15));
                  
#  display above table

select * from emp;

#7. insert in statement
#synatx1 : INSERT INTO table_name (column1, column2, column3, ...)     
#         VALUES (value1, value2, value3, ...);
insert into emp (empid, firstName, lastName, salary, location)
		 values (1001,'User','David',50000,'New york');
         
# display above details
select * from emp;

# insert more table in emp 
insert into emp (empid, lastName, salary, location)
		 values (1002,'gamma',55000,'New Delhi');
         # the first name is not given, so the will have Null values
#synatx2 :
insert into emp 
values (1003, 'crazy', 'xyz',98050,'Rajastan');

#synatx3
         # insert multiple lines
insert into emp values (1004,'Mayur','Chavan',50000,'Chinchwad'),
                       (1005, 'Vikas','Patil',40000,'Pimpri'),
                       (1006, 'Vaibhav','Desai',70000,'Wakad'),
                       (1007, 'Suyog', 'Aghav', 65000, 'BVP'),
                       (1008, 'Om', 'Sharma', 45000, 'Laxmi road'),
                       (1009, 'Rutik', 'Rathod', 50000, 'Kothrud');

select * from emp;

# 8. select query
select * from emp;
select firstName, salary from emp;
select lastName from emp;
select location,empid from emp;

# 9. Desc
#description
desc emp;

#10 . Where
#syntax: select column1, column2, ...from table_name where condition;
#The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc
# Comparison Operators in The WHERE Clause

select * from emp;
select * from emp where empid=1005;
select * from emp where lastName='xyz';

select * from emp where empid>1005;
select * from emp where salary>50000;

select * from emp where empid>=1005;
select * from emp where empid<1005;
select * from emp where empid<=1005;
select * from emp where empid!=1003;
select * from emp where salary != 50000;
select * from emp;

#11. AND OR NOT
# can use 2+ conditions
#AND both condition true => True
#OR single conditon true => True
#NOT return value if condition not matching

select * from emp where empid>=1005 and salary>50000;
select * from emp where firstName='mayur' and lastName='k';
#lastname not exist

select * from emp where empid>=1005 OR salary>50000;
select * from emp where firstName='mayur' OR lastName='k';
#in this only one condition is matching and it return the values

select * from emp where NOT salary>50000;
#return condition is not true (opposite value)

# 12. IN and NOT in operator
select * from emp where empid in (1001, 1002);
#return only 1001, 1002
select * from emp where empid not in (1001, 1002);
#return all values except 1001,1002

# 13. BETWEEN and NOT BETWEEN
select * from emp where salary between 30000 and 50000;
select * from emp where empid not between 1001 and 1005;
#it will not give value of 1001 to 1005

#14. LIKE Operator
#syntax: SELECT column1, column2, ... FROM table_name WHERE column LIKE pattern;

#1. find all first names which starts with 's'  # s%
select * from emp where firstName like 's%';
#2. find all first names which donot starts with 's' # not like s%
select * from emp where firstName NOT like 's%';
#3. find all first names which ends with 'r'  # %r
select * from emp where firstName like '%r';
#4. find all last names which end with 'l'  # %l
select * from emp where lastName like '%l';
#5. find all first names in which has 'i' in it  # %i%
select * from emp where firstName like '%i%';
#6. find all first names in which 2nd letter is 'u'  _u%
select * from emp where firstName like '_u%';
#7. find all location which starts with 'p' and end with 'e'  # p%e
select * from emp where location like 'n%k';

#15. NULL values
#IS Null and IS not null operators
# IS NULL Syntax
#select column_names from table_name where column_name IS NULL;
select * from emp where firstName=null;
select * from emp where firstName IS null;
# IS NOT NULL Syntax
#select column_names from table_name where column_name IS NOT NULL;
select * from emp where firstName Is not null;

#16. Count
#select count(*) from emp; # check in all columns, time consuming
#select count(1) from emp; # index of column (null included)
#select count(loc) from emp;  # Given column name (null excluded)
select count(*) from emp;
select count(1) from emp;
select count(firstName) from emp; # not include null values

#17. select distinct
select * from 50_startups;
select distinct STATE from 50_startups;

select * from cars93;
select distinct Type from cars93;
select distinct airbags from cars93;
select distinct origin from cars93;

#18. Count of distinct values in column
#syntax: select count(distinct column_name) from table_name;
select distinct STATE from 50_startups;
select count(distinct STATE) from 50_startups;

#19. delete, truncate, drop
# delete
#delete from table_name where condition; delete specific row
# delete from table_name; delete all rows
select * from emp;
set sql_safe_updates=0; #run first to delete row
delete from emp where lastName = 'Patil';

delete from emp where firstName IS NULL;
delete from emp; # delete all the row

#adding row again to perform further functions;
insert into emp (empid, firstName, lastName, salary, location)
		 values (1001,'User','David',50000,'New york');
insert into emp (empid, lastName, salary, location)
		 values (1002,'gamma',55000,'New Delhi');
insert into emp 
values (1003, 'crazy', 'xyz',98050,'Rajastan');
insert into emp values (1004,'Mayur','Chavan',50000,'Chinchwad'),
                       (1005, 'Vikas','Patil',40000,'Pimpri'),
                       (1006, 'Vaibhav','Desai',70000,'Wakad'),
                       (1007, 'Suyog', 'Aghav', 65000, 'BVP'),
                       (1008, 'Om', 'Sharma', 45000, 'Laxmi road'),
                       (1009, 'Rutik', 'Rathod', 50000, 'Kothrud');
				
select * from emp;                       
#truncate table
#delete all row but dont delete table structure(heading)
truncate table emp;
select * from emp;

#insert rows again
insert into emp (empid, firstName, lastName, salary, location)
		 values (1001,'User','David',50000,'New york');
insert into emp (empid, lastName, salary, location)
		 values (1002,'gamma',55000,'New Delhi');
insert into emp 
values (1003, 'crazy', 'xyz',98050,'Rajastan');
insert into emp values (1004,'Mayur','Chavan',50000,'Chinchwad'),
                       (1005, 'Vikas','Patil',40000,'Pimpri'),
                       (1006, 'Vaibhav','Desai',70000,'Wakad'),
                       (1007, 'Suyog', 'Aghav', 65000, 'BVP'),
                       (1008, 'Om', 'Sharma', 45000, 'Laxmi road'),
                       (1009, 'Rutik', 'Rathod', 50000, 'Kothrud');
select * from emp;

#drop
#delete table and remove from table schemas
drop table emp;

/*Creating table again;
use above command like create table and insert rows*/

# 20. Alter table
#modify the table - add modify or drop , rename
# ADD a column
alter table emp add column age int;
select * from emp;

# Modify a colum
desc emp;
alter table emp modify column location varchar(30);

#drop a column
alter table emp drop column age;

#rename a column 
alter table emp rename column location to area;
select * from emp;

#21. Update
set SQL_SAFE_UPDATES=0;
select * from emp;

update emp set area='Mumbai' where empid=1001;
update emp set salary= 62000 where salary=50000;
#22. limit clause

select * from 50_startups;
select * from cars93;

select * from cars93 limit 5; 
select * from cars93 limit 2;
select * from cars93 limit 2,3; # first 2 will skip and 3,4,5 will return
select * from cars93 limit 4,4; # 5,6,7,8

#23. Order by
select * from 50_startups;
select * from 50_startups order by RND;
select * from 50_startups order by RND DESC;

select * from 50_startups order by STATE;
select * from 50_startups order by STATE DESC;

select * from 50_startups order by STATE, PROFIT;
select * from 50_startups order by STATE, PROFIT DESC;

select * from 50_startups order by STATE DESC, PROFIT;
select * from 50_startups order by STATE DESC, PROFIT DESC;

#24. Arithematic Expression 
#min, max, avg, count, sum
select * from cars93;
select price from cars93;
select min(price) from cars93;
select max(price) from cars93;
select avg(price) from cars93;
select count(price) from cars93;

select count(profit) from 50_startups;
select avg(profit) from 50_startups;
select sum(profit) from 50_startups;
select max(profit) from 50_startups;

# 25. Alias 
# dummy name to table or column
# select old_column name as new_column name from table_name;

select * from emp;
select salary as sal from emp; #not change real name
select salary as sal, area as location from emp;

select 1.5*salary from emp;
select 1.5*salary as sal123 from emp;

#27. exporting a table to external file
select * from emp;
#click on export icon near table 

#28. create new table from existing table
select * from cars93;
select * from cars93 limit 4,6;

create table cars93_new as (select * from cars93 limit 4,6);
select * from cars93_new;

select * from 50_startups;

# 29. SQL Joins
select * from emp_2;
select * from dept;
#1. Inner join
select * from emp_2 INNER JOIN dept
on emp_2.did = dept.dept_id;

#2. Left join
select * from emp_2 left JOIN dept
on emp_2.did = dept.dept_id;

#3. right join
select * from emp_2 right JOIN dept
on emp_2.did = dept.dept_id;

#4. full join
select * from emp_2 left JOIN dept
on emp_2.did = dept.dept_id
UNION
select * from emp_2 right JOIN dept
on emp_2.did = dept.dept_id;

#30. self join
select * from emp_data;

select * from emp_data e Inner join emp_data f # e and f are alias
on e.empid = f.mgr_id;

select e.empid, e.fname, e.lname,e.gender,e.email,e.salary,e.loc,f.mgr_id 
from emp_data e inner  join emp_data f 
on e.empid= f.mgr_id;

#31. Constraints
# 1. Not null
create table emp_null (empid int, fname varchar(10));
select * from emp_null;

insert into emp_null values(1001, 'Rakesh');
insert into emp_null (empid) values(1002);
insert into emp_null (fname) values('Rock');

create table emp_not_null (empid int NOT NULL, fname varchar(10));
select * from emp_not_null;
insert into emp_not_null values(1001, 'Rakesh');
insert into emp_not_null (empid) values(1002);
insert into emp_not_null (fname) values('Rock'); #this query will not add due to constraint

alter table emp modify empid int NOt null; #this is for existing tables

desc emp_not_null;
# 2 .unique
create table emp_uniq (empid int unique, fname varchar(15));
select * from emp_uniq;
desc emp_uniq;

insert into emp_uniq values(1001, 'new');
insert into emp_uniq values(1002, 'new');
insert into emp_uniq values(1001, 'new'); # 1001 will not add due to unique value in empid

select * from emp;
alter table emp add constraint my_uniq unique (salary); #it will now only allow unique values

# 3. check 
create table emp_check (empid int, fname varchar(15), check (empid<100));

insert into emp_check values(001, 'new');
insert into emp_check values(088, 'new');
insert into emp_check values(102, 'new'); # this will not add because check it not more than 100

select * from emp_check;

# 4 . Primary key constraint

create table emp_primary(empid int primary key, fname varchar(15));
select * from emp_primary;
insert into emp_primary values(001, 'new');
insert into emp_primary values(002, 'new');
insert into emp_primary values(001, 'new'); #empid will not add due to key
insert into emp_primary (fname) values('new');
insert into emp_primary (empid) values(003);

# use primary key in existing table
alter table emp add constraint my_pk primary key (fname);
alter table emp add constraint my_pk primary key (lname);

# 5 . default constraint
create table emp_def (empid int DEFAULT 1005,fname varchar(10));
select * from emp_def;
insert into emp_def values(1001,'Rakesh');
insert into emp_def (fname) value('Rohit');

alter table emp_def alter empid set default 1001; #here we change the default value
insert into emp_def (fname) values('Rohit');
# 6. Auto_increment
create table emp_AI (empid int AUTO_INCREMENT PRIMARY KEY,
					 fname varchar(10));
select * from emp_AI;
insert into emp_AI values(1001,'Rakesh');
insert into emp_AI (fname) values ('Rohit');
insert into emp_AI (fname) values ('Rohit');

alter table emp_AI AUTO_INCREMENT=1005;
insert into emp_AI (fname) values ('Roh');
insert into emp_AI (fname) values ('Roh');

create table emp_AI1 (empid int AUTO_INCREMENT PRIMARY KEY,
					 fname varchar(10));
select * from emp_AI1;
insert into emp_AI1 (fname) values ('Roh');
insert into emp_AI1 (fname) values ('Roh');

# 7. foriegn key
select * from student;
select * from course;
create table student (Rollno int PRIMARY KEY, 
                      name varchar(10));
                      
create table course  (crs_id int PRIMARY KEY,
                      crs_name varchar(15),
                      Rollno int,
                      foreign key(Rollno) references student(Rollno));
                      
/* 1) you will not be able to add a value in child(course) 
     table which is not present in parent(student) table.*/

select * from student;
select * from course;

insert into course values (10,'DS',1001);
insert into student values(1001,'Sachin');
insert into course values (10,'DS',1001);
insert into course values (11,'Python',1002);
insert into student values(1002,'Rajesh');
insert into course values (11,'Python',1002);

/* 2) you will not be able to delete a row directly from
 your parent(student) table. */
 
select * from student;
select * from course;

delete from student where rollno=1001;
delete from course where rollno=1001;
delete from student where rollno=1001;

select * from student;
select * from course;
insert into course values (11,'Python',1003);
insert into student values(1003,'Rajesh');
insert into course values (12,'Python',1003);

# 8 . drop constraint
alter table emp DROP CONSTRAINT my_check; 

#32. UnION and UNION ALL
select * from cars93;
select * from cars93 LIMIT 5; #1 2 3 4 5 
create table cars93_first5 as (select * from cars93 LIMIT 5);
select * from cars93_first5;

select * from cars93 limit 4,5; # 5 6 7 8 9 
create table cars93_next5 as (select * from cars93 limit 4,5);
select * from cars93_next5;

#1. UNion
select * from cars93_first5
UNION
select * from cars93_next5; #it will join both table and no repeat

#2. UNION ALL 
select * from cars93_first5
UNION ALL
select * from cars93_next5; # here 5 will come double because it cover all

#33. Group by clause
# group level aggregate
#1. Find out details of the companies who have invested least in MKT in every state
select * from 50_startups;
select mkt from 50_startups;
select state, min(MKT) from 50_startups group by state;

#2. Find out total investment in RND in every state.
select state, sum(RND) from 50_startups group by state;
# 3. find out type wise avaerage price  using groupby function
select type, avg(price) from cars93 group by type;

select distinct (state) from 50_startups;
select count(distinct(state)) from 50_startups;

# 4. write a query to display unqiue value counts of state;
select state, count(state) from 50_startups group by state;

#Having clause
# 1.Filter out that state for which sum of RND is greater than 1200000
select state,sum(RND) from 50_startups group by state;
select state,sum(RND) from 50_startups group by state having sum(RND)>1200000;

# 2.Filter out that type for which average price is greater than 18
select type,avg(price) from cars93 group by type;
select type,avg(price) from cars93 group by type having avg(price)>18;
# Import Employee1.csv
select * from employee1;
# 1.Find department wise sum of salary 
select department,sum(salary) from employee1 group by department;   

# 2.Display the departments where the sum of salaries is 50,000 or more 
select department,sum(salary) from employee1 group by department having sum(salary)>=50000;

# SQL Views
# Inner join query
select * from emp_2;
select * from dept;
select * from emp_2 INNER JOIN dept on emp_2.did = dept.dept_id; 
# 1.create a inner join view, display the view and drop the view
create view inner_join as 
select * from emp_2 INNER JOIN dept on emp_2.did = dept.dept_id;

select * from inner_join;
ALTER VIEW inner_join as 
select empid,fn from emp_2 INNER JOIN dept on emp_2.did = dept.dept_id;

drop view inner_join;
# 2.Create a view having few columns of cars93.display and drop it.
select * from cars93;
select Manufacturer, Type , Price from cars93;

create view cars93_3columns as 
select Manufacturer, Type , Price from cars93;

select * from cars93_3columns;
select * from cars93_3columns where type='small';

# SQL index 
# speedup
# 1.Create index on price column of cars93.csv, check desc, drop the index and again check desc.
select * from cars93;
select * from cars93 where price>20;

create index cars93_price 
on cars93(price);

desc cars93;
select * from cars93 where price>20;

alter table cars93
drop index cars93_price;

# 2.Create index on RND,MKT
desc 50_startups;
create index 50_startups_index
on 50_startups(RND,MKT);

alter table 50_startups
drop index 50_startups_index;

# Case Statement
use db_arvind;
select * from emp;
set sql_safe_updates=0;
update emp set area='pimpri' where area='chinchwad';

# eg.1 using case statement with select
select * from emp;
select empid,salary,                                                   
case                                                                          
   when salary>60000 then 'sr_profile'                          
   when salary=60000 then 'mid_exp'                          
   else 'fresher'                                                           
   end as exp                                                            
   from emp; 

# eg.2 using case statement to update multiple rows
select * from emp;

alter table emp
add column age int;

set sql_safe_updates=0;
update emp set age = 
case empid
when 1001 then 20
when 1002 then 30
when 1003 then 25
when 1005 then 27
else 35
end; 

update emp set age = 
case 
when empid = 1001 then 20
when empid = 1002 then 30
when empid = 1003 then 25
when empid = 1005 then 27
else 35
end;

update emp set age = 
case 
when empid between 1001 and 1005 then 20
else 25
end; 
select * from emp;

update emp set age = 
case 
when empid in (1003,1005) then 25
when empid in (1002,1004) then 30
else 40
end; 
select * from emp;
######################
# String functions
create table employee (emp_id int,first_name varchar(20),salary int,location varchar(20),
joining_date datetime,department_name varchar(20));

insert into employee values(1001,'Mayur',50000,'nashik','14-12-11 09.00.00','Development'),
(1002,'Shrikant',60000,'Pune','14-12-11 09.00.00','Development'),
(1003,'Sagar',100000,'Katraj','14-12-12 09.00.00','HR'),
(1004,'Hemant',70000,'Pimpri','14-12-13 09.00.00','HR'),
(1005,'Suyog',65000,'Wakad','15-10-21 09.00.00','Accountant'),
(1006,'Sushil',50000,'Nalstop','15-10-15 09.00.00','Accountant'),
(1007,'Archana',50000,'Kothrud','31-03-23 09.00.00','Electronics');
select * from employee;
select * from employee where salary>50000;

/*  1.Substring/substr/mid function 
same as indexing in string
The SUBSTRING() function extracts a substring from a string (starting at any position)

p y t h o n
1 2 3 4 5 6

syntax: substr(string, start_index, length)         */ 

select substr('machine',2,5); 
Select substr('python',2,2); 
Select substr('python',2);  
select * from employee;
select location from employee;
select location,substr(location,2,3) from employee;

/* 2.REPLACE Function - used to replace a substring from your column/any string.
syntax : replace(original string, string to be replaced, new string)      */

Select replace('sql tutorial','sql','DS'); 
select replace('python','python','JAVA');
Select replace(first_name,'a','@') from employee;
Update employee set first_name=replace(first_name,'a','$');
select * from employee;
Update employee set first_name=replace(first_name,'$','a');

/* 3.INSTR Function- It returns the position of the first occurrence of a string in another string.
'python'
syntax:   INSTR(string, substring)

string - The string that will be searched
substring - The substring to search for in string. 
If substring is not found, this function returns 0     */

select instr('sushil','s');
select instr('sushil','p');
select instr('Sushil','s');
select location from employee;
SELECT location,INSTR(location, "a") FROM employee;

/* 4.Upper/Ucase - It converts a string to upper-case.
syntax: UPPER(text)           */

select upper("SQL Tutorial is FUN!");
select location,upper(location) from employee;
select location,upper(location) as upper_location from employee;

/* 5.Lower/Lcase - It converts a string to lower-case.
syntax: LOWER(text)                  */

select lower("SQL Tutorial is FUN!");
select * from employee;
select location,lower(location) from employee;
select location,lcase(location) as lower_loc from employee;

/* 6.Char_length/Character_length/length - It return the length of a string (in characters).
syntax: char_length(text)                        */

select char_length("SQL Tutorial is FUN!");
select location,char_length(location) from employee;
select location,character_length(location) from employee;
select location,length(location) from employee;

/* 7.LEFT,RIGHT
The LEFT() function extracts a number of characters from a string (starting from left).
The RIGHT() function extracts a number of characters from a string (starting from right).
'python'

syntax
LEFT(string, number_of_chars)
RIGHT(string, number_of_chars)                          */

select left("SQL Tutorial", 3);
select location,left(location,3) as loc_3 from employee;

select right("SQL Tutorial", 3);
select location,right(location,3) from employee;

/* 8.Concat- It adds two or more expressions together.
syntax: CONCAT(expression1, expression2, expression3,...)                       */

select concat("SQL ", "Tutorial ", "is ", "fun!");
select concat("SQL", "Tutorial", "is", "fun!");
select concat("SQL+", "Tutorial+", "is+", "fun!");
select * from employee;
select first_name,location,concat(first_name,location) from employee;
select first_name,location,concat(first_name,' ',location) from employee;

/* 9.Insert- It inserts a string within a string at the specified position
and for a certain number of characters.

syntax: INSERT(string, position, number, string2)

string - The string that will be modified
position - The position where to insert string2 # 2
number - The number of characters to replace    # 2
string2 - The string to insert into string                        */
# python

select insert("sqltutorial.com", 1, 9, "Example");
select insert("sqltutorial.com", 11, 3, "no");
select insert("sqltutorial.com", 11, 0, "no ");

/* 10.Locate/Position - It returns the position of the first occurrence of a substring in a string.
If the substring is not found within the original string, this function returns 0.

syntax: LOCATE(substring, string, start)

substring - The substring to search for in string
string - The string that will be searched
start - The starting position for the search. Position 1 is default        */

select locate("3", "sql3tutorial.com");
select locate("3", "sql3tutorial.com",5);
select locate("3", "sql3tutorial.3com",5);
select locate("com","sqltutorial.com");
select location,locate('a',location) from employee;

# 11. Mod - It returns the remainder of a number divided by another number. 
select mod(10,4); # 10/4 >> 2
select mod(10,3); # 1
select mod(10,2); # 0
select * from employee;
select * from employee where mod(emp_id,2)!=0;  # odd emp_id
select * from employee where mod(emp_id,2)=0;   # even emp_id

################################################################################
# Date Functions
/* 1.DATE() function extracts the date part from a datetime expression.
Syntax: DATE(expression)                                     */

SELECT DATE("2017-06-15 09:34:21");
select * from airpassengers;
SELECT DATE(joindate) FROM AirPassengers;

/* 2.DATE_FORMAT() function - It formats a date as specified.
 syntax - DATE_FORMAT(date, format)
 
 Q.Format a date                                               */
SELECT DATE_FORMAT("2017-06-15", "%Y");
SELECT DATE_FORMAT("2017-06-15", "%y");
SELECT DATE_FORMAT("2017-06-15", "%M %d %Y");
SELECT DATE_FORMAT("2017-06-15", "%m");
SELECT DATE_FORMAT("2017-06-15", "%W");
SELECT DATE_FORMAT("2017-06-15", "%w");
SELECT DATE_FORMAT("2017-06-15", "%W %M %e %Y");
SELECT DATE_FORMAT("sql", "%W %m %e %y");
select * from airpassengers;
SELECT joindate,DATE_FORMAT(joindate, "%W %M %e %Y") FROM airpassengers;

# 3. ADDDATE/DATE_ADD
SELECT ADDDATE("2017-06-15", INTERVAL 10 DAY); # Add 10 days to a date
SELECT ADDDATE("2017-06-15 09:34:21", INTERVAL 15 MINUTE); # Add 15 minutes to the time
SELECT ADDDATE("2017-06-15 09:34:21", INTERVAL -3 HOUR);   # Subtract 3 hours
SELECT ADDDATE("2017-06-15", INTERVAL -2 MONTH); # subtract 2 months
SELECT DATE_ADD("2017-06-15", INTERVAL -2 MONTH); # subtract 2 months

# 4.DATE_SUB / SUBDATE
SELECT DATE_SUB("2017-06-15", INTERVAL 10 DAY);
SELECT DATE_SUB("2017-06-15 09:34:21", INTERVAL 15 MINUTE);
SELECT DATE_SUB("2017-06-15 09:34:21", INTERVAL 3 HOUR);
SELECT DATE_SUB("2017-06-15", INTERVAL -2 MONTH);

# 5.ADDTIME
SELECT ADDTIME("2017-06-15 09:34:21", "2");    # Add 2 seconds to a time

# 6.CURDATE/ CURRENT_DATE
SELECT CURDATE();
SELECT CURRENT_DATE();

# 7.CURRENT_TIME/CURTIME
SELECT CURRENT_TIME();
SELECT CURTIME();

# 8.CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP();

# 9.DATEDIFF
SELECT DATEDIFF("2017-06-25", "2017-06-15");

# 10.DAYNAME
SELECT DAYNAME("2024-02-23");    # Friday
SELECT DAYNAME("2024-02-29 09:34:21");
SELECT DAYNAME(CURDATE());

# 11.DAYOFWEEK
SELECT DAYOFWEEK(CURDATE());    # Weekday number
SELECT DAYOFWEEK("2023-11-26");     

# 12.DAYOFYEAR
SELECT DAYOFYEAR("2024-02-23");
SELECT DAYOFYEAR(CURDATE());

# 13.YEAR, MONTH, DAY, HOUR,MINUTE,SECOND
select * from airpassengers;
SELECT joindate,YEAR(joindate) FROM airpassengers;
SELECT joindate,MONTH(joindate) FROM airpassengers;

SELECT joindate,DAY(joindate) FROM airpassengers;
SELECT DAY("2017-06-15");     # Day of month
SELECT DAY("2017-06-15 09:34:21");
SELECT DAY(CURDATE());
SELECT DAYOFMONTH("2017-06-15");

SELECT YEAR("2017-06-15 09:34:21");
SELECT MONTH("2017-06-15 09:34:21");
SELECT DAY("2017-06-15 09:34:21");
SELECT HOUR("2017-06-15 09:34:21");
SELECT MINUTE("2017-06-15 09:34:21");
SELECT SECOND("2017-06-15 09:34:21");


################################################################################################
# Subqueries - query inside query / select ke andar select likhna
select * from employee;

# 1. Using a Subquery in a WHERE Clause
select emp_id from employee where emp_id>1004;
select emp_id,first_name,salary 
from employee 
where emp_id in (select emp_id from employee where emp_id>1004);

# 2. Using a Subquery in a FROM Clause
select * from cars93;
select * from cars93 where price>20;
select price,type,airbags from 
(select * from cars93 where price>20) as subquery1;

select price,type,airbags from 
(select * from cars93 where type='small') as subquery2;

select * from employee where salary>50000;
select max(salary) from  (select salary from employee where salary>50000) as max_salary;
select min(salary) from  (select salary from employee where salary>50000) as min_salary;
select min(salary) from  (select salary from employee where salary<70000) as min_salary;

# 3.Using a Subquery in a SELECT Clause
SELECT salary FROM employee WHERE emp_id=1005;
SELECT first_name,location from employee;
SELECT first_name,location,(SELECT salary FROM employee WHERE emp_id=1005) AS sal
FROM employee;

# nth highest salary - Imp interview question
# Syntax: select salary from table_name order by salary desc limit n-1,1; >> nth highest salary */

select * from employee;
select salary from employee order by salary;                         # Arranged salary in desc order
select salary from employee order by salary desc limit 1;            # Highest salary
select salary,emp_id from employee order by salary desc limit 1,1;   # 2nd highest salary
select salary,emp_id from employee order by salary desc limit 3,1;   # 4th highest salary

# nth highest salary using subquery
select salary from employee order by salary desc;    # Arranged salary in desc order

use db_feb;
select salary,emp_id from employee order by salary desc limit 2;    # Top 2 salary

select min(salary) from (select salary,emp_id from employee order by salary desc limit 2) as emp_new; # 2nd highest salary

select salary,emp_id from employee order by salary desc limit 3;    # Top 3 salary
select min(salary) from (select salary,emp_id from employee order by salary desc limit 3) as emp_new; # 3rd highest salary

#####################################################################################################################
/* Masking - If you don’t want to disclose any personal information to anyone then mask that data.
eg. Credit card no,  debit card no.                 */
# 123456789 >> 123******
select replace('123456789','456789','******');
select substr('123456789',4);
select replace('123456789',substr('123456789',4),'******');

select emp_id,substr(emp_id,3) from employee;
select emp_id,replace(emp_id,substr(emp_id,3),'**') 
from employee;

# 1001 >> 01