CREATE TABLE fudgemart_jobtitles_lookup (
	jobtitle_id varchar(20) not null
)

ALTER TABLE fudgemart_jobtitles_lookup
 ADD CONSTRAINT pk_jobtitle_id
			PRIMARY KEY (jobtitle_id)

INSERT INTO fudgemart_jobtitles_lookup
(jobtitle_id) VALUES ('CEO')

INSERT INTO fudgemart_jobtitles_lookup
(jobtitle_id) VALUES ('Store Manager')

INSERT INTO fudgemart_jobtitles_lookup
(jobtitle_id) VALUES ('Department Manager')

INSERT INTO fudgemart_jobtitles_lookup
(jobtitle_id) VALUES ('Sales Associate')

SELECT * FROM fudgemart_jobtitles_lookup