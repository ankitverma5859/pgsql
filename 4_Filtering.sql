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
		
/*
  __How to limit the number of results with FETCH?
  Syntax:   SELECT <ColumnName>, <ColumnName>, ...
	    FROM <TableName>
	    FETCH <FIRST/NEXT> <RowCount> <ROW/ROWS> ONLY;
  Remarks:  FETCH has same functionality as LIMIT.	    
  Example:  
*/
		/* Get the first row of movie table */
		SELECT * 
		FROM movies
		FETCH FIRST 1 ROW ONLY;
		
		SELECT * 
		FROM movies
		FETCH FIRST ROW ONLY; /* If only one row is to be retrieved, it can be optional */
		
		/* Get the first five row of movie table */
		SELECT * 
		FROM movies
		FETCH FIRST 5 ROW ONLY;
		
		SELECT * 
		FROM movies
		FETCH FIRST 5 ROW ONLY;
		
		/* Get first five biggest movies by movie length */
		SELECT * 
		FROM movies
		ORDER BY movie_length DESC 
		FETCH FIRST 5 ROWS ONLY;
		
		/*top 5 oldest american directors*/
		SELECT *
		FROM directors
		ORDER BY date_of_birth
		FETCH FIRST 5 ROWS ONLY;

		/*top 5 yongest female actors*/
		SELECT * 
		FROM actors
		WHERE gender = 'F'
		ORDER BY date_of_birth DESC
		FETCH FIRST 5 ROWS ONLY;

		/*first 5 movies from the 5th record onwards by long movie length*/
		SELECT *
		FROM movies
		ORDER BY movie_length DESC
		FETCH FIRST 5 ROWS ONLY
		OFFSET 5;
		
		/* Offset can be used before the FETCH as well. */
		SELECT *
		FROM movies
		ORDER BY movie_length DESC
		OFFSET 5
		FETCH FIRST 5 ROWS ONLY;
		
/*
  __How to use IN and NOT IN operators?
  Syntax:   SELECT <ColumnName>, <ColumnName>, ...
	    FROM <TableName>
	    WHERE
	    	<ColumnName> IN/NOT IN (value1, value2 ...)
	    IN and NOT IN returns either true/false	    
  Example:  
*/

		SELECT * 
		FROM movies
		WHERE 
			movie_lang = 'English' OR
			movie_lang = 'Chinese' OR
			movie_lang = 'Japanese'
		ORDER BY movie_lang;

		/*  The above query can be simplified as below. */
		SELECT * 
		FROM movies
		WHERE 
			movie_lang IN ('English', 'Chinese', 'Japanese')
		ORDER BY movie_lang;

		/* Select movies which have age_certificate as 12 or PG */
		SELECT *
		FROM movies
		WHERE 
			age_certificate IN ('12', 'PG')
		ORDER BY age_certificate;

		/* Select movies which was not directed by directors 13 or 10 */
		SELECT * 
		FROM movies
		WHERE
			director_id NOT IN (13, 10)
		ORDER BY director_id;

		SELECT *
		FROM actors;

		/* Select all the actors whose actor id is not 1,2,3,4 */
		SELECT *
		FROM actors
		WHERE actor_id NOT IN (1, 2, 3, 4)
		ORDER BY actor_id;
		
/*
  __How to use BETWEEN and NOT BETWEEN operators?
  Syntax:   SELECT <ColumnName>, <ColumnName>, ...
	    FROM <TableName>
	    WHERE
	    	<ColumnName> BETWEEN/NOT BETWEEN <LowValue> AND <HighValue>
	    IN and NOT IN returns either true/false	    
  Example:  
*/
		/* Get all actors whose data of birth is between 1991 to 1995*/
		SELECT *
		FROM actors
		WHERE 
			date_of_birth BETWEEN '1991-01-01' AND '1995-12-31'
		ORDER BY date_of_birth;

		/* Get all movies released between 1998 and 2002 */
		SELECT *
		FROM movies
		WHERE
			release_date BETWEEN '1998-01-01' AND '2002-12-31'
		ORDER BY release_date;

		/* Get all movies whose revenue is between 100 and 300 */
		SELECT * 
		FROM movies_revenues
		WHERE
			revenues_domestic BETWEEN 100 and 300
		ORDER BY revenues_domestic;

		/* Get all the movies whose movie length is between 100 and 200 */
		SELECT * 
		FROM movies 
		WHERE
			movie_length BETWEEN 100 AND 200
		ORDER BY movie_length;

		/* Get all the movies whose movie length is not between 100 and 200 */
		SELECT * 
		FROM movies 
		WHERE
			movie_length NOT BETWEEN 100 AND 200
		ORDER BY movie_length;

		/* BETWEEN is more readable tha might be faster than >= and <= combination*/
		SELECT * 
		FROM movies 
		WHERE
			movie_length >= 100 AND movie_length <= 200
		ORDER BY movie_length;
		

/*
  __How to use LIKE and ILIKE operators?
  Syntax:   SELECT <ColumnName>, <ColumnName>, ...
	    FROM <TableName>
	    WHERE
	    	<ColumnName> 
	    LIKE and ILIKE returns either true/false	
  Remarks:  Used during pattern matching
  	    Both operators let you search for matterns in string using two special charactes.
	    1) % matches any sequesnce of zero or more characters
	    2) _ matches any single character
	       __ matches any two character	    
  Example:  
*/	
		SELECT 'hello' LIKE 'hello'; /* Returns true */

		SELECT 'hello' LIKE 'h%'; /* Returns true */

		SELECT 'hello' LIKE '%e%'; /* Returns true */

		SELECT 'hello' LIKE 'hell%'; /* Returns true */

		SELECT 'hello' LIKE '%ll'; /* Returns false */

		SELECT 'hello' LIKE '_ello';  /* Returns true */

		SELECT 'hello' LIKE '__ll_';  /* Returns true */

		SELECT 'hello' LIKE '%ll_';  /* Returns true */

		/* Get all actors whose first name starts with A*/
		SELECT *
		FROM actors
		WHERE
			first_name LIKE 'A%'
		ORDER BY first_name;

		/* Get all actors whose last name ends with a */
		SELECT *
		FROM actors 
		WHERE 
			last_name LIKE '%a'
		ORDER BY last_name;

		/* Get all actors whose first_name has 5 characters only */
		SELECT *
		FROM actors
		WHERE
			first_name LIKE '_____'
		ORDER BY first_name;

		/* Get all actor names whose first name has l at second place */
		SELECT * 
		FROM actors 
		WHERE
			first_name LIKE '_l%'
		ORDER BY first_name;
		
		/* 
			Is like case-sensitive?
			YES.
			
			What can i do to query for pattern matching for case-insensitive?
			Use ILIKE instead of LIKE.
		*/
		
/*
  __How to use IS NULL and IS NOT NULL operators?
  Syntax:   SELECT <ColumnName>, <ColumnName>, ...
	    FROM <TableName>
	    WHERE
	    	<ColumnName> IS NULL/IS NOT NULL
	    
  Remarks: NULL means missing information or not applicable.
           Returns true or false.
  	   IS NULL in WHERE clause would return only values that were null.
	   IS NOT NULL would return only values that were not null.
  Example:  
*/
/* Find list of actors with missing birth date*/
		SELECT * 
		FROM actors
		WHERE
			date_of_birth IS NULL
		ORDER BY date_of_birth;

		/* Find list of actors with missing birth date or missing first name */
		SELECT * 
		FROM actors
		WHERE
			date_of_birth IS NULL OR 
			first_name IS NULL
		ORDER BY date_of_birth;

		/* Get list of movies where domestic revenues is NULL */
		SELECT *
		FROM movies_revenues
		WHERE 
			revenues_domestic IS NULL;

		/* Get list of movies where domestic or internation movies are null */
		SELECT *
		FROM movies_revenues
		WHERE
			revenues_domestic IS NULL OR
			revenues_international IS NULL;

		/* moves where domestic reveneus are not null. */
		SELECT *
		FROM movies_revenues
		WHERE
			revenues_domestic IS NOT NULL;
		
