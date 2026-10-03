--Write a SQL query to list the English titles of the 5 prints with the least contrast by Hokusai, from least to highest contrast.

SELECT english_title
FROM views
WHERE artist = 'Hokusai'
ORDER BY contrast ASC
LIMIT 5;

                            english_title                                   |
+----------------------------------------------------------------------------------+
| Mount Fuji reflects in Lake Kawaguchi, seen from the Misaka Pass in Kai Province |
| Kajikazawa in Kai Province                                                       |
| Shimomeguro                                                                      |
| Bay of Noboto                                                                    |
| Ushibori in Hitachi Province                                                     |
+----------------------------------------------------------------------------------+
