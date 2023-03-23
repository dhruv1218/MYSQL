show databases

use dhruv

create table Employee(
ID int(15),
Name varchar(10),
Last_Name varchar(10),
Department int(5)
)

select * from Employee

insert into Employee(ID,Name,Last_Name,Department)values
(123234877,"Michael","Rogers",14),
(152934485,"Anand","Manikutty",14),
(222364883,"Carol","Smith",37),
(326587417,"Joe","Stevens",37),
(332154719,"Mary-Anne","Foster",14),
(332569843,"George","ODonnell",77),
(546523478,"John","Doe",59),
(631231482,"David","Smith",77),
(654873219,"Zacary","Efron",59),
(745685214,"Eric","Goldsmith",59),
(845657245,"Elizabeth","Doe",14),
(845657246,"Kumar","Swamy",14)

truncate table Employee

select * from Employee

create table Department(
Code int(2),
Name varchar(20),
Budget int(10)
)

select * from Department

insert into Department(Code,Name,Budget)values
(14,"IT",6500),
(37,"Accounting",15000),
(59,"Human Resources",240000),
(77,"Research",55000)

select * from Department


#1 Select the last name of all employees, without duplicates.
select distinct Last_Name from employee 

#2 Select all the data of employees whose last name is "Smith".
select * from Employee where last_name="Smith"

#3 Select all the data of employees whose last name is "Smith" or "Doe".
select * from Employee where last_name="Smith" or last_name="doe"

#4 Select all the data of employees that work in department 14.
select * from Employee where department=14

#5 Select all the data of employees that work in department 37 or department 77.
select * from Employee where Department=37 or Department=77

#6 Select all the data of employees whose last name begins with an "S".
select * from Employee where Last_Name like "S%"

#7 Select the sum of all the departments' budgets.
select sum(budget) from department 

#8 Select the number of employees in each department (you only need to show the department code and the number of employees).
select department,count(department) from employee
group by Department

#9 Select all the data of employees, including each employee's department's data.
select Employee.Id,Employee.Name,Employee.Last_Name,Employee.Department,Department.Name,Department.Budget from Employee
left join Department 
on Employee.Department = department.code

#10 Select the name and last name of each employee, along with the name and budget of the employee's department.
select Employee.Name,Employee.Last_Name,Department.Name as Dept_Name,Department.Budget from Employee
left join Department 
on Employee.Department = department.code

#11 Select the name and last name of employees working for departments with a budget greater than $60,000.
select Employee.Name,Employee.Last_Name from Employee
left join Department 
on Employee.Department = department.code
where budget>60000

#12 Select the departments with a budget larger than the average budget of all the departments.
select * from Department 
where budget > (select avg(budget) from department)

#13 Select the names of departments with more than two employees.
select Department.name from employee 
inner join Department  
on Employee.Department = Department.Code
group by department
having count(*)>2

#14 Very Important - Select the name and last name of employees working for departments with second lowest budget.
select Employee.Name,Employee.Last_Name,min(budget) from Employee 
right join Department 
on Employee.Department = Department.Code 
where budget not in(select min(budget) from department)


#15 Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11.
insert into department values(11,"Quality Assurance",40000)


#16 And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into Employee values(847219811,"Mary","Moore",11)


#17 Reduce the budget of all departments by 10%.
select budget*0.9 from department 


#18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
update employee 
set department = 14
where department = 77



#19 Delete from the table all employees in the IT department (code 14).
delete from employee 
where department = 14


#20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from employee 
where department in(
select code from department where budget>=60000)


#21 Delete from the table all employees.
delete from employee