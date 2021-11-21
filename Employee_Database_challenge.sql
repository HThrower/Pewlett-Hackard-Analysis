--Deliverable 1 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
	ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN title AS ti
ON e.emp_no=  ti.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;


SELECT COUNT(u.emp_no),
u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT COUNT (*) FROM retiring_titles;

-- Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.
--Deliverable part 2
SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
--DISTINCT ON(emp_no)
--INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN title AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;












