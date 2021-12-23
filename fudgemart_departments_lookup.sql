CREATE TABLE fudgemart_departments_lookup (
	department_id varchar(20) NOT NULL,
 CONSTRAINT PK_fudgemart_department_id
			PRIMARY KEY (department_id)
)

INSERT INTO fudgemart_departments_lookup
	(department_id) VALUES ('Customer Service')

INSERT INTO fudgemart_departments_lookup
	(department_id) VALUES ('Electronics')

INSERT INTO fudgemart_departments_lookup
	(department_id) VALUES ('Hardware')

INSERT INTO fudgemart_departments_lookup
	(department_id) VALUES ('Sporting Goods')

SELECT * FROM fudgemart_departments_lookup
