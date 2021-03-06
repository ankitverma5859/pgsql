/*
  __How to select all data/columns from a Table?
  Syntax:   SELECT * FROM <TableName>
  Example:  
*/
        /* 
            Table Name is case-insensitive. 
            SQL keywords like SELECT, FROM, etc are also case-insensitive.
            In the below query, FROM clause is executed first i.e before the SELECT clause.
        */
        
        SELECT * 
        FROM movies;

/*
  __How to select particular columns from a Table?
  Syntax:   SELECT <ColumnName>, <ColumnName> ... FROM <TableName>
  Example:  
*/
        SELECT movie_id, movie_name 
        FROM movies;
        
/*
  __How to use Aliases?
  Aliases are used to give better readability to the column names.
  Syntax:   SELECT 
              <ColumnName> AS <AliasName>, 
              <ColumnName> AS <AliasName>, 
              ... 
            FROM <TableName>
  Example:  
*/     
        SELECT 
          first_name AS "FirstName"
        FROM actors;
        
        SELECT 
          movie_name AS "Movie Name",
          movie_lang AS "Language"
        FROM movies;
        
        /* AS is a optional keyword for the query, but its recommended to use AS for readability. */
        SELECT 
          movie_name "Movie Name",
          movie_lang "Language"
        FROM movies;

/*
  __How to combine two columns as one for display?
  Syntax:   SELECT 
              <ColumnName> || <ColumnName> 
            FROM <TableName>
  Example:  
*/         
        SELECT 
          first_name || last_name
        FROM actors;
        
        /* For better readability we can also add an space between the two columns values */
        SELECT 
          first_name || ' ' || last_name
        FROM actors;
        
        /* Add an Alias to make it even better */
        SELECT 
          first_name || ' ' || last_name AS "Full Name"
        FROM actors;
        
        /* 
            Can we evaluate expressions?
            Yes!
        */
        
        SELECT 2 * 20;
        /* 40 */
        
        SELECT 20 / 2;
        /* 10 */
        
/*
  __How to display sorted results?
  Syntax:   SELECT * 
            FROM <TableName>
            ORDER BY
              sort_expression [ASC | DESC]
              ...
  Example:  
*/       
          SELECT 
            *
          FROM movies
          ORDER BY
            release_date ASC;
            
          /* By default db will sort in ascending order. */  
          SELECT 
            *
          FROM movies
          ORDER BY
            release_date;
            
          SELECT 
            *
          FROM movies
          ORDER BY
            release_date DESC;
            
          /* Sorting using multiple columns. */
          SELECT 
            *
          FROM movies
          ORDER BY
            movie_name ASC,
            release_date DESC;
            
          /* Aliases can also be used as sort expressions. */
          SELECT 
            first_name,
            last_name AS surname
          FROM actors
          ORDER BY surname;  /* surname alias is used for the sort expression. */
          
          /* An example to sort based upon the length of the column value. */
          SELECT 
            first_name,
            LENGTH(first_name) as len
          FROM actors
          ORDER BY
            len DESC;
            
          /* How to use column numbers instead of column name in ORDER BY */
          SELECT 
            first_name,             /* 1 */
            last_name,              /* 2 */
            date_of_birth           /* 3 */
          FROM actors
          ORDER BY
            1 ASC,
            3 DESC;
            
          /* Sorting NULL values */
          CREATE TABLE demo_sorting (
            num INT
          );

          INSERT INTO demo_sorting (num)
          VALUES
            (1),
            (2),
            (3),
            (NULL);
            
           /* By default for ASC, NULL values will be at the end. */ 
           SELECT *
           FROM demo_sorting
           ORDER BY
             num ASC;
             
           /* To keep the NULLs at the top with ASC. */  
           SELECT *
           FROM demo_sorting
           ORDER BY
             num ASC NULLS LAST;
             
           /*By default for DESC, NULL values will be at the top.*/  
           SELECT *
           FROM demo_sorting
           ORDER BY
             num DESC;
             
           /* To keep the NULL values at the end with DESC. */  
           SELECT *
           FROM demo_sorting
           ORDER BY
             num DESC NULLS LAST;
             
          /* Filtering out distinct values with select  */
          SELECT DISTINCT movie_lang
          FROM movies
          ORDER BY movie_lang;
          
          /* Filtering out distinst rows with select */
          SELECT 
            DISTINCT *
          FROM movies
          ORDER BY movie_lang;
          
          
        
        
