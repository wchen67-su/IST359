/*
-- un-comment to drop the objects
DROP TABLE fc_consulting
DROP FUNCTION f_fc_get_hrly_rate
DROP TABLE fc_rates
DROP TABLE fc_employees
DROP TABLE fc_projects
GO
*/

CREATE TABLE fc_projects
(
	proj_num int not null,
	proj_name varchar(50) not null,
	constraint pk_proj_num primary key (proj_num),
	constraint u_proj_name unique (proj_name)
)
GO

CREATE TABLE fc_employees
(
	emp_no int not null,
	emp_last varchar(50) not null,
	emp_first varchar(50) not null
	constraint pk_emp_no primary key (emp_no)
)
GO

CREATE TABLE fc_rates (
	rate_cat char(1) not null,
	rate_hrly money not null,
	constraint pk_rate_cat primary key (rate_cat)
)
GO

CREATE FUNCTION f_fc_get_hrly_rate(
	@rate_cat char(1)
)
RETURNS money 
AS
BEGIN
	DECLARE @Result as money 
	SET @Result = ( SELECT rate_hrly FROM fc_rates WHERE rate_cat=@rate_cat)
	RETURN @Result
END
GO

CREATE TABLE fc_consulting (
	cons_proj_num int not null,
	cons_emp_no int not null,
	cons_rate_cat char(1) not null,
	cons_hrs_worked money  not null,
	cons_total_billed AS dbo.f_fc_get_hrly_rate(cons_rate_cat)*cons_hrs_worked,
	constraint pk_cons primary key (cons_proj_num, cons_emp_no),
	constraint fk_proj_num foreign key (cons_proj_num) 
		references fc_projects(proj_num),
	constraint fk_emp_no foreign key (cons_emp_no) 
		references fc_employees(emp_no),
	constraint fk_rate_cat foreign key (cons_rate_cat) 
		references fc_rates(rate_cat)
)
GO

