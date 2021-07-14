/*
  __How to create a Database?
  Syntax:   CREATE DATABASE <Database_Name>
  Example:  
*/

            CREATE DATABASE db_test

/*
  __How to deleta a Database?
  Syntax:   DROP DATABASE <Database_Name>
  Example:  
 */
 
             DROP DATABASE db_test
 
 /*
  Remarks:  1) Only superusers and database owners can execute the DROP DATABASE statement.
*/

/*
  __How to create a Table?
  Syntax:   CREATE TABLE <TableName> (
              <ColumnName> <DataType> <KeyType>,
              <ColumnName> <DataType>
              <ColumnName> <DataType> REFERENCES <ReferenceTableName> (<ReferenceColumnName>)  /* Foreign Key Creation */
            );
  Example:  
 */
 
            CREATE TABLE actors (
              actor_id SERIAL PRIMARY KEY,
              first_name VARCHAR(150),
              last_name VARCHAR(150) NOT NULL,
              gender CHAR(1),
              date_of_birth DATE,
              add_date DATE,
              update_date
            );
            
            CREATE TABLE directors (
              director_id SERIAL PRIMARY KEY,
              first_name VARCHAR(150),
              last_name VARCHAR(150) NOT NULL,
              date_of_birth DATE,
              nationality VARCHAR(20),
              add_date DATE,
              update_date DATE
            );
            
            CREATE TABLE movies(
              movie_id SERIAL PRIMARY KEY,
              movie_name VARCHAR(100) NOT NULL,
              movie_length INT,
              movie_lang VARCHAR(20),
              age_certificate VARCHAR(10),
              release_date DATE,
              director_id INT REFERENCES directors (director_id)  /* Example of Foreign Key Creation */
            );
            
            CREATE TABLE movies_revenue (
              revenue_id SERIAL PRIMARY KEY,
              movie_id INT REFERENCES movies (movie_id),
              revenues_domestic NUMERIC(10,2),
              revenues_international NUMERIC(10,2)
            );
            
            CREATE TABLE movies_actors (
              movie_id INT REFERENCES movies (movie_id),
              actor_id INT REFERENCES actors (actor_id),
              PRIMARY KEY (movie_id, actor_id) /* Example to add multple primary keys */
            );

/*            
  Remarks:  SERIAL, datatype which increments by 1
            VARCHAR(x), datatype whose max length can be x. If the string to be stored is less than 250, db optimizes to use less storage/bytes.
            CHAR(x), datatype of fixed length
            DATE, datatype of DATE type,
            NUMERIC(x,y), datatype which stores upto 10 digits and 2 decimal places.
            add_date, column added to indicate when the row data was created,
            update_date, column added to indicate when the row data was updated
*/

/*
  __How to delete a Table?
  Syntax:   DROP TABLE <TableName>;
  Example: 
*/
            DROP TABLE roles;

