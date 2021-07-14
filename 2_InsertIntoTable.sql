/*
  __How to insert data in a Table?
  Syntax:   INSERT INTO <TableName> (<ColumnName>, ColumnName>,...)
            VALUES (value1, value2, ...)
  Example:  
 */
            CREATE TABLE customers (
              customer_id SERIAL PRIMARY KEY,
              first_name VARCHAR(50),
              last_name VARCHAR(50),
              email VARCHAR(150),
              age INT
            );
            
            INSERT INTO customers (first_name, last_name, email, age)
            VALUES ('ankit', 'verma', 'ankit.verma5859@gmail.com', 25);
            
            SELECT * FROM customers;
            
            /* Inserting multiple data with one query.  */
            INSERT INTO customers (first_name, last_name, email, age)
            VALUES 
            ('fname_1', 'lname_1', 'fname1@gmail.com', 25),
            ('fname_2', 'lname_2', 'fname2@gmail.com', 23),
            ('fname_3', 'lname_3', 'fname3@gmail.com', 26),
            ('fname_4', 'lname_4', 'fname4@gmail.com', 27);
            
            SELECT * FROM customers;
            
            /* When you want to store data such as Rock'O 'before the O needs to be wrapped with another ' inorder to insert this kind of data. */
            INSERT INTO customers (first_name)
            VALUES
            ('Rock''O Sullivan')  
            
            INSERT INTO customers (first_name)
            VALUES ('James') RETURNING *;   /* RETURNING * returns all the columns for the inserted data. */
            
            INSERT INTO customers (first_name)
            VALUES ('Jackky') RETURNING customer_id; /* You can also specify the column name to be returned when the operation is successfull. */
            
            
            
            
            
            
