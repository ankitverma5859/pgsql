/* 
Operators
			
Comparison Operators:
	1. Equal To 					=
	2. Greater Than					>
	3. Less Than					<
	4. Greater Than or Equal To		>=
	5. Less Than or Equal To		<=
	6. Not Equal To					!=
	
Logical Operators
	1. AND
	2. OR
	3. LIKE
	4. IN
	5. BETWEEN
	
ARITHMETIC 
	1. +
	2. _ 
	3. /
	4. *
	5. % (modulas) 
*/

  
/*
  __How to filter with WHERE clause?
  Syntax:   SELECT * 
  	    FROM <TableName>
	    WHERE <ColumnName> = 'value'    //value should always be in single quotes
  Example:  
*/
	 SELECT * 
	 FROM movies
	 WHERE movie_lang = 'English'; 

	 /* Using AND operator */
	 SELECT * 
	 FROM movies
	 WHERE 
		movie_lang = 'English' AND age_certificate = '18';

	 /* Using OR operator */
	 SELECT * 
	 FROM movies
	 WHERE 
		movie_lang = 'English' OR age_certificate = '18';

	 SELECT * 
	 FROM movies
	 WHERE 
		movie_lang = 'English' OR movie_lang = 'Chinese'
	ORDER BY movie_lang;

	/* 
		Combining AND and OR operators 
		Order of Operators and parenthesis matters.
	*/
	SELECT * 
	FROM movies
	WHERE
		(movie_lang = 'English' OR movie_lang = 'Chinese') AND age_certificate = '12'
	ORDER BY movie_lang;

	/*
		Can we use WHERE before FROM?
		NO. It will throw error.

		Can we use WHERE after ORDER BY?
		NO. It will throw error.

		WHERE can only be used before ORDER BY and after FROM.
	*/
		 
		 
