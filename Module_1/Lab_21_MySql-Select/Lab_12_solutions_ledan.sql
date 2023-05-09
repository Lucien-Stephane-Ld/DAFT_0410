/*
select query that joins multiple tables, to figure out what titles each author has published
at which publisehrs.
OUTPUT should have the following columns:
- author id
- last name
- first name
- title
- publisher
IF query correct, total output rows = total number of recods in Table titleauthor (
*/

use publications;

SELECT
	( titleauthor.title_id, titles.pub_id, 
	  publishers.pub_id, publishers.pub_name
      authors.au_id
      )
      
create temporary table pub