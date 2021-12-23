ALTER TABLE fudgemart_timesheets
	ADD
		CONSTRAINT pk_timesheet_id
			PRIMARY KEY(timesheet_id),
		CONSTRAINT fk_timesheet_employee_id
			FOREIGN KEY(timesheet_employee_id)
			REFERENCES fudgemart_employees(employee_id),
		CONSTRAINT ck_timesheet_hours
			CHECK (timesheet_hours between 0 and 60)