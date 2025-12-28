# Poverty and Unemployment Analysis (New York Focus)

## About This Project

This project looks at poverty and unemployment data in the United States, with a specific focus on **New York State**. The data itself covers the entire country and all 50 states, but I chose to narrow the analysis to New York in order to explore the topic in a more focused and meaningful way.

Rather than starting with a fixed question or hypothesis, this project is driven by curiosity:  
How do poverty and unemployment show up together in the data? Are they always connected? And what patterns can we observe when we look at them side by side?

---

## Data Sources and What I Had to Keep in Mind

The data used in this project comes from publicly available sources that track poverty and unemployment over time. These datasets are already calculated and structured by the original data providers, which means some decisions are baked into the data before any analysis begins.

A few important things to note:
- The datasets use different structures and levels of detail
- Many column names contain multiple pieces of information at once (such as year and category)
- The calculation methods are predefined and cannot be adjusted
- Comparisons should be interpreted carefully due to differences in how the data is reported

The limitations of the data do not prevent analysis, but they do require caution in how the results are interpreted and understood.

---

## Why Focus on New York?

While national-level data can be useful, it can also be overwhelming and harder to interpret clearly. By focusing on New York State, I was able to:
- Reduce noise in the data
- Look more closely at patterns over time
- Create clearer and more readable visualizations

This narrower scope supports deeper exploration without losing sight of the broader context.

---

## How the Data Was Prepared

The original datasets were not immediately ready for analysis or visualization. A significant portion of the work involved making the data easier to understand and work with.

Key preparation steps included:
- Translating encoded column names into human-readable labels - research and source
- Extracting year and category information from column names - Excel Power Query
- Creating lookup tables to document what each attribute represents - Excel lookup functions
- Designing a data model to organize the data logically - Excel and draw.io
- Mapping how different tables relate to each other using an ERD (Entity Relationship Diagram) - Excel and draw.io

Supporting documentation, including the ERD and data notes, is included in this repository.

---

## Tools and Approach

Different tools were used at different stages, based on what made the most sense for the task.

- **Excel** was used for initial exploration, documentation, and controlled data loading
- **SQL** was used for cleaning, transforming, and analyzing the data
- The data was prepared in stages, similar to a medallion-style approach:
  - Raw data preserved as-is
  - Cleaned and enriched data
  - Final datasets structured for analysis and visualization

SQL played a central role, both to strengthen querying skills and because it was well suited for structured transformation and analysis.

---

## What This Project Explores

This project is exploratory rather than prescriptive. It looks at patterns in the data to better understand how poverty and unemployment relate over time.

Some of the ideas explored include:
- Whether unemployment appears alongside higher poverty levels
- Whether poverty exists even among employed populations
- How these indicators move together or independently or across different periods

The focus is on observation and interpretation, not on making strong causal claims.

---

## Next Steps
Visualizing the date in Tableau

## Tools Used

- SQL (PostgreSQL-compatible)
- Microsoft Excel
- Tableau
- Draw.io

---

This project was created as a self-directed exercise to practice data preparation, SQL analysis, and visualization-ready data modeling, while exploring a topic that is personally and professionally meaningful.

