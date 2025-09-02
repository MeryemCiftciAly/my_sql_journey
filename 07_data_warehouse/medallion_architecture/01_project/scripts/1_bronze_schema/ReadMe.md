## Customer Info Loading Process into the BRONZE Layer

### Overview
This project demonstrates the Medallion Method for data processing. Specifically, the goal is to load raw data into the BRONZE layer of the data warehouse without any transformation or cleaning. 
The BRONZE layer stores the raw, unmodified data exactly as it is received from the source.

**Challenges Encountered**
--secure-file-priv Restriction
When attempting to use the LOAD DATA INFILE command to load the CustomerInfo dataset into MySQL, I encountered the Error Code: 1290 related to the --secure-file-priv option.
This restriction prevented MySQL from accessing files outside a specified directory.

**Solution:**
By identifying the correct path for the file and ensuring that it was within the allowed directory (C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/), I was able to overcome this issue.

**Incorrect Date Format**

**Solution:**
To maintain the integrity of the BRONZE layer (which should remain untouched), I avoided performing any data transformations or cleaning.
Instead, I used the MySQL Data Import Wizard, which allowed me to load the dataset without modifying the date format.
This approach ensures that the data in the BRONZE layer remains raw, as per the Medallion Method.

## Code Explanation
```sql
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cust_info.csv'
INTO TABLE datawarehouse.bronze_crm_cst_inf0
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS; -- Skips the header row
```

This code would have been used to load the data into the bronze_crm_cst_inf0 table. 
Due to the restrictions and data format issues mentioned, I used the Data Import Wizard to load the data in its raw form.

**Conclusion**
By using the Data Import Wizard for this step, I adhered to the Medallion Method, which dictates that the BRONZE layer should remain in its raw, untransformed state.
This approach also allowed me to bypass the formatting issues with the cst_create_date field, while ensuring the data remained consistent with the Medallion Method's principles.

#### Why didn't you just transform the data and make it acceptable in the right format?

The reason I didn't transform the data before loading it into the BRONZE layer is because of the Medallion Method approach, which emphasizes maintaining data integrity and preserving raw data.
The BRONZE layer is specifically intended to store the data exactly as it is received from the source, without any modifications or transformations. 
This allows for traceability and the ability to audit or revisit the original raw data if needed later in the process.

Transforming the data at the BRONZE layer would go against this principle. 
By applying any transformations or cleaning to the data at this stage, we would risk losing the true, unaltered state of the data, which could be critical for future analysis or debugging.

To handle the issue with the cst_create_date field format, I used the Data Import Wizard because it allows me to load the data as-is, while avoiding any transformation. This way, the raw data is preserved in its original state, and any necessary transformations can take place in subsequent layers (e.g., in the SILVER or GOLD layers) where data cleaning and enrichment are appropriate.
