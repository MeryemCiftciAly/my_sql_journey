/* Date July 18 2025: Exploring amd cleaning the Messy New York Department of Sanitation dataset */

SELECT * FROM sanitation_data
LIMIT 10;

--Checking for null values in the dataset

SELECT
COUNT(*) FILTER (WHERE month IS NULL) AS null_month,
COUNT(*) FILTER (WHERE borough IS NULL) AS null_borough,
COUNT(*) FILTER (WHERE communitydistrict IS NULL) AS null_communitydistrict,
COUNT(*) FILTER (WHERE refusetpnscollected IS NULL) AS null_refusetpnscollected,
COUNT(*) FILTER (WHERE papertonscollected IS NULL) AS null_papertonscollected,
COUNT(*) FILTER (WHERE mgptonscollected IS NULL) AS null_mgptonscollected,
COUNT(*) FILTER (WHERE resorganicstons IS NULL) AS null_resorganicstons,
COUNT(*) FILTER (WHERE schoolorganictons IS NULL) AS null_schoolorganictons,
COUNT(*) FILTER (WHERE leavesorganictons IS NULL) AS null_leavesorganictons,
COUNT(*) FILTER (WHERE xmastreeton IS NULL) AS null_xmastreeton,
COUNT(*) FILTER (WHERE borough_id IS NULL) AS null_borough_id
FROM sanitation_data;

--Checking for differences in text values for borough

SELECT DISTINCT borough
FROM sanitation_data;

SELECT DISTINCT month
FROM sanitation_data;

--Checking for spaces and irregularities

SELECT COUNT(DISTINCT borough)
FROM sanitation_data;

--Checking entries
SELECT borough, count(*) AS Borough_count
FROM sanitation_data
GROUP BY borough
ORDER BY count(*) DESC;

SELECT
borough,
TRIM(borough) AS proper_borough,
COUNT(*) AS Borough_count
FROM sanitation_data
GROUP BY borough, proper_borough
ORDER BY count(*) DESC;

--Checking for duplicates

SELECT 
	month,
	borough,
	communitydistrict,
	refusetpnscollected,
	papertonscollected,
	mgptonscollected,
	resorganicstons,
	schoolorganictons,
	leavesorganictons,
	xmastreeton,
	borough_id,
COUNT (*) AS dup_data
FROM sanitation_data
GROUP BY
	month,
	borough,
	communitydistrict,
	refusetpnscollected,
	papertonscollected,
	mgptonscollected,
	resorganicstons,
	schoolorganictons,
	leavesorganictons,
	xmastreeton,
	borough_id
HAVING count (*) > 1;

--Checking for duplicates using CTE

WITH check_duplicate AS (
SELECT *, COUNT(*) AS dup_values
FROM sanitation_data
GROUP BY month,
borough,
communitydistrict,
refusetpnscollected,
papertonscollected,
mgptonscollected,
resorganicstons,
schoolorganictons,
leavesorganictons,
xmastreeton,
borough_id
)
SELECT *
FROM check_duplicate
WHERE dup_values > 1;

--Replacing null values with zero
SELECT
	month,
	borough,
	communitydistrict,
	COALESCE(refusetpnscollected, 0) AS refuse_tons_collected,
	COALESCE(papertonscollected, 0) AS paper_tons_collected,
	COALESCE(mgptonscollected, 0) AS mgp_tons_collected,
	COALESCE(resorganicstons, 0) AS res_organics_tons,
	COALESCE(schoolorganictons, 0) AS school_organic_tons,
	COALESCE(leavesorganictons, 0) AS leaves_organic_tons,
	COALESCE(xmastreeton, 0) AS xmas_tree_ton,
	borough_id
FROM sanitation_data;

--creating new cleaned dataset to use later in Kaggle

CREATE TABLE cleaned_sanitation_data AS
SELECT
    month,
    TRIM(borough) AS borough,
    communitydistrict,
	COALESCE(refusetpnscollected, 0) AS refuse_tons_collected,
	COALESCE(papertonscollected, 0) AS paper_tons_collected,
	COALESCE(mgptonscollected, 0) AS mgp_tons_collected,
	COALESCE(resorganicstons, 0) AS res_organics_tons,
	COALESCE(schoolorganictons, 0) AS school_organic_tons,
	COALESCE(leavesorganictons, 0) AS leaves_organic_tons,
	COALESCE(xmastreeton, 0) AS xmas_tree_ton,
	borough_id
FROM sanitation_data;
