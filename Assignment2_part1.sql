--Drop tables and constraints
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-04-01 00:38:04.514

-- foreign keys
ALTER TABLE employees DROP CONSTRAINT employees_wards;

ALTER TABLE patients DROP CONSTRAINT patients_bills;

ALTER TABLE patients DROP CONSTRAINT patients_rooms;

ALTER TABLE patients_to_employees DROP CONSTRAINT patients_to_employees_employees;

ALTER TABLE patients_to_employees DROP CONSTRAINT patients_to_employees_patients;

ALTER TABLE rooms_to_employees DROP CONSTRAINT rooms_to_employees_employees;

ALTER TABLE rooms_to_employees DROP CONSTRAINT rooms_to_employees_rooms;

ALTER TABLE treatment_types DROP CONSTRAINT treatment_types_treatments;

ALTER TABLE treatments DROP CONSTRAINT treatments_patients;

ALTER TABLE patients DROP CONSTRAINT wards_patients;

-- tables
DROP TABLE bills;

DROP TABLE employees;

DROP TABLE patients;

DROP TABLE patients_to_employees;

DROP TABLE rooms;

DROP TABLE rooms_to_employees;

DROP TABLE treatment_types;

DROP TABLE treatments;

DROP TABLE wards;

-- End of file.



--Create tables and constraints
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-04-01 00:38:04.514

-- tables
-- Table: bills
CREATE TABLE bills (
    bill_number int identity  NOT NULL,
    bill_date datetime  NOT NULL,
    bill_amount money  NULL,
    CONSTRAINT bills_pk PRIMARY KEY  (bill_number)
);

-- Table: employees
CREATE TABLE employees (
    employee_id int identity  NOT NULL,
    first_name varchar(50)  NOT NULL,
    last_name varchar(50)  NOT NULL,
    fk_wards_id int  NOT NULL,
    CONSTRAINT employees_pk PRIMARY KEY  (employee_id)
);

-- Table: patients
CREATE TABLE patients (
    patients_id int identity  NOT NULL,
    first_name varchar(50)  NOT NULL,
    last_name varchar(50)  NOT NULL,
    address varchar(50)  NOT NULL,
    address2 varchar(50)  NULL,
    city varchar(50)  NOT NULL,
    state char(2)  NOT NULL,
    zip_code char(5)  NOT NULL,
    phone_number char(10)  NOT NULL,
    fk_bills_number int  NULL,
    fk_rooms_id int  NULL,
    fk_wards_id int  NULL,
    CONSTRAINT patients_pk PRIMARY KEY  (patients_id)
);

-- Table: patients_to_employees
CREATE TABLE patients_to_employees (
    patients_id int  NOT NULL,
    employees_id int  NOT NULL,
    CONSTRAINT patients_to_employees_pk PRIMARY KEY  (patients_id,employees_id)
);

-- Table: rooms
CREATE TABLE rooms (
    room_id int identity  NOT NULL,
    room_number int  NULL,
    CONSTRAINT rooms_pk PRIMARY KEY  (room_id)
);

-- Table: rooms_to_employees
CREATE TABLE rooms_to_employees (
    rooms_id int  NOT NULL,
    employees_id int  NOT NULL,
    CONSTRAINT rooms_to_employees_pk PRIMARY KEY  (rooms_id,employees_id)
);

-- Table: treatment_types
CREATE TABLE treatment_types (
    treatment_types_id int identity  NOT NULL,
    treatment_type varchar(255)  NULL,
    treatment_quantity int  NULL,
    description varchar(max)  NULL,
    fk_treatments_id int  NOT NULL,
    CONSTRAINT treatment_types_pk PRIMARY KEY  (treatment_types_id)
);

-- Table: treatments
CREATE TABLE treatments (
    treatment_id int identity  NOT NULL,
    date datetime  NOT NULL,
    fk_patients_id int  NOT NULL,
    CONSTRAINT treatments_pk PRIMARY KEY  (treatment_id)
);

-- Table: wards
CREATE TABLE wards (
    ward_id int  NOT NULL,
    ward_name varchar(50)  NOT NULL,
    CONSTRAINT wards_pk PRIMARY KEY  (ward_id)
);

-- foreign keys
-- Reference: employees_wards (table: employees)
ALTER TABLE employees ADD CONSTRAINT employees_wards
    FOREIGN KEY (fk_wards_id)
    REFERENCES wards (ward_id);

-- Reference: patients_bills (table: patients)
ALTER TABLE patients ADD CONSTRAINT patients_bills
    FOREIGN KEY (fk_bills_number)
    REFERENCES bills (bill_number);

-- Reference: patients_rooms (table: patients)
ALTER TABLE patients ADD CONSTRAINT patients_rooms
    FOREIGN KEY (fk_rooms_id)
    REFERENCES rooms (room_id);

-- Reference: patients_to_employees_employees (table: patients_to_employees)
ALTER TABLE patients_to_employees ADD CONSTRAINT patients_to_employees_employees
    FOREIGN KEY (employees_id)
    REFERENCES employees (employee_id);

-- Reference: patients_to_employees_patients (table: patients_to_employees)
ALTER TABLE patients_to_employees ADD CONSTRAINT patients_to_employees_patients
    FOREIGN KEY (patients_id)
    REFERENCES patients (patients_id);

-- Reference: rooms_to_employees_employees (table: rooms_to_employees)
ALTER TABLE rooms_to_employees ADD CONSTRAINT rooms_to_employees_employees
    FOREIGN KEY (employees_id)
    REFERENCES employees (employee_id);

-- Reference: rooms_to_employees_rooms (table: rooms_to_employees)
ALTER TABLE rooms_to_employees ADD CONSTRAINT rooms_to_employees_rooms
    FOREIGN KEY (rooms_id)
    REFERENCES rooms (room_id);

-- Reference: treatment_types_treatments (table: treatment_types)
ALTER TABLE treatment_types ADD CONSTRAINT treatment_types_treatments
    FOREIGN KEY (fk_treatments_id)
    REFERENCES treatments (treatment_id);

-- Reference: treatments_patients (table: treatments)
ALTER TABLE treatments ADD CONSTRAINT treatments_patients
    FOREIGN KEY (fk_patients_id)
    REFERENCES patients (patients_id);

-- Reference: wards_patients (table: patients)
ALTER TABLE patients ADD CONSTRAINT wards_patients
    FOREIGN KEY (fk_wards_id)
    REFERENCES wards (ward_id);

-- End of file.



--Adding information into tables
INSERT INTO wards (ward_id, ward_name)
VALUES ('7819', 'Emergency Department'),
		('6172', 'Cardiology'),
		('8170', 'Intensive Care Unit'),
		('1627', 'Neurology'),
		('2910', 'Oncology'),
		('3458', 'Obstetrics and Gynaecology')

INSERT INTO employees (first_name, last_name, fk_wards_id)
VALUES ('Will', 'Locke', '7819'),
		('Dylan', 'Grey', '6172'),
		('Leo', 'Rivera', '8170'),
		('Madison', 'Crosslin', '1627'),
		('Jack', 'Wenner', '2910'),
		('Paul', 'Donahoe', '3458'),
		('Russ', 'West', '6172'),
		('Ellie', 'Cho', '7819')

INSERT INTO rooms (room_number)
VALUES ('261'),
		('590'),
		('412'),
		('110'),
		('376')

INSERT INTO bills (bill_date, bill_amount)
VALUES ('03/15/2020', '$9,180.82'),
		('03/18/2020', '$13,819.12'),
		('03/19/2020', '$32,672.69'),
		('03/26/2020', '$6,381.72'),
		('03/31/2020', '$3,364.01')

INSERT INTO patients (first_name, last_name, address, address2, city, state, zip_code, phone_number, fk_bills_number, fk_rooms_id, fk_wards_id)
VALUES ('Jacob', 'Jabroni', '980 Shoreline Cir', NULL, 'Southside', 'AL', '35907', '8130187912', '1', '1', '6172'),
		('Jane', 'Lock', '9374 Oakland Drive', 'Apt 4', 'Winchester', 'Va', '22601', '5619187289', '2', '2', '7819'),
		('Anna', 'Wannabe', '90 North Littleton Ave', '1st Fl', 'Ocoee', 'FL', '34761', '7179026371', '3', '3', '1627'),
		('Max', 'Wilheim', '11 Stonybrook Dr', NULL, 'Altoona', 'PA', '16601', '4182930761', '4', '4', '8170'),
		('Linda', 'Reeba', '993 Peg Shop St', '2nd Fl', 'Waukesha', 'WI', '53186', '9176997800', '5', '5', '2910')

INSERT INTO treatments (date, fk_patients_id)
VALUES ('03/14/2020', 1),
		('03/17/2020', 2),
		('03/18/2020', 3),
		('03/25/2020', 4),
		('03/30/2020', 5)

INSERT INTO rooms_to_employees (rooms_id, employees_id)
VALUES ('1', '2'),
		('1', '7'),
		('2', '8'),
		('3', '4'),
		('4', '3'),
		('5', '5')

INSERT INTO patients_to_employees (patients_id, employees_id)
VALUES ('1', '2'),
		('1', '7'),
		('2', '8'),
		('3', '4'),
		('4', '3'),
		('5', '5')

INSERT INTO treatment_types (treatment_type, treatment_quantity, description, fk_treatments_id)
VALUES ('Benadryl', '3', 'Patient received 3 doses of 50mg Benadryl', '1'),
		('Influenza Shot and Ibuprofen', NULL, 'Patient needed to take the flu shot and was having "killer headaches"', '2'),
		('Brain MRI', NULL, 'Patient was complaining about prolonged headaches. A brain MRI was taken', '3'),
		('Surgical Removal', NULL, 'Patient was shot and had 3 bullet wounds. The bullet separated into 8 different wounds which required surgery to remove the bullet fragments', '4'),
		('Radiation', NULL, 'Patient has stage 3 stomach cancer and required radiation treatment', '5')