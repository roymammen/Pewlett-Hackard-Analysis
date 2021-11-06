-- Query#1 : A query is written and executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955. 	

SELECT e.emp_no, e.first_name, e.last_name, ti.title, de.from_date, de.to_date	
INTO retirement_titles	
FROM employees as e					
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Query#2 :​A query is written and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title. 

SELECT DISTINCT ON (r.emp_no) r.emp_no, r.first_name, r.last_name, ti.title	
INTO unique_title
FROM retirement_titles as r					
LEFT JOIN titles as ti
ON r.emp_no = ti.emp_no
ORDER BY r.emp_no ASC, ti.tp_date DESC;

-- Query#3: A query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring. 

SELECT COUNT(u.title), u.title
INTO retireing_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.title) DESC;	

