/*
CHALLENGE 1:
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
    a.au_id as Author_ID,
	a.au_fname as First_Name,
	a.au_lname as Last_Name,
    t.title as Title,
    p.pub_name as Publisher
FROM authors a
INNER JOIN titleauthor ta using (au_id)
INNER JOIN titles t using (title_id)
INNER JOIN publishers p using (pub_id)
;

/*
CHALLENGE 2:
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.

To check if your output is correct, sum up the TITLE COUNT column.
The sum number should be the same as the total number of records in Table titleauthor.

Hint: In order to count the number of titles published by an author, you need to use MySQL COUNT.
Also check out MySQL Group By because you will count the rows of different groups of data.
Refer to the references and learn by yourself.
These features will be formally discussed in the Temp Tables and Subqueries lesson.
*/

SELECT
    a.au_id as Author_ID,
	a.au_fname as First_Name,
	a.au_lname as Last_Name,
    p.pub_name as Publisher,
    count(t.title) as Title_Count
FROM authors a
	INNER JOIN titleauthor ta using (au_id)
	INNER JOIN titles t using (title_id)
	INNER JOIN publishers p using (pub_id)
group by a.au_id, p.pub_id
order by count(t.title) desc
;



/*
CHALLENGE 3:
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.
*/

SELECT
    a.au_id as Author_ID,
	a.au_fname as First_Name,
	a.au_lname as Last_Name,
    sum(s.qty)
FROM authors a
	INNER JOIN titleauthor ta using (au_id)
	INNER JOIN sales s using (title_id)
group by a.au_id
order by sum(s.qty) desc
limit 3
;

/*
Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors
instead of the top 3.
Note that the authors who have sold 0 titles should also appear in your output
(ideally display 0 instead of NULL as the TOTAL).
Also order your results based on TOTAL from high to low.
*/

SELECT
    a.au_id as Author_ID,
	a.au_fname as First_Name,
	a.au_lname as Last_Name,
    coalesce(sum(s.qty),0) as Total
FROM authors a
	left JOIN titleauthor ta using (au_id)
	left JOIN sales s using (title_id)
group by a.au_id
order by sum(s.qty) desc
;

