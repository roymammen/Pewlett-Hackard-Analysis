-- Querry#4: A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965. 

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title	
INTO mentorship_eligibility
FROM employees as e	
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')					
	AND (de.to_date = ('9999-01-01'))
ORDER BY e.emp_no ASC;
