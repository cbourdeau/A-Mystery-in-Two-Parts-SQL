--1. List each employee's last name, first name, gender, employee number and salary
select e.emp_no, last_name, first_name, gender, salary
from employees e
join salaries s
on e.emp_no = s.emp_no

--2. List employees who were hired in 1986
select emp_no, first_name, last_name, hire_date
from employees
where DATE_PART('year', hire_date) = 1986
order by hire_date ASC

--3. List the manager of each department including department number, department name, 
--the manager's employee number, last name, first name and start and end employement dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, de.from_date, de.to_date 
from dept_manager dm
join departments d
    on dm.dept_no = d.dept_no
join employees e
    on dm.emp_no = e.emp_no
join dept_emp de
    on dm.emp_no = de.emp_no

--4. List the department of each employee with employee number, last name, 
--first name, and department name.
select e.emp_no, last_name, first_name, d.dept_name
from employees e
join dept_emp de
	on e.emp_no = de.emp_no
join departments d
	on de.dept_no = d.dept_no

--5. List all employees whose first name is "Hercules" and last names begin with "B".
select first_name, last_name
from employees
where first_name = 'Hercules' and last_name like 'B%'


--6. List employees' number, last name, first name, and  
--department name from all employees in the Sales Department. 
select e.emp_no, last_name, first_name, d.dept_name
from employees e
join dept_emp de
	on e.emp_no = de.emp_no
join departments d
	on de.dept_no = d.dept_no
where dept_name = 'Sales'

--7. List employees' number, last name, first name, and department name 
--from all employees in the Sales and Development Departments. 
select e.emp_no, last_name, first_name, d.dept_name
from employees e
join dept_emp de
	on e.emp_no = de.emp_no
join departments d
	on de.dept_no = d.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names
select last_name, count(last_name) count
from employees
group by last_name
order by count desc
