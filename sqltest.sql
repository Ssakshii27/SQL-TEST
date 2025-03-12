--Section A: Basic Concepts
create database company_db;

create table departments_table(dept_id serial primary key,dept_name varchar);
create table employees_table(employee_id serial primary key,first_name	varchar,last_name varchar,salary decimal,hire_date	date,dept_id int references departments_table(dept_id));
select * from departments_table;
select * from employees_table;
copy departments_table from 'D:\ARC\SQL\SQL Test\departments.csv' delimiter ',' csv header;
copy employees_table from 'D:\ARC\SQL\SQL Test\employees.csv' delimiter ',' csv header;

--Difference between Drop, Truncate & Delete: 
--drop deletes whole table (data as well as structure)
--truncate deletes the data of the table not the structure
--delete deletes the data according to the specific condition given

--List all the numeric and string data types available in PostgreSQL
--Numeric:smallint, bigint, int, serial, bigserial,decimal precision,real,numeric
--String: varchar,char,text

--Explain the difference between VARCHAR, TEXT, and CHAR data types
--varchar: usefull for fields where length of data varies
--text: use to store large amount of text
--char:used where length of the data in consistent

--Section B: Data Manipulation
update employees_table set salary=salary*1.10;

delete from employees_table where hire_date<'2022-01-01';

select * from employees_table where salary between 50000 and 80000;

select * from employees_table where first_name ilike 'j%';

--Explain the RETURNING clause in PostgreSQL with an example
--It lets us instantly get data from a modified record right after an insert, update or delete operations. It helps to retrives data in the same query instead to write a different query.
--Ex: update employees_table set salary=salary*1.10 returning salary;

--Section C: Sorting & Aggregation
select * from employees_table order by salary desc;

select * from employees_table order by salary desc limit 3;

select sum(salary) from employees_table;

select avg(salary) from employees_table having avg(salary) >70000;

--Section D: String & Date Functions
select concat(first_name,' ',last_name) from employees_table; 

select extract ('year' from hire_date) from employees_table;

select upper(first_name) from employees_table;

select extract('year' from age(current_date,hire_date)) from employees_table;

select date_trunc('month',hire_date) from employees_table;

--Section E: Advanced Filtering & Conditional Logic
select coalesce(salary,50000) from employees_table;

select greatest(salary) from employees_table;
select least(salary) from employees_table;

select (salary * 100) / nullif((select sum(salary) from employees_table), 0) from employees_table;

--Section F: Joins & Set Operations
select * from departments_table d inner join employees_table e on d.dept_id=e.dept_id;

select * from departments_table d left join employees_table e on d.dept_id=e.dept_id;

select dept_id from departments_table 
except
select dept_id from employees_table;

--Explain the difference between UNION and UNION ALL with an example.
--union removes duplicates, while union keeps all rows including duplicates.





