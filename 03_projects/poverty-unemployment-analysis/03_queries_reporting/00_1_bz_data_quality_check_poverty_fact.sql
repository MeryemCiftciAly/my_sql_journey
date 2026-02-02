/*=======================================================
     Poverty Dataset - Bronze Layer Data Quality Checks 
==========================================================*/

--Space Check: Trimming the columns to remove the trailing and leading white spaces

SELECT 
	LENGTH(stateabbrv) AS original_length,
	LENGTH(TRIM(stateabbrv)) AS trimmed_length,
	LENGTH(attribute) AS original_attribute,
	LENGTH(TRIM(attribute)) AS trimmed_attribute,
	LENGTH(county) AS original_county,
	LENGTH(TRIM(county)) AS trimmed_county
FROM bronze.poverty_fact
WHERE stateabbrv <> TRIM(stateabbrv)
OR attribute <> TRIM(attribute)
OR county <> TRIM(county);

--Double checking spaces in columns

WITH space_poverty_flags AS(
SELECT 
	stateabbrv,
	attribute,
	county,
	CASE
	 WHEN LENGTH(stateabbrv) <>
	 LENGTH(TRIM(stateabbrv)) THEN 1 ELSE 0
	 END AS statespaces,
	CASE 
	 WHEN LENGTH(attribute) <> 
	 LENGTH(TRIM(attribute)) THEN 1 ELSE 0
	 END AS attributespaces,
	CASE
	 WHEN LENGTH(county) <>
	 LENGTH(TRIM(county)) THEN 1 ELSE 0
	 END AS countyspaces
FROM bronze.poverty_fact
)
SELECT
 	MAX(statespaces) AS stateabbrv_as_spaces,
	MAX(attributespaces) AS attribute_as_spaces,
	MAX(countyspaces) AS county_as_spaces
FROM space_poverty_flags;

--NULL Check: Checking if columns have null values

SELECT *
FROM bronze.poverty_fact
WHERE fips_code IS NULL
	OR stateabbrv IS NULL
	OR county IS NULL
	OR attribute IS NULL
	OR attribute_value IS NULL;

--Checking for non-digit values in rows

SELECT *
FROM bronze.poverty_fact
WHERE attribute_value IS NOT NULL
	AND attribute_value~ '[^0-9\.]';


--State abbreviation row check

SELECT DISTINCT stateabbrv
FROM bronze.poverty_fact
WHERE stateabbrv <> UPPER(stateabbrv);

--Checking for inconsistent formatting in county column

SELECT 
	case_no_formatting_issues,
	COUNT(*) AS row_count
FROM(
 SELECT county,
   CASE
	 	WHEN county ~ '[A-Z]' AND county ~ '[a-z]' THEN 'Mixed case'
		WHEN county ~ '[A-Z]' THEN 'upper'
		WHEN county ~ '[a-z]' THEN 'lower'
		 ELSE 'no formatting issues'
  END case_no_formatting_issues	
FROM bronze.poverty_fact
)m
GROUP BY case_no_formatting_issues;

--Checking all DISTINCT county for New York only

SELECT DISTINCT county,
COUNT(DISTINCT county) AS various_formatting
FROM bronze.poverty_fact
WHERE stateabbrv = 'NY'
GROUP BY DISTINCT county
ORDER BY various_formatting;


--Checking specific word formatting

SELECT DISTINCT county
FROM bronze.poverty_fact
LIMIT 1000;

SELECT county
FROM bronze.poverty_fact
WHERE county ILIKE '%city%';

