--Select all the authors that write more than an average of 150,000 words per book. 

SELECT 
  author, AVG(words) AS avg_words
FROM 
  books
GROUP BY 
  author
HAVING
  AVG(words) > 150000
--=====================================================================================--
--Find the top 3 authors by book count.
  
SELECT 
  author, 
  COUNT(id) AS total_books
FROM 
  books
GROUP BY
  author
ORDER BY 
  total_books DESC
lIMIT 3;
