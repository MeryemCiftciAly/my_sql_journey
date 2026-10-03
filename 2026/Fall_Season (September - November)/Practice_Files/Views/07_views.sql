-- Write a SQL query to list the English titles of the 5 brightest prints by Hiroshige, from most to least bright.
SELECT english_title
FROM views
WHERE artist = 'Hiroshige'
ORDER BY brightness DESC
Limit 5;

|                   english_title                    |
+----------------------------------------------------+
| The Sea off the Miura Peninsula in Sagami Province |
| Futami Bay in Ise Province                         |
| The Sumida Embankment in the Eastern Capital       |
| Sukiyagashi in the Eastern Capital                 |
| Cherry Blossoms at Honmoku in Musashi Province     |
+----------------------------------------------------+
