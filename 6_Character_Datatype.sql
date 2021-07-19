/*
Character Type						Remark
CHARACTER(n), CHAR(n)				fixed-length, blank padded
CHARACTER VARYING(n), VARCHAR(n)	variable length with length limit
TEXT, VARCHAR						variable unlimited length(postgres mentions it can store 
																about 1gb of data)

## If n is the number of characters a column holds, and if no value is specified,
	then default is 1.
	
## If the excessive characters are all spaces, postgres truncates the spaces to 
	maximum length n.
	
CHARACTER(10) / CHAR(10)
	char(10) will store 10 character length.
	However, if you insert insufficient characters, postgres will pad the column 
	with extra spaces.
*/

/*  Pads he remaining n with spaces. */
SELECT CAST('ANKIT' as CHARACTER(10)) AS Name;
SELECT 'ANKIT'::CHARACTER(10) AS Name;

/* No padding with spaces. */
SELECT CAST('ANKIT' as VARCHAR(10)) AS Name;

/* No padding with spaces. */
SELECT CAST('ANKIT' as TEXT) AS Name;

/*
VARCHAR is stored inline with the table (at least for the MyISAM storage engine), making it potentially faster when the size is reasonable.
Of course, how much faster depends on both your data and your hardware. Meanwhile, TEXT is stored off table with the table having a pointer 
to the location of the actual storage.
Using a TEXT column in a sort will require the use of a disk-based temporary table, as the MEMORY (HEAP) storage engine.
*/
