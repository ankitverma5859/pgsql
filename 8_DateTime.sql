/*
	Numbers can hold various type of numbers except NULL
	
	Types:
	Integers:								Whole numbers with +ve and _ve
	Fixed Point, Floating Point Numbers:	Two format of fractions of whole numbers.
	
	
	Integers:
		smallint		2 bytes  -32768 to 32767
		integer			4 bytes	 -2147483648 to 2147483647 
		bigint			8 bytes	 -9223372036854775808 to 9223372036854775808 
	Database will give error if number is outside this range for the datatypes.
	
	Auto-increment integer data type SERIAL.
		smallserial		2 bytes	  1 to 32767
		serial			4 bytes   1 to 2147483647
		bigserial		8 bytes   1 to 9223372036854775808
*/
CREATE TABLE table_serial (
	product_id SERIAL,
	product_name VARCHAR(200)
);

/* 
Decimals represent a whole number plus a fraction of a whole number.
The fraction is represented by decimal digits following a decimal point.

Fixed-point numbers: (variable storage size)

	1. numeric(precision, scale)
	   precision: maxumum number of digits to the left and right of the decimal point.
	   scale: number of digits allowable on the right of the decimal point.
	   
	2. decimal(precision, scale)
	
Floating-point numbers:

	1. real(4 bytes) 	allows precision to six decimal digits.(6 after decimal point)
	2. double(8 bytes)	allows precision to 15 decimal points of precision.(6 after decimal point)
	
	Unline numeric, where we specify fixed precision and scale(e.g numeric(10,2))
	the decimal point in the column can float depending on the number.
*/

CREATE TABLE table_numbers(
	col_numeric numeric(20, 5),
	col real,
	col_double double precision
);


/* 
DateTime

	Date					Stores only date
	Time					Stores only time
	Timestamp				Stores date and time
	Timestamptz				Stores date, time, and timezone
	
	Inteval					Stores difference between two date/time data types.
*/

/*
	DATE
		Default format is YYYY-MM-DD
		CURRENT_DATE 		Stores current date
*/

CREATE TABLE table_date(
	id SERIAL PRIMARY KEY,
	employee_name VARCHAR(100) NOT NULL,
	hire_date DATE NOT NULL,
	add_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO table_date(employee_name, hire_date) VALUES('Ankit', '2023-03-12');
INSERT INTO table_date(employee_name, hire_date) VALUES('Simu', '2023-07-12');

SELECT * FROM table_date;
SELECT NOW();  /* Current date time */

/*
	Time
			Takes 8 bytes 
			column_name TIME(precision)
			precision: no. of fractional digits placed in the second field, precision up to 6 digits
			Common Formats:
				HH:MM
				HH:MM:SS
				HHMMSS
				
				MM:SS.pppppp p is precision E.g 12:03.999999
				HH:MM:SS.pppppp
				HHMMSS.pppppp
*/

CREATE TABLE table_time(
	id SERIAL PRIMARY KEY,
	class_name VARCHAR(100) NOT NULL,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL
);

INSERT INTO table_time (class_name, start_time, end_time)
VALUES
	('science', '10:30:00', '11:30:00'),
	('maths', '12:30:00', '01:30:00'),
	('english', '01:30:00', '02:30:00'),
	('social science', '02:30:00', '02:30:00');

SELECT * FROM table_time;

SELECT CURRENT_TIME;
SELECT CURRENT_TIME(4); /* current time with 4 precision */
