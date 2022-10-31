/* 
      INNER JOIN : All common columns defined at ON must match values on both the tables.
      Syntax:
              SELECT
                table1.col1,
                table2.col2
              FROM table1
              INNER JOIN table2 ON table1.col1 = table2.col2;
*/

SELECT 
	movies.movie_id,
	movies.movie_name,
	directors.first_name,
	directors.last_name
FROM movies
INNER JOIN directors 
ON movies.director_id = directors.director_id;


/* Using Alias to make the query look simpler */
SELECT 
	mv.movie_id,
	mv.movie_name,
	d.first_name,
	d.last_name
FROM movies mv
INNER JOIN directors d
ON mv.director_id = d.director_id;

/* An example to demonstrate WHERE clause. */
SELECT 
	mv.movie_id,
	mv.movie_name,
	mv.movie_lang,
	d.first_name,
	d.last_name
FROM movies mv
INNER JOIN directors d
ON mv.director_id = d.director_id
WHERE mv.movie_lang = 'English';

SELECT 
	mv.movie_id,
	mv.movie_name,
	mv.movie_lang,
	d.first_name,
	d.last_name
FROM movies mv
INNER JOIN directors d
ON mv.director_id = d.director_id
WHERE mv.movie_lang = 'English' AND d.director_id = 3;

/* When all columns are required table.* */
SELECT 
	mv.*,
	d.*
FROM movies mv
INNER JOIN directors d
ON mv.director_id = d.director_id;

/* When both tables have same column names we can use USING as well */
SELECT *
FROM movies
INNER JOIN directors USING(director_id); /* USING(director_id) is same as movies.director_id = directors.director_id */

SELECT * 
FROM movies
INNER JOIN movies_revenue
ON movies.movie_id = movies_revenue.movie_id;

SELECT *
FROM movies
INNER JOIN movies_revenue 
USING(movie_id);

/* Can we connect more than two tables? */
SELECT *
FROM movies
INNER JOIN directors USING(director_id)             /* Notice the common col */
INNER JOIN movies_revenue USING(movie_id);           /* Notice the common col */

/* Select movie name, director name, and domestic revenue for all the Japanese movies. */
SELECT
	movies.movie_name,
	directors.first_name,
	movies_revenue.revenues_domestic
FROM movies
INNER JOIN directors USING(director_id)
INNER JOIN movies_revenue USING(movie_id)
WHERE movies.movie_lang = 'Japanese';

SELECT 
	mv.movie_name,
	d.first_name,
	d.last_name,
	mr.revenues_domestic
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id
INNER JOIN movies_revenue mr ON mv.movie_id = mr.movie_id
WHERE mv.movie_lang IN ('English', 'Chinese', 'Japanese')
AND mr.revenues_domestic > 100;

SELECT 
	mv.movie_name,
	
	d.first_name,
	d.last_name,
	
	mr.revenues_domestic
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id
INNER JOIN movies_revenue mr ON mv.movie_id = mr.movie_id
WHERE mv.movie_lang IN ('English', 'Chinese', 'Japanese')
AND mr.revenues_domestic > 100
ORDER BY 4 desc; /* Here 4 means 4th column i.e domestic revenue */

-- Select movie name, director name, and total revenue of all top 5 movies;
SELECT 
	mv.movie_name,
	d.first_name,
	d.last_name,
	mr.revenues_domestic,
	mr.revenues_international,
	(mr.revenues_domestic + mr.revenues_international) as "revenue"
FROM movies mv
INNER JOIN directors d USING(director_id)
INNER JOIN movies_revenue mr USING(movie_id)
ORDER BY revenue DESC NULLS LAST
LIMIT 5;


/* Top 10 movies between 2005 and 2008 */
SELECT 
	mv.movie_name,
	mv.release_date,
	d.first_name,
	d.last_name,
	(mr.revenues_domestic + mr.revenues_international) as "revenue"
FROM movies mv 
INNER JOIN directors d USING(director_id)
INNER JOIN movies_revenue mr USING(movie_id)
WHERE mv.release_date BETWEEN '2006-01-01' and '2008-12-31'
ORDER BY revenue DESC NULLS LAST
LIMIT 10;

/* How to join on columns of two different data types. */
CREATE TABLE t1 (test INT);
CREATE TABLE t2 (test VARCHAR(10));

SELECT *
FROM t1
INNER JOIN t2 
ON t1.test = CAST(t2.test AS INT) --CHECKOUT the CASTING

-- OR

SELECT *
FROM t1
INNER JOIN t2 
ON CAST(t1.test AS VARCHAR) = t2.test --CHECKOUT the CASTING



 








