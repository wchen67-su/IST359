CREATE TABLE fudgemart_timesheets (
	timesheet_id int identity(1,1) NOT NULL,
	timesheet_payrolldate Datetime NOT NULL,
	timesheet_employee_id Int NOT NULL,
	timesheet_hours decimal(3,1) default(40.0) NOT NULL
)