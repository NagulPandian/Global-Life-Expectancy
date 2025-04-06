USE world_life_expectancy;

SELECT country, MIN(`Life expectancy`), MAX(`Life expectancy`), AVG(`Life expectancy`),
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS Life_increase_in_15_years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0 AND MAX(`Life expectancy`) <> 0 
ORDER BY Life_increase_in_15_years DESC;

SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year;


SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Avg_exp, ROUND(AVG(GDP),1) AS AVG_GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Avg_exp <> 0 AND AVG_GDP <> 0 
ORDER BY Avg_exp;


SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_count,
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) AS High_GDP_count_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) AS Low_GDP_count,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) AS Low_GDP_count_Life_Expectancy
FROM world_life_expectancy
WHERE GDP <> 0
;

SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Status;




SELECT Country, ROUND(AVG(`Life expectancy`),2) AS Life_expectancy, ROUND(AVG(BMI),2) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_expectancy <> 0
AND BMI <> 0 
ORDER BY BMI DESC
;





