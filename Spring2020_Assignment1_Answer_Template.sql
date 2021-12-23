/*************************
* IST 359 Assignment 1   *
* Prof. Ferger           *
*************************/

-- Put your name here -->> William Chen


-----------------------------
-- 1.1
-----------------------------

-- No code here.  Just comment out anything below that isn't working to get full points in this section.

GO

-----------------------------
-- 1.2
-----------------------------
drop table a1_jobs, a1_subcategories, a1_categories

GO
-----------------------------
-- 1.3
-----------------------------
create table a1_categories 
(categories_code varchar(10) not null,
categories_title varchar(50) not null
);

GO

-----------------------------
-- 1.4
-----------------------------
create table a1_subcategories
(subcategories_code varchar(10) not null,
subcategories_title varchar(50) not null,
fk_categories_code varchar(10) null
);

GO


-----------------------------
-- 1.5
-----------------------------
create table a1_jobs
(jobs_id int identity,
jobs_title varchar(50) not null,
jobs_number_employed int null,
jobs_mean_wage decimal(6,2) null,
jobs_last_updated  datetime default getdate() null,
fk_subcategories_code varchar(10) null
);

GO

-----------------------------
-- 2.1
-----------------------------
alter table a1_jobs
	add
		constraint pk_jobs_id primary key (jobs_id),
		constraint ck_mean_wage check (jobs_mean_wage > 0),
		constraint u_job_title unique (jobs_title);

GO

-----------------------------
-- 2.2
-----------------------------
alter table a1_categories
	add
		constraint pk_categories_code primary key (categories_code),
		constraint u_categories_code unique (categories_code);


GO

-----------------------------
-- 2.3
-----------------------------
alter table a1_subcategories
	add
		constraint pk_subcategories_code primary key (subcategories_code),
		constraint u_subcategories_code unique (subcategories_code);

GO

-----------------------------
-- 3.1
-----------------------------
alter table a1_subcategories
	add
		constraint fk_subcategories_code foreign key (fk_categories_code) references a1_categories(categories_code);

GO

-----------------------------
-- 3.2
-----------------------------
alter table a1_jobs
	add
		constraint fk_categories_code foreign key (fk_subcategories_code) references a1_subcategories(subcategories_code);

GO

-----------------------------
-- 4
-----------------------------

-- No code here.  Just take a screen shot of you database diagram and include it in your zip file.

-----------------------------
-- 5.1
-----------------------------
insert into a1_categories (categories_code, categories_title)
	values
		('11-0000', 'Management Occupations'),
		('13-0000', 'Business and Financial Operations Occupations'),
		('29-0000', 'Healthcare Practitioners and Technical Occupations'),
		('15-0000', 'Computer and Mathematical Occupations');
		
GO

-----------------------------
-- 5.2
-----------------------------
insert into a1_subcategories (subcategories_code, subcategories_title, fk_categories_code)
	values
		('29-1000', 'Health Diagnosing and Treating Practitioners', '29-0000'),
		('15-1100', 'Computer Occupations', '15-0000');

GO

-----------------------------
-- 5.3
-----------------------------		
insert into a1_jobs (jobs_title, jobs_mean_wage, jobs_number_employed, fk_subcategories_code)
	values
		('Computer User Support Specialists', 26.46, 630700, '15-1100'),
		('Computer Network Support Specialists', 32.72, 181360, '15-1100'),
		('Database Administrators', 44.25, 110090, '15-1100'),
		('Software Developers and Programmers', 50.23, 1666270, '15-1100'),
		('Licensed Practical and Licensed Vocational Nurses', 22.62, 701690, '29-1000');

GO

-----------------------------
-- 6.1
-----------------------------
select * from a1_categories full join a1_subcategories on categories_code=fk_categories_code
	full join a1_jobs on fk_subcategories_code=subcategories_code

GO

-----------------------------
-- 6.2
-----------------------------
select subcategories_title,
	avg(jobs_mean_wage) as avg_mean_wage
	from a1_jobs join a1_subcategories on fk_subcategories_code=subcategories_code
	where subcategories_title = 'Computer Occupations'
	group by subcategories_title
 

GO


-----------------------------
-- 7
-----------------------------				

/* Write your answers below 

1.
There is already a foreign key constraint referencing the two tables so it knows where to go to get the other relevant information. For example,
for a1_categories, the only table columns are the category code and the title. If you add all the data from the tables, you would need to create different
tables or update the table to include more columns but it is unnecessary because of the other tables we created (a1_subcategories and a1_jobs).
2.
a1_subcategories is a lookup table for a1_jobs. It helps jobs reference what subcategory someone is working in through the foreign key in a1_jobs.
So someone has a job title and if you want to find out where it was categorized, it would use the foreign key constraint to see where it falls in subcategories
and then subcategories can use its own foreign key to lookup the actual category the job is in. A lookup table is a descriptive table that leads to the main 
table and its relevant information. It is like a help desk referring you to somewhere else.
3.
This hardest part was inserting the values into the tables because it was confusing on which wage we needed to include. Besides that, the project
was fairly easy overall.
*/

