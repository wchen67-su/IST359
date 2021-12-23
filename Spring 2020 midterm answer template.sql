/*******************
Question 1
*******************/
--William Chen


GO

/*******************
Question 2
*******************/

if exists(select * from sys.objects where name='mt_visits') drop table mt_visits; if exists(select * from sys.objects where name='mt_advisors') drop table mt_advisors; if exists(select * from sys.objects where name='mt_students') drop table mt_students;
create table mt_advisors (advisors_id int identity, advisors_fname varchar(30), advisors_lname varchar(30), constraint pk_advisors_id primary key (advisors_id)) create table mt_students (students_netid varchar(20) not null, students_fname varchar(30), students_lname varchar(30), students_major varchar(100), constraint pk_students_netid primary key (students_netid))
insert into mt_advisors (advisors_fname, advisors_lname) values ('Lora', 'Carlson'), ('Shannon', 'Marrero') insert into mt_students (students_netid, students_fname, students_lname, students_major) values ('kbyers', 'Katarina', 'Byers', 'Sport Analytics'), ('vquintero', 'Vishal', 'Quintero', 'Information Studies'), ('mprince', 'Marnie', 'Prince', 'Psychology'), ('rsparrow', 'Roscoe', 'Sparrow', 'Information Studies'), ('ahopkins', 'Annabell',  'Hopkins', 'Public Policy'), ('hschmidt', 'Hayleigh',  'Schmidt', 'Information Studies')


/*******************
Question 3
*******************/
create table mt_visits(
	visits_id int identity not null,
	fk_students_netid varchar(20) null,
	fk_advisor_id int null,
	visits_notes varchar(100) null,
	visits_date datetime not null default getdate()

constraint fk_students_netid foreign key(fk_students_netid) references mt_students(students_netid),
constraint fk_advisor_id foreign key(fk_advisor_id) references mt_advisors(advisors_id),
constraint pk_visits_id primary key(visits_id) 
)
GO

/*******************
Question 4
*******************/


insert into mt_visits (fk_students_netid, fk_advisor_id, visits_notes, visits_date)
values	('kbyers', 1, 'Student would like to add a minor.', 2/13/20),
		('vquintero', 1, 'Student in for senior check meeting.', 1/10/20),
		('rsparrow', 1, 'Asked about transfering a course.', 1/15/20),
		('rsparrow', 1, 'Visited regarding spring registration.', 2/29/20)


GO


/*******************
Question 5
*******************/
update mt_students
set students_fname= 'Katrina'
where students_fname= 'Katarina'


GO

/*******************
Question 6
*******************/
select students_major, count(fk_students_netid) as number_visits
from mt_students left join mt_visits on students_netid=fk_students_netid
group by students_major


GO

/*******************
Question 7
*******************/
select students_netid, students_fname + ' ' + students_lname as students_fullname, students_major
from mt_students left join mt_visits on students_netid=fk_students_netid
group by students_netid, students_fname, students_lname, students_major
having count(fk_students_netid) = 0


GO

/*******************
Question 8
*******************/
create procedure mt_remove_student
(
	@students_fname varchar(30),
	@students_lname varchar(30)
)
	as
	begin
		delete from mt_students
		where @students_fname=students_fname and @students_lname=students_lname
end
GO

/*******************
Question 9
*******************/
exec mt_remove_student 'Hayleigh', 'Schmidt'


GO