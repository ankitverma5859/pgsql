/* 
Operators
			
Comparison Operators:
	1. Equal To 					=
	2. Greater Than					>
	3. Less Than					<
	4. Greater Than or Equal To			>=   Note: you cannot use => in place of >=
	5. Less Than or Equal To			<=   Note: you cannot use =< in place of <=
	6. Not Equal To					!=   Note: you cannot use =! in place of !=
	
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
  Remarks:  Aliases(column aliases) cannot be used with WHERE clause.
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
		/*
			Order of Execution
			FROM -> 
				WHERE -> 
					SELECT -> 
						ORDER BY
		*/
		
		/* Using comparison operators on integer values. */
		SELECT *
		FROM movies
		WHERE movie_length > 104
		ORDER BY movie_length;
		
		
		SELECT *
		FROM movies
		WHERE movie_length >= 104
		ORDER BY movie_length;
		 
		SELECT *
		FROM movies
		WHERE movie_length < 104
		ORDER BY movie_length; 
		
		SELECT *
		FROM movies
		WHERE movie_length <= 104
		ORDER BY movie_length;
		
		/* 
			Using comparison operators on date values
			Before creating the query, confirm on the date format YYYY-MM-DD or DD-MM-YYYY 
		*/
		SELECT *
		FROM movies
		WHERE release_date > '1999-12-31'
		ORDER BY release_date;
		
		SELECT *
		FROM movies
		WHERE release_date < '1999-12-31'
		ORDER BY release_date;
		
		/* Using comparison operators on varchar values. */
		SELECT *
		FROM movies
		WHERE movie_lang < 'English'; /* If chinese is there in the list, it will list those as c < e. */
		
		SELECT *
		FROM movies
		WHERE movie_lang <> 'English'  /* <> means not equals to */
		ORDER BY movie_lang;
		
		SELECT *
		FROM movies
		WHERE movie_lang != 'English'
		ORDER BY movie_lang;
		/*
			Please note that integer values do not require single quotes while date and varchar do.
		*/
		
/*
  __How to limit the number of results?
  Syntax:   SELECT <ColumnName>, <ColumnName>, ...
	    FROM <TableName>
	    ORDER BY <ColumnName>
	    LIMIT <number>
  Example:  
*/	
		/* Get top 5 movies by movie length */
		SELECT * 
		FROM movies
		ORDER BY movie_length DESC
		LIMIT 5;
		
		/* Get top 5 oldest american directors. */
		SELECT *
		FROM directors
		WHERE nationality = 'American'
		ORDER BY date_of_birth
		LIMIT 5;
		
		/* Get top 5 youngest american directors. */
		SELECT *
		FROM directors
		WHERE nationality = 'American'
		ORDER BY date_of_birth DESC
		LIMIT 5;
		
		/* Get top 10 youngest female actors. */
		SELECT * 
		FROM actors
		WHERE gender = 'F'
		ORDER BY date_of_birth DESC 
		LIMIT 10;
		
		/* Get top 10 most profitable domestic movies. */
		SELECT * 
		FROM movies_revenues
		ORDER BY revenues_domestic DESC NULLS LAST
		LIMIT 10;
		
		/* Get top 10 least profitable domestic movies. */
		SELECT * 
		FROM movies_revenues
		ORDER BY revenues_domestic 
		LIMIT 10;
		
		/* Get first 5 movies excluding the first four. */
		SELECT *
		FROM movies
		ORDER BY movie_id
		LIMIT 5 OFFSET 4;  /* OFFSET excludes first four rows. */
		
		/* List all top 5 movies after the top 5 highest domestic profits movies. */
		SELECT *
		FROM movies_revenues
		ORDER BY revenues_domestic DESC NULLS LAST
		LIMIT 5 OFFSET 5;
		
		
		
