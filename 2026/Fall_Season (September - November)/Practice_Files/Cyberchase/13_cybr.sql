--Find the topic and production code for Season 1 episodes that aired between January 10 and January 20, 2002, inclusive.

SELECT topic, production_code
FROM episodes
WHERE season = 1
 AND air_date BETWEEN '2002-01-10' AND '2002-01-20';

+----------------------------------+-----------------+
|              topic               | production_code |
+----------------------------------+-----------------+
| Navigation                       | CYB001          |
| Data Collection and Analysis     | CYB010          |
| Probability and chance           | CYB004          |
| Estimation                       | CYB007          |
| Area                             | CYB005          |
| Fractions                        | CYB002          |
| Patterns                         | CYB006          |
| Number, Operations, and Counting | CYB003          |
| Time Keeping                     | CYB009          |
+----------------------------------+-----------------+
