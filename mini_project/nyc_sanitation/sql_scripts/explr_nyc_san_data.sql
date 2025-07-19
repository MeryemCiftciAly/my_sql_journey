-- Checking cleaned dataset

SELECT * FROM cleaned_sanitation_data
LIMIT 10;

-- separating the year and month

SELECT month AS original_month,
SUBSTRING(month FROM 1 FOR 4) AS year,
SUBSTRING(month from 8 for 2) AS month
FROM sanitation_data;

-- Checking the distribution of years in dataset

SELECT DISTINCT(SUBSTRING(month FROM 1 FOR 4)) AS year
FROM cleaned_sanitation_data
ORDER BY year DESC;

-- Checking to see the row count

SELECT COUNT(*) FROM cleaned_sanitation_data;

--Checking the schema of the dataset

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'cleaned_sanitation_data';

-- Checking how many records in the month

SELECT month, COUNT(*) AS monthly_records
FROM cleaned_sanitation_data
GROUP BY month
ORDER BY monthly_records DESC;


--Checking which borough has maximum refuse tonnage waste

SELECT 
borough,
month,
sum(refuse_tons_collected) AS total_refuse,
sum(paper_tons_collected) AS total_paper,
sum(mgp_tons_collected) AS mgp_tons_paper,
sum(res_organics_tons) AS res_organics_tons,
sum(school_organic_tons) AS school_organictons
FROM cleaned_sanitation_data
GROUP BY borough, month
ORDER BY total_refuse DESC -- This sort is only being applied to the first column
LIMIT 100;

