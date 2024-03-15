CREATE DATABASE IF NOT EXISTS happiness;

USE happiness;

CREATE TABLE country (
    country varchar(30),
    region varchar(30),
    PRIMARY KEY (country)
);

CREATE TABLE happiness_2015 (
    country varchar(30),
    happiness_rank float,	
    happiness_score float,
    gdp_per_capita float,	
    social_support float,	
    life_expectancy float,	
    freedom float,	
    perception_of_corruption float,	
    generosity float,
    PRIMARY KEY (country)
);

CREATE TABLE happiness_2019 (
    country varchar(30),
    happiness_rank float,	
    happiness_score float,
    gdp_per_capita float,	
    social_support float,	
    life_expectancy float,	
    freedom float,	
    perception_of_corruption float,	
    generosity float,
    PRIMARY KEY (country)
);

CREATE TABLE sup_data_2015 (
    country varchar(30),
    country_name float,
    electricity_access_pc float,
    prim_school_enrol_rate float,
    ARV_coverage float,
    battle_deaths float,
    birth_rate float,
    child_labour_pc float,
    children_not_in_school_pc float,
    CPI float,
    GDP_growth float,
    gini_index float,
    income_top_pc float,
    income_bottom_pc float,
    internet_coverage float,
    under5_mortality float,
    smokers_pc float,
    male_femaLe_labour_force_part float,
    real_eff_xr float,
    renew_elect_output float,
    rural_pop_pc float,
    youth_not_in_ed_emply float,
    suicide_mortality float,
    time_to_start_bus float,
    alcohol_cons_pc float,
    unemployment_pc float,
    women_married_by_15 float,
    PRIMARY KEY (country)
);

CREATE TABLE sup_data_2019 (
    country varchar(30),
    country_name float,
    electricity_access_pc float,
    prim_school_enrol_rate float,
    ARV_coverage float,
    battle_deaths float,
    birth_rate float,
    child_labour_pc float,
    children_not_in_school_pc float,
    CPI float,
    GDP_growth float,
    gini_index float,
    income_top_pc float,
    income_bottom_pc float,
    internet_coverage float,
    under5_mortality float,
    smokers_pc float,
    male_femaLe_labour_force_part float,
    real_eff_xr float,
    renew_elect_output float,
    rural_pop_pc float,
    youth_not_in_ed_emply float,
    suicide_mortality float,
    time_to_start_bus float,
    alcohol_cons_pc float,
    unemployment_pc float,
    women_married_by_15 float,
    PRIMARY KEY (country)
);
