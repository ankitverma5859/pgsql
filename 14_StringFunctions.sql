/*
	UPPER	:	To convert a string to uppercase
	LOWER	:	To convert a string to lowercase
	INITCAP	:	To convert a string to propercase or titlecase.
*/

SELECT UPPER('amazing ONe')

SELECT 
	UPPER(first_name) as "First Name",
	UPPER(last_name) as "Last Name"
FROM directors;

SELECT LOWER('AmaZing OnE')

SELECT INITCAP('the Wold is changing with a Lightening SPEED.')

SELECT 
	INITCAP
	(
		CONCAT(first_name, ' ', last_name)	
	) as "Full Name"
FROM directors
ORDER BY first_name;

/*
	LEFT: LEFT(string, n)
		  Returns first n characters of the string.
		  
	RIGHT: RIGHT(string, n)
		   Returns the last n characters of the string.
*/

SELECT LEFT('ABCD', 1);

SELECT LEFT('ABCD', 3);

SELECT LEFT('ABCD', -1);

SELECT LEFT('ABCD', -2);

/*
	Select the initials of the directors
*/

SELECT 
	LEFT(first_name, 1) as "INITIAL"
FROM directors;

SELECT 
	LEFT(first_name, 1) as "INITIAL",
	COUNT(*) as "Total Initials"
FROM directors
GROUP BY 1
ORDER BY 1;

SELECT RIGHT('ABCD', 1);

SELECT RIGHT('ABCD', 2);

SELECT RIGHT('ABCD', -1);

SELECT RIGHT('ABCD', -2);

SELECT last_name
FROM directors
WHERE RIGHT(last_name, 2) = 'on';

SELECT 
	CONCAT(LEFT(first_name, 1), '. ', INITCAP(last_name)) as "FULL NAME"
FROM directors;

/*
	REVERSE(string)
	It arranges the string in the reverse order.
*/

SELECT REVERSE('ANKIT VERMA');

/*
	SPLIT_PART(string, delimiter, position)
	It splits the given string based on the delimeter and returns the n position.
*/

SELECT SPLIT_PART('Ankit Verma is pursuing PG at IIT KGP', ' ', 1);
SELECT SPLIT_PART('Ankit Verma is pursuing PG at IIT KGP', ' ', 2);
SELECT SPLIT_PART('Ankit Verma is pursuing PG at IIT KGP', ' ', -1);
SELECT SPLIT_PART('Ankit Verma is pursuing PG at IIT KGP', ' ', -2);
SELECT SPLIT_PART('A|B|C|D|E', '|', 2);

/*
	Notice that release date is in date format and needs to be converted to string for SPLIT_PART
*/
SELECT 
	movie_name, 
	release_date,
	SPLIT_PART(release_date::text, '-', 1) as "release year"
FROM movies;

/*
	TRIM	: Trims the specified character or space from both the sides of the string.
			  LEADING | TRAILING can be specified to select the direction as well.
	LTRIM	: Trims the specified character or space from the left side of the string.
	RTRIM	: Trims the specified character or space from the right side of the string.
	BTRIM	: Trims the specified character or space from the both the sides of the string.
	
	TRIM([LEADING | TRAILING| BOTH] [characters] FROM string)
*/

SELECT TRIM(LEADING FROM '     Hello     this    is ankit     ');
SELECT TRIM(LEADING '0' FROM CAST(00001234 AS TEXT));
SELECT LTRIM('     Hello     this    is ankit     ');
SELECT LTRIM('yummy', 'y')

SELECT TRIM(TRAILING FROM '     Hello     this    is ankit    ');
SELECT RTRIM('     Hello     this    is ankit    ');
SELECT RTRIM('yummy', 'y');

SELECT TRIM('     Hello     this    is ankit     ');
SELECT BTRIM('     Hello     this    is ankit     ');
SELECT TRIM('yyyyaaaaaayy', 'y');
SELECT BTRIM('yyyyaaaaaayy', 'y');
SELECT TRIM('yummy', 'y');

/*
	LPAD: LPAD(string, n, character)
		  Pads the given string on the left side.
		
	RPAD: LPAD(string, n, character)
		  Pads the given string on the right side.
*/

SELECT LPAD('ankit', 10, '*');
SELECT RPAD('ankit', 10, '*');

/* Suppose you want to make the ids of your table alphanumeric */
SELECT LPAD('1111', '6', 'A');
