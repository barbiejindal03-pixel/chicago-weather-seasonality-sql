select 
DATE, 
DATE(DATE) as clean_date
from Daily_summaries_Project dsp; 

-- to calculate maximum temperature in summers 
SELECT 
DATE,
TMAX
from Daily_summaries_Project
Where STRFTIME('%m', DATE ) IN ('06','07', '08')
ORDER BY TMAX DESC; 

-- to calculate for minimum temperature in winters 
select
Date, 
Tmin
from Daily_summaries_Project dsp 
where STRFTIME('%m', DATE) IN ('12','01','02')
ORDER BY TMIN ASC; 

/* which day did the highest amount of precipitation occur during the year, 
and how much rainfall was recorded
*/ 
SELECT
 DATE,
 PRCP
FROM Daily_summaries_Project
WHERE PRCP IS NOT NULL
  AND PRCP > 0
  AND SNOW = 0
ORDER BY PRCP DESC
LIMIT 1;


-- MONTH WITH HIGHEST AVG TEMPERATURE IN 2025 
SELECT
STRFTIME('%m', DATE) AS Month,  
Avg(Tavg) as avg_monthly_temp
From Daily_summaries_Project dsp 
where TAVG is not NULL 
Group by Month 
ORDER by avg_monthly_temp DESC; 

-- month with lowest average temeperature 
SELECT 
STRFTIME ('%m', DATE) AS Month, 
avg(tavg) as avg_monthly_temp 
from daily_summaries_project 
where TAVG is not Null 
group by Month 
Order by avg_monthly_temp ASC; 

-- comparing and understanding the average precipitation and temeprature across different seasons 
SELECT 
CASE 
	WHEN STRFTIME ('%m', DATE) IN ('12','01','02') THEN 'WINTER'
	WHEN STRFTIME ('%m', DATE) IN ('03','04','05') THEN 'SPRING'
	WHEN STRFTIME ('%m', DATE) IN ('06','07','08') THEN 'SUMMER'
	WHEN STRFTIME ('%m', DATE) IN ('09','10','11') THEN 'FALL'
	END AS SEASON, 	
ROUND(AVG(TAVG), 4) AS AVG_TEMP,
ROUND(AVG(PRCP), 4) AS AVG_PRCP
FROM Daily_summaries_Project
WHERE TAVG IS NOT NULL 
GROUP BY SEASON 
ORDER BY AVG_TEMP ASC; 

	
