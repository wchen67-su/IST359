/*** CLEANSING ***/
UPDATE fudgenbooks_import  SET Subj1 = 'MySQL' WHERE lower(Subj1) = 'mysql';
UPDATE fudgenbooks_import 	SET Subj2 = 'MySQL' WHERE lower(Subj2) = 'mysql';
UPDATE fudgenbooks_import 	SET Subj1 = 'MSSQL' WHERE lower(Subj1) = 'mssql';
UPDATE fudgenbooks_import 	SET Subj2 = 'MSSQL' WHERE lower(Subj2) = 'mssql';

/*** TRANSFORMATIONS ***/
-- 1st step: this statement populates the publishers table
insert into fb_publishers
	select distinct Pub_id, [Publisher Name], [Publisher URL] 
		from fudgenbooks_import
go

-- 2nd this statemnt populates the fb_bookstore table
insert into fb_bookstore
	select distinct convert(int, [ISBN]), [Title], [Price], [Pages], [Pub_id]
	 from fudgenbooks_import
go

-- 3rd this statement populates the fb_authors table 
insert into fb_authors
	select Author1, convert(int,ISBN) from fudgenbooks_import
	where Author1 is not null
		union
	select Author2, convert(int,ISBN) from fudgenbooks_import
	where Author2 is not null
		union
	select Author3, convert(int,ISBN) from fudgenbooks_import
	where Author3 is not null
go

-- Last: this statement populates the fb_subjects
insert into fb_subjects 
	select Subj1, convert(int,ISBN) from fudgenbooks_import
	where Subj1 is not null
		union 
	select Subj2, convert(int,ISBN) from fudgenbooks_import
	where Subj2 is not null
go

/*** VERIFICATION ***/
SELECT 
	(select count(*) from fb_bookstore) as fb_bookstore_count,
	(select count(*) from fudgenbooks_import) as fudgenbooks_count

go
SELECT b.isbn, title, price, pages, p.pub_id, pub_name, pub_url, author, subj
	FROM fb_bookstore b JOIN fb_publishers p ON b.pub_id=p.pub_id
		JOIN fb_authors a ON b.isbn=a.isbn
		JOIN fb_subjects s on b.isbn=s.isbn
	ORDER BY title
