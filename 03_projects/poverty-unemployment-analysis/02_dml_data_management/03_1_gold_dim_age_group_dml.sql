SET search_path to gold;

/*===============================
Poverty Dataset
Age Dimension Table
==================================*/

INSERT INTO gold.dim_age_group(
	age_group_code,
	age_group_description
)
VALUES
	('ALL', 'All Ages'),
	('017',	'Under 18'),
	('517',	'Ages 5 to 17');