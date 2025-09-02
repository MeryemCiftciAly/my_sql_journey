
# Data Warehouse Naming Conventions

## Table Naming Convention

- **Format**: **lowercase_with_underscores**
    - Example: **customer_details, sales_data, order_transactions**
- **Prefixes for Metadata**:
    - **Columns added by the engineer** should be prefixed with **meta_** to distinguish them from the original dataset columns.
    - Example: **meta_creation_date, meta_updated_by**

## Column Naming Convention

- **Format**: **lowercase_with_underscores**
    - Example: **first_name**, **transaction_amount**, **order_date**
- **Date and Time**: Use **date** or **datetime** at the end of the column name.
    - Example: **order_date**, **last_updated_datetime**
- **Numerical Values**: Use **_count** for counts, and **_amount** for monetary values.
    - Example: **order_count**, **total_sales_amount**

## Acronyms

When using acronyms in column names, the full term should be listed in this section for clarity.

- **CUST**: Customer
- **ORDR**: Order
- **PRD**: Product
- **TXN**: Transaction
- **LTV**: Lifetime Value
- **INFO:** Information
- **LOC:** Location
- **CAT:** Category

## Metadata Columns

Metadata columns are added by the data engineer and should include information such as the date of data insertion, updates, and the user performing the action.

- **meta_creation_date**: Date the record was created.
- **meta_update_date**: Date the record was last updated.
- **meta_updated_by**: User who last updated the record.
- **meta_source**: Where the data was sourced from (e.g., data import, CRM).
