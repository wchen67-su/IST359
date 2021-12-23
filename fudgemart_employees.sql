-- create the fudgemart_employees table
CREATE TABLE fudgemart_employees (
	employee_id int not null,
	employee_ssn char(9) not null,
	employee_lastname varchar(50) not null,
	employee_firstname varchar(50) not null,
	employee_jobtitle varchar(20) not null,
	employee_department varchar(20) not null,
	employee_birthdate datetime not null,
	employee_hiredate datetime DEFAULT getdate() not null,
	employee_termdate datetime null,
	employee_hourlywage money DEFAULT 8 not null,
	employee_supervisor_id int null,
	CONSTRAINT pk_employee_id PRIMARY KEY(employee_id),
	CONSTRAINT ck_employee_minimum_wage CHECK
		(employee_hourlywage>=8),
	CONSTRAINT u_employee_ssn UNIQUE (employee_ssn),
	CONSTRAINT ck_employee_birthdate CHECK
		(datediff(yy,employee_birthdate,getdate())>15)
)

-- add foreign key constaints
ALTER TABLE fudgemart_employees
	ADD
		CONSTRAINT fk_employee_department
				FOREIGN KEY (employee_department)
			REFERENCES fudgemart_departments_lookup(department_id),
		CONSTRAINT fk_employee_jobtitle
			FOREIGN KEY (employee_jobtitle)
			REFERENCES fudgemart_jobtitles_lookup(jobtitle_id)

-- add employees
INSERT INTO fudgemart_employees (
	employee_id,
	employee_ssn,
	employee_lastname,
	employee_firstname,
	employee_jobtitle,
	employee_department,
	employee_birthdate,
	employee_hiredate,
	employee_hourlywage
) VALUES (
	1,
	'111220001',
	'Photo',
	'Arial',
	'Sales Associate',
	'Electronics',
	'1/12/1982',
	'4/16/2004',
	12.70
)
INSERT INTO fudgemart_employees (
	employee_id,
	employee_ssn,
	employee_lastname,
	employee_firstname,
	employee_jobtitle,
	employee_department,
	employee_birthdate,
	employee_hiredate,
	employee_hourlywage
) VALUES (
	2,
	'111220002',
	'Ladd',
	'Sal',
	'Sales Associate',
	'Electronics',
	'11/30/1982',
	'7/26/2005',
	11.90
)
INSERT INTO fudgemart_employees (
	employee_id,
	employee_ssn,
	employee_lastname,
	employee_firstname,
	employee_jobtitle,
	employee_department,
	employee_birthdate,
	employee_hiredate,
	employee_hourlywage
) VALUES (
	3,
	'111220003',
	'Dawind',
	'Dustin',
	'Sales Associate',
	'Hardware',
	'9/3/1972',
	'7/2/2004',
	12.45
)
INSERT INTO fudgemart_employees (
	employee_id,
	employee_ssn,
	employee_lastname,
	employee_firstname,
	employee_jobtitle,
	employee_department,
	employee_birthdate,
	employee_hiredate,
	employee_hourlywage
) VALUES (
	4,
	'111220004',
	'Shores',
	'Sandi',
	'Sales Associate',
	'Hardware',
	'5/13/1990',
	'6/26/2005',
	10.50
)
INSERT INTO fudgemart_employees (
	employee_id,
	employee_ssn,
	employee_lastname,
	employee_firstname,
	employee_jobtitle,
	employee_department,
	employee_birthdate,
	employee_hiredate,
	employee_hourlywage
) VALUES (
	5,
	'111220005',
	'Gunnering',
	'Isabelle',
	'Department Manager',
	'Electronics',
	'2/22/1974',
	'8/16/2005',
	15.50
)
INSERT INTO fudgemart_employees (
	employee_id,
	employee_ssn,
	employee_lastname,
	employee_firstname,
	employee_jobtitle,
	employee_department,
	employee_birthdate,
	employee_hiredate,
	employee_hourlywage
) VALUES (
	6,
	'111220006',
	'Hvmeehom',
	'Lee',
	'Department Manager',
	'Hardware',
	'7/29/1973',
	'1/26/2004',
	14.85
)

SELECT * FROM fudgemart_employees