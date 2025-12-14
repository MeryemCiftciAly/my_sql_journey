###--Select all the authors that write more than an average of 150,000 words per book. 

SELECT 
  author, AVG(words) AS avg_words
FROM 
  books
GROUP BY 
  author
HAVING
  AVG(words) > 150000
