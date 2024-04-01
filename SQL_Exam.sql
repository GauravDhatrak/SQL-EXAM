create database sql_exam;
use sql_exam;
# Q1

create table customers (
c_id int primary key,
f_name varchar(30) unique,
l_name varchar(30) not null,
address varchar(25) not null,
qty int default '0',
c_limit decimal(10,2) check (c_limit > 1000)
);

select * from customers;

##### Q 2

insert into customers value ('1','gaurav','dhatrak','nashik',2,5000.25),
('2','abhi','dha','pune',5,6000.25),('3','tejas','shg','mumbai',8,7000.25);



use hr_exam;

# Q 3

select first_name from employees where length(first_name)= 4;

# Q 4

select department_id, sum(salary) as sum_of_salary from employees group by department_id;

# Q 5
select employee_id, avg(salary) as avg_sal from employees group by employee_id having avg_sal > 75000;


# Q 6
select * from departments;
select * from countries;
select * from regions;
select * from locations;




select c.country_id, count(distinct l.city) as count1 from countries c 
inner join locations l
on c.country_id = l.country_id
group by country_id order by count1 desc;

# Q 7
select e.first_name, d.department_name, e.hire_date from employees e
        inner join departments d
        on e.department_id = d.department_id
        where e.employee_id = 108;
   
   select * from employees;
   select * from departments;
        
delimiter $$
create procedure emp_detail ( in emp_id int)
begin
		select e.first_name, d.department_name, e.hire_date from employees e
        inner join departments d
        on e.department_id = d.department_id
        where e.employee_id = emp_id;
end;
$$
delimiter ;

call emp_detail(100);

#########################################################

# Q 8
select timestampdiff(year, hire_date, curdate()) as Emp_count_of_year from employees
            where employee_id = 100;


delimiter $$
create function emp_year (emp_id int)
returns int
deterministic
begin
			declare Emp_count_of_year int;
            select timestampdiff(year, hire_date, curdate()) into Emp_count_of_year from employees
            where employee_id = emp_id;
            return Emp_count_of_year;
end;
$$
delimiter ;

select emp_year(100);

############################################################################################


# mongodb

# Q 1

# db.restaurant.find({name:{$regex:/^p/}});

# Q 2 db.restaurant.find({$or:[{cuisine:"Bakery"},{Cuisine:"chinese"}]});


# Q 3 