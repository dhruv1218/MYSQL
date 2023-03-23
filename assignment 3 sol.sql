use mydatabase

create table Emp_Detail(
Employee_No int(3),
First_Name varchar(20),
Last_Name varchar(20),
Job_ID int(10),
Job_Title varchar(20),
Department_No int(5),
Department_Name varchar(20),
Hire_Date Date,
Annual_Salary int(10),
Commission_Percent int(2)
)

select * from Emp_Detail


insert into Emp_Detail(Employee_No,First_Name,Last_Name,Job_ID,Job_Title,Department_No,Department_Name,Hire_Date,Annual_Salary,Commission_Percent)values
(101,"Ravi","Sharma",20101,"Manager",20,"Sales","1987-09-16",12000.76,0),
(102,"Kapil","Shah",200105,"Product Excutive",50,"Marketing","1996-05-12",15000.55,1),
(103,"Niharika","Soni",200107,"Programmer",10,"IT","1988-06-11",17000,0),
(104,"Richa","Sharma",200187,"Exceutive",40,"Admin","1994-08-17",55000,2),
(105,"Tejas","Patel",200976,"Manager",30,"HR","1990-01-27",30000,0),
(106,"Kanika","Kapoor",200765,"Accountant",0,"Finance","1992-05-21",33000.887,3),
(107,"Rohan","Seth",200234,"Programmer",10,"IT","1989-11-13",26000,6),
(108,"Zainab","Kapasi",200546,"Exceutive",40,"Admin","1989-11-12",20000.76,7),
(109,"Mittal","Bajaj",200123,"Account Executive",90,"Finance","1992-06-21",10000,1),
(110,"Tina","Rai",200548,"Support Assistant",10,"IT","1992-04-21",18000,2)

select * from Emp_Detail

truncate table Emp_Detail



#List the last name, first name and employee number of all programmers who were hired on or before 21 May 1991 sorted in ascending order of last name
select Employee_No,First_Name,Last_Name from Emp_Detail 
where Hire_Date <= '1991-05-21'
order by Last_Name asc


#List the department number, last name and salary of all employees who were hired between 16/09/87 and 12/05/96 sorted in ascending order of last name within department number
select Last_Name,Department_No,Annual_Salary from Emp_Detail 
where Hire_Date between '1987-05-12' and '1996-05-12'
order by Last_name asc,Department_No asc 


#List all the data for each job where the average salary is greater than 15000 sorted in descending order of the average salary.
select * from Emp_Detail 
where Annual_Salary > 15000
order by Annual_Salary desc



#List the last name, first name, job id and commission of employees who earn commission sorted in ascending order of first name. (Commision=Annual_Salary* Commission_Percent)
select last_name, first_name, job_id, annual_salary*commission_percent as commission from Emp_Detail 
having commission > 0 
order by first_name asc

#Which Job Title are found in the IT and Sales departments?
select distinct Job_Title,Department_Name from Emp_Detail
where Department_Name in ('IT','Sales')


#List the last name of all employees in department no 10 and 40 together with their monthly salaries (rounded to 2 decimal places), sorted in ascending order of last name.




#Show the Annual Salary salaries displayed with no decimal places.





#Personnel Department Requirements

#Show the total number of employees
select count(Employee_No) from Emp_Detail


#List the department number, department name and the number of employees for each department that has more than 2 employees grouping by department number and department name.
select department_no,department_name,count(employee_no) as total_employee from Emp_Detail
group by department_no,department_name
having total_employee > 2


#List the department number, department name and the number of employees for the department that has the highest number of employees using appropriate grouping.
select department_no,department_name,count(employee_no) as total_employee from Emp_Detail
group by department_name 
having total_employee = (select count(*) from emp_detail group by department_no order by count(*) desc limit 1)




#List the department number and name for all departments where no programmers work.
select department_no,department_name from Emp_Detail
where job_title not in('Programmer')



#Update all the Annual salaries for jobs with an increase of 1000.
create table Emp_Detail1 select * from Emp_Detail
update Emp_Detail1
set annual_salary = annual_salary + 1000

select * from Emp_Detail1


#List all the data for jobs sorted in ascending order of job id.
select * from Emp_Detail
order by job_id asc 


#The job history for employee number 102 is no longer required. Delete this record. 
delete from Emp_Detail1
where employee_no = 102



#Prepare a table with percentage raises, employee numbers and old and new salaries.Employees in departments 20 and 10 are given a 5% rise, employees in departments 50, 90 and 30 are given a 10% rise and employees in other departments are not given a rise.







#IT Manager Requirements

#Create a new view for manager’s details only using all the fields from the employee table. 
create view manager_detail
as select * from emp_detail 
where Job_Title = "Manager"

select * from manager_detail


#Show all the fields and all the managers using the view for managers sorted in ascending order of employee number.
select * from manager_detail
order by employee_no asc

