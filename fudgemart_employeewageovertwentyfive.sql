SELECT employee_firstname, employee_lastname, employee_hourlywage
	FROM fudgemart_employees
	WHERE employee_hourlywage > 12
	ORDER BY employee_hourlywage