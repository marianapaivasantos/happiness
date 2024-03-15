USE happiness;

SELECT * FROM country_region r
JOIN happiness_2015 h1
ON r.country = h1.country;

ALTER TABLE country_region
DROP COLUMN MyUnknownColumn;

ALTER TABLE happiness_2015
DROP COLUMN MyUnknownColumn;

ALTER TABLE happiness_2019
DROP COLUMN MyUnknownColumn;

ALTER TABLE sup_data_2015
DROP COLUMN MyUnknownColumn;

ALTER TABLE sup_data_2019
DROP COLUMN MyUnknownColumn;
/*
SELECT region, avg(happiness_score) FROM ((

SELECT * FROM country_region r
JOIN happiness_2015 h1
ON r.country = h1.country) as s1)

GROUP BY region;

SELECT s1.region, AVG(h1.happiness_score) 
FROM (
    SELECT * 
    FROM country_region r
    JOIN happiness_2015 h1 ON r.country = h1.country
) as s1
GROUP BY s1.region;*/

SELECT * FROM country_region c
JOIN happiness_2015 h1
ON c.country = h1.country;

SELECT s1.region, round(AVG(s1.happiness_score),2) as avg_hap_score
FROM (
    SELECT c.region, h1.happiness_score 
    FROM country_region c
    JOIN happiness_2015 h1 ON c.country = h1.country
) AS s1
GROUP BY s1.region
ORDER BY avg_hap_score;

SELECT s2.region, round(AVG(s2.happiness_score),2) as avg_hap_score
FROM (
    SELECT c.region, h2.happiness_score 
    FROM country_region c
    JOIN happiness_2019 h2 ON c.country = h2.country
) AS s2
GROUP BY s2.region
ORDER BY avg_hap_score;

-- combine 2015 & 2019

SELECT s1.region, 
       ROUND(AVG(s1.happiness_score),2) AS avg_hap_score_2015,
       ROUND(AVG(s2.happiness_score),2) AS avg_hap_score_2019,
       ROUND(((ROUND(AVG(s2.happiness_score),2) - ROUND(AVG(s1.happiness_score),2)) / ROUND(AVG(s1.happiness_score),2)) * 100, 2) AS perc_change
FROM ( 
    SELECT c.region, h1.happiness_score 
    FROM country_region c
    JOIN happiness_2015 h1 ON c.country = h1.country
) AS s1
JOIN (
    SELECT c.region, h2.happiness_score 
    FROM country_region c
    JOIN happiness_2019 h2 ON c.country = h2.country
) AS s2
ON s1.region = s2.region
GROUP BY s1.region
ORDER BY avg_hap_score_2015, avg_hap_score_2019;

SELECT s1.country_name, h1.happiness_score, s1.suicide_mortality, s1.battle_deaths FROM happiness_2015 h1
JOIN sup_data_2015 s1
on h1.country = s1.country_name
ORDER BY s1.suicide_mortality, s1.battle_deaths;

ALTER TABLE happiness_2015
ADD COLUMN year_data INT DEFAULT 2015;

ALTER TABLE happiness_2019
ADD COLUMN year INT DEFAULT 2019;

ALTER TABLE sup_data_2015
ADD COLUMN year INT DEFAULT 2015;

ALTER TABLE sup_data_2019
ADD COLUMN year INT DEFAULT 2019;



SELECT happiness_combined.*, sup_data_combined.*
FROM (
    SELECT * FROM happiness.happiness_2015
    UNION ALL
    SELECT * FROM happiness.happiness_2019
) AS happiness_combined
JOIN (
    SELECT * FROM happiness.sup_data_2015
    UNION ALL
    SELECT * FROM happiness.sup_data_2019
) AS sup_data_combined
ON happiness_combined.country = sup_data_combined.country_name
ORDER BY country ASC, year ASC;

CREATE TEMPORARY TABLE 2015_all
SELECT * FROM happiness.happiness_2015
    UNION ALL
    SELECT * FROM happiness.happiness_2019;
    
SELECT * from happiness_all;

CREATE TEMPORARY TABLE supdata_all
SELECT * FROM happiness.sup_data_2015
    UNION ALL
    SELECT * FROM happiness.sup_data_2019;

SELECT * FROM happiness_all as h
LEFT JOIN supdata_all as s
ON h.country = s.country_name
ORDER BY year ASC, happiness_rank;

-- joining and stacking all 5 tables to use in python

CREATE TEMPORARY TABLE all_2015v7 AS
SELECT h1.country, s1.year, h1.happiness_rank, h1.happiness_score, h1.gdp_per_capita, h1.social_support, h1.life_expectancy, h1.freedom, h1.perception_of_corruption, 
h1.generosity, s1.electricity_access_pc, s1.prim_school_enrol_rate, s1.ARV_coverage, s1.battle_deaths, s1.birth_rate, s1.child_labour_pc, s1.children_not_in_school_pc, 
s1.CPI, s1.GDP_growth, s1.gini_index, s1.income_top_10pc, s1.income_bottom_10pc, s1.internet_coverage, s1.under5_mortality, s1.smokers_pc, s1.male_femaLe_labour_force_part, 
s1.real_eff_xr, s1.renew_elect_output, s1.rural_pop_pc, s1.youth_not_in_ed_emply, s1.suicide_mortality, s1.time_to_start_bus, s1.alcohol_cons_percap, s1.unemployment_pc, 
s1.women_married_by_15
FROM happiness.happiness_2015 h1
JOIN happiness.sup_data_2015 s1 ON h1.country = s1.country_name;

SELECT *, region FROM all_2015v7 f
JOIN country_region c
ON f.country = c.country
;

CREATE TEMPORARY TABLE all_2019v7 AS
SELECT h2.country, s2.year, h2.happiness_rank, h2.happiness_score, h2.gdp_per_capita, h2.social_support, h2.life_expectancy, h2.freedom, h2.perception_of_corruption, 
h2.generosity, s2.electricity_access_pc, s2.prim_school_enrol_rate, s2.ARV_coverage, s2.battle_deaths, s2.birth_rate, s2.child_labour_pc, s2.children_not_in_school_pc, 
s2.CPI, s2.GDP_growth, s2.gini_index, s2.income_top_10pc, s2.income_bottom_10pc, s2.internet_coverage, s2.under5_mortality, s2.smokers_pc, s2.male_femaLe_labour_force_part, 
s2.real_eff_xr, s2.renew_elect_output, s2.rural_pop_pc, s2.youth_not_in_ed_emply, s2.suicide_mortality, s2.time_to_start_bus, s2.alcohol_cons_percap, s2.unemployment_pc, 
s2.women_married_by_15
FROM happiness.happiness_2019 h2
JOIN happiness.sup_data_2019 s2 ON h2.country = s2.country_name;

SELECT *, region FROM all_2019v7 n
JOIN country_region c
ON n.country = c.country
;

CREATE TEMPORARY TABLE everything2 AS
SELECT * FROM all_2015v7
UNION
SELECT * FROM all_2019v7;

SELECT *, region from everything2 e
JOIN country_region c
on e.country = c.country;





 
