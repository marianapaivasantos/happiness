Project Title 
Happiness is a number
Description 
We are economists working with governments to assist in evidence based policy making - traditionally GDP growth seen as the key to economic development, but modern economists are exploring and measuring other metrics.
The purpose of this analysis was to unpack what makes a country happy and to use this information in policy making.
Process
Raw data extracted as csv files from the relevant sources.
These csv files cleaned in python and then loaded into MySQL as tables.
5 tables - happiness_2015, happiness_2019, sup_data_2015, sup_data_2019, country_region
Some EDA done in MySQL, and tables joined to form 2 consolidated tables for each of the 2 years - comprising country, region + all variables from both data sources
In addition, a windows function used to calculate average happiness by region, to display alongside the country score.
Two tables then further analysed and visualisations done in python.
Looker studio used to generate a map showing the 2019 score by country.  
Authors 
Mariana Santos marianapaivasantos@hotmail.com
Shannon Knight shannonmariak@gmail.com
Version History
1: 15 March 2024
Acknowledgments
Thank you to Gallup and The World Bank for making this data publically available
World Happiness Report from Gallup World Poll
World Development Indicators from The World Bank