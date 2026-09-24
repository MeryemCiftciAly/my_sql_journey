--Write a query to find the titles of episodes that do not yet have a listed topic.

SELECT title,
       'No topic listed' AS topic_status
FROM episodes
WHERE topic IS NULL;


+----------------------------------+-----------------+
|              title               |  topic_status   |
+----------------------------------+-----------------+
| Space Waste Odyssey              | No Topic Listed |
| Space Waste Odyssey              | No Topic Listed |
| Giving Thanks Day                | No Topic Listed |
| A Garden Grows in Botlyn         | No Topic Listed |
| Missing Bats in Sensible Flats   | No Topic Listed |
| Water Woes                       | No Topic Listed |
| Soil Turmoil                     | No Topic Listed |
| Hacker Hugs a Tree               | No Topic Listed |
| Pursuit of the Prism of Power    | No Topic Listed |
| Composting in the Clutch         | No Topic Listed |
| A Camping Conundrum              | No Topic Listed |
| Journey of a Thousand Food Miles | No Topic Listed |
| Duck Stop                        | No Topic Listed |
| The Great Outdoors               | No Topic Listed |
| Coral Grief                      | No Topic Listed |
| Sustainable by Design            | No Topic Listed |
| Hacker's Bright Idea             | No Topic Listed |
| Buzz and the Tree                | No Topic Listed |
| The Lilting Loons                | No Topic Listed |
| Living in Disharmony             | No Topic Listed |
| Traffic Trouble                  | No Topic Listed |
| A Garden is Born                 | No Topic Listed |
| Clean-Up on Isle 8               | No Topic Listed |
| Weather or Not                   | No Topic Listed |
| Weather or Not                   | No Topic Listed |
| Trees, Please                    | No Topic Listed |
+----------------------------------+-----------------+
