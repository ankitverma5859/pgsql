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

        
        
