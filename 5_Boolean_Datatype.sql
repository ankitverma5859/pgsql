/* Boolean */
/*
	TRUE		FALSE
	'true'		'false'
	't'			'f'
	'yes'		'no'
	'1'			'0'
*/

CREATE TABLE table_boolean(
	product_id SERIAL PRIMARY KEY,
	is_available BOOLEAN NOT NULL
);

INSERT INTO table_boolean(is_available) VALUES(TRUE);
INSERT INTO table_boolean(is_available) VALUES('t');
INSERT INTO table_boolean(is_available) VALUES('yes');
INSERT INTO table_boolean(is_available) VALUES('1');

INSERT INTO table_boolean(is_available) VALUES(FALSE);
INSERT INTO table_boolean(is_available) VALUES('f');
INSERT INTO table_boolean(is_available) VALUES('no');
INSERT INTO table_boolean(is_available) VALUES('0');

INSERT INTO table_boolean(is_available) VALUES('1'), ('0');

SELECT * FROM table_boolean
WHERE is_available;

SELECT * FROM table_boolean
WHERE is_available = TRUE;

SELECT * FROM table_boolean
WHERE is_available = 't';

SELECT * FROM table_boolean
WHERE is_available = 'yes';

SELECT * FROM table_boolean
WHERE is_available = 'y';

SELECT * FROM table_boolean
WHERE is_available = '1';

SELECT * FROM table_boolean
WHERE is_available = FALSE;

SELECT * FROM table_boolean
WHERE is_available = 'f';

SELECT * FROM table_boolean
WHERE is_available = 'no';

SELECT * FROM table_boolean
WHERE is_available = 'n';

SELECT * FROM table_boolean
WHERE is_available = '0';

SELECT * FROM table_boolean
WHERE NOT is_available;

ALTER TABLE table_boolean
ALTER COLUMN is_available
SET DEFAULT TRUE; 
/* 
	'true', 't', yes', 'y', '1'
	'false', 'f', 'no', 'n', '0'
	
	If a default value is set, even if a wrong data type is inserted,
	postgres will not throw an error. 
	Instead, it will populate with default value.
*/

/* Boolean */
/*
	TRUE		FALSE
	'true'		'false'
	't'			'f'
	'yes'		'no'
	'1'			'0'
*/

CREATE TABLE table_boolean(
	product_id SERIAL PRIMARY KEY,
	is_available BOOLEAN NOT NULL
);

INSERT INTO table_boolean(is_available) VALUES(TRUE);
INSERT INTO table_boolean(is_available) VALUES('t');
INSERT INTO table_boolean(is_available) VALUES('yes');
INSERT INTO table_boolean(is_available) VALUES('1');

INSERT INTO table_boolean(is_available) VALUES(FALSE);
INSERT INTO table_boolean(is_available) VALUES('f');
INSERT INTO table_boolean(is_available) VALUES('no');
INSERT INTO table_boolean(is_available) VALUES('0');

INSERT INTO table_boolean(is_available) VALUES('1'), ('0');

SELECT * FROM table_boolean
WHERE is_available;

SELECT * FROM table_boolean
WHERE is_available = TRUE;

SELECT * FROM table_boolean
WHERE is_available = 't';

SELECT * FROM table_boolean
WHERE is_available = 'yes';

SELECT * FROM table_boolean
WHERE is_available = 'y';

SELECT * FROM table_boolean
WHERE is_available = '1';

SELECT * FROM table_boolean
WHERE is_available = FALSE;

SELECT * FROM table_boolean
WHERE is_available = 'f';

SELECT * FROM table_boolean
WHERE is_available = 'no';

SELECT * FROM table_boolean
WHERE is_available = 'n';

SELECT * FROM table_boolean
WHERE is_available = '0';

SELECT * FROM table_boolean
WHERE NOT is_available;

ALTER TABLE table_boolean
ALTER COLUMN is_available
SET DEFAULT TRUE; 
/* 
	'true', 't', yes', 'y', '1'
	'false', 'f', 'no', 'n', '0'
	
	If a default value is set, even if a wrong data type is inserted,
	postgres will not throw an error. 
	Instead, it will populate with default value.
*/

