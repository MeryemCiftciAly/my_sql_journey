-- write a SQL query to list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.

SELECT id, title, production_code
FROM episodes
ORDER BY production_code ASC;

+-----+----------------------------------------+
| id  |            production_code             |
+-----+----------------------------------------+
|  25 | A Battle of Equals                     |
|  61 | A Broom Of One's Own                   |
| 125 | A Camping Conundrum                    |
|  58 | A Change of Art                        |
|  64 | A Clean Sweep                          |
|  60 | A Crinkle In Time                      |
|  11 | A Day at the Spa                       |
|  72 | A Fraction of a Chance                 |
| 118 | A Garden Grows in Botlyn               |
| 136 | A Garden is Born                       |
| 107 | A Murky Mystery in Mermaidos           |
|  47 | A Perfect Fit                          |
|  80 | A Perfect Score                        |
|  44 | A Piece of the Action                  |
| 109 | A Reboot Eve to Remember               |
| 101 | A Recipe for Chaos                     |
| 112 | A Renewable Hope                       |
| 102 | A Seedy Business                       |
|  62 | A Tikiville Turkey Day                 |
|  39 | A Time to Cook                         |
|  34 | A Whale of a Tale                      |
|  43 | A World Without Zero                   |
|  31 | All the Right Angles                   |
|  95 | An Urchin Matter                       |
|   8 | And They Counted Happily Ever After    |
| 114 | Back to Canalia's Future               |
|  53 | Balancing Act                          |
|  48 | Be Reasonable                          |
|  86 | Blowin' in the Wind Blowin in the Wind |
| 104 | Bottled Up                             |
| 132 | Buzz and the Tree                      |
|   2 | Castleblanca                           |
|  81 | Chaos as Usual                         |
| 137 | Clean-Up on Isle 8                     |
|   9 | Clock Like An Egyptian                 |
|  16 | Codename: Icky                         |
| 124 | Composting in the Clutch               |
|  14 | Cool It                                |
| 129 | Coral Grief                            |
| 106 | Creech's Creature Quandary             |
|  69 | Crystal Clear                          |
|  65 | Designing Mr. Perfect                  |
|  73 | Digit's B-Day Surprise                 |
|  35 | Double Trouble                         |
| 127 | Duck Stop                              |
|  41 | EcoHaven CSE                           |
|  66 | EcoHaven Ooze                          |
|  76 | Escape From Merlin's Maze              |
|  13 | Eureeka                                |
|  91 | Face-Off!                              |
|  87 | Father's Day                           |
|  15 | Find Those Gleamers                    |
| 100 | Fit to be Heroes                       |
|  23 | Fortress of Attitude                   |
| 117 | Giving Thanks Day                      |
|  96 | Going Solar                            |
| 122 | Hacker Hugs a Tree                     |
| 131 | Hacker's Bright Idea                   |
|  93 | Hackerized!                            |
|  29 | Harriet Hippo & the Mean Green         |
| 110 | Housewarming Party                     |
|  27 | Hugs & Witches                         |
|  70 | Inside Hacker                          |
| 111 | Invasion of the Funky Flower           |
|  79 | Jimaya Jam                             |
| 126 | Journey of a Thousand Food Miles       |
|  21 | Less Than Zero                         |
| 134 | Living in Disharmony                   |
|   1 | Lost My Marbles                        |
|  57 | Measure For Measure                    |
| 119 | Missing Bats in Sensible Flats         |
|  22 | Model Behavior                         |
|  32 | Mother's Day                           |
|  12 | Of All The Luck                        |
|  71 | On the Line                            |
|  26 | Out of Sync                            |
| 103 | Parks and Recreation                   |
|  56 | Past Perfect Prediction                |
|  92 | Peace, Love, and Hackerness            |
|  55 | Penguin Tears                          |
| 108 | Plantasaurus!                          |
|  18 | Problem Solving in Shangri-La          |
| 123 | Pursuit of the Prism of Power          |
|   3 | R-Fair City                            |
|  36 | Raising the Bar                        |
|  17 | Return to Sensible Flats               |
|  10 | Secrets of Symmetria                   |
|  19 | Send in the Clones                     |
|   5 | Sensible Flats                         |
|  51 | Shari Spotter and the Cosmic Crumpets  |
|  24 | Size Me Up                             |
|   4 | Snow Day to be Exact                   |
| 121 | Soil Turmoil                           |
| 115 | Space Waste Odyssey                    |
| 116 | Space Waste Odyssey                    |
|  89 | Spellbound                             |
|  82 | Spheres of Fears                       |
|  52 | Starlight Night                        |
|  77 | Step By Step                           |
| 130 | Sustainable by Design                  |
|  78 | Team Spirit                            |
|  94 | The Bluebird of Zappiness              |
|  42 | The Borg of the Ring                   |
|  59 | The Case of the Missing Memory         |
|  45 | The Creech Who Would be Crowned        |
|  98 | The Cyberchase Movie                   |
|  99 | The Cyberchase Movie                   |
|  88 | The Deedle Beast                       |
|  84 | The Emperor Has Snow Clothes           |
|  33 | The Eye of Rom                         |
|  67 | The Fairy Borg Father                  |
|  68 | The Flying Parallinis                  |
|  46 | The Grapes of Plath                    |
| 128 | The Great Outdoors                     |
|  38 | The Guilty Party                       |
|  90 | The Hacker's Challenge                 |
|  63 | The Halloween Howl                     |
|  54 | The Icky Factor                        |
| 133 | The Lilting Loons                      |
| 113 | The Migration Situation                |
|   7 | The Poddleville Case                   |
|  49 | The Snelfu Snafu                       |
|  50 | The Snelfu Snafu                       |
|  37 | The Wedding Scammer                    |
|  85 | The X-Factor                           |
|  28 | Totally Rad                            |
|  20 | Trading Places                         |
| 135 | Traffic Trouble                        |
|  97 | Trash Creep                            |
| 140 | Trees, Please                          |
|  40 | Trick or Treat                         |
|  30 | True Colors                            |
|  75 | Unhappily Ever After                   |
| 120 | Water Woes                             |
| 105 | Watts of Halloween Trouble             |
|  83 | Weather Watchers Gone With The Fog     |
| 138 | Weather or Not                         |
| 139 | Weather or Not                         |
|  74 | When Penguins Fly                      |
|   6 | Zeus on the Loose                      |
+-----+----------------------------------------+
