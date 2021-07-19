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
