UPDATE fudgemart_employees
	SET employee_supervisor_id = employee_id
	WHERE employee_department = 'Hardware'
	AND employee_jobtitle = 'Department Manager'