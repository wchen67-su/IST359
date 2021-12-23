alter view v_fudgemart_employee_managers
	as
		select distinct * from fudgemart_employees 
			where employee_jobtitle like ('%Manager') 
				or employee_jobtitle in ('CEO')
go

select * from v_fudgemart_employee_managers


select employee_firstname, employee_lastname, employee_jobtitle,
	employee_department, employee_hourlywage
	from v_fudgemart_employee_managers
	where employee_hourlywage > 17 
		and employee_jobtitle like ('%Manager')

alter procedure p_fudgemart_markup_retail_by_department
(
	@dept varchar(20),
	@amount money
)
	as
	begin
		insert into fudgemart_products(product_department, product_retail_price)
		values (@dept, @amount)
end

exec p_fudgemart_markup_retail_by_department 'Clothing', 2.50
exec p_fudgemart_markup_retail_by_department 'Housewares', 3.75

select product_department, product_name, product_retail_price
	from fudgemart_products
	where product_department in ('Clothing', 'Housewares')
	order by product_department, product_name
