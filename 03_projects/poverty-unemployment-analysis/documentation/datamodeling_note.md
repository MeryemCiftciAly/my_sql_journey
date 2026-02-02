## Silver to Gold Modeling Decision (Final)

**Silver layer objective**
The silver layer is designed for controlled transformation, validation, and modularity. Separating income from other attributes allows:

Cleaner transformations and simpler data quality checks

Easier debugging and reconciliation against source data

**Gold layer objective**
The gold layer is designed for analytics consumption and performance, with Tableau as the primary consumer. At this stage:

Income is recombined with domain-specific attributes

Tableau users work with one fact table per subject area

Downstream joins are eliminated

Filtering and aggregation are simpler and more performant

**Final decision**

Income remains separate in silver for transformation discipline, and is merged in gold for analytical usability and visualization efficiency.
