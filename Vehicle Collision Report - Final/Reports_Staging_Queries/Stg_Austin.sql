SELECT TOP (1000) [crash_id]
      ,[crash_date]
      ,[crash_time]
      ,[case_id]
      ,[rpt_block_num]
      ,[rpt_street_pfx]
      ,[rpt_street_name]
      ,[rpt_street_sfx]
      ,[crash_speed_limit]
      ,[latitude]
      ,[longitude]
      ,[street_name]
      ,[street_nbr]
      ,[street_name_2]
      ,[crash_sev_id]
      ,[sus_serious_injry_cnt]
      ,[nonincap_injry_cnt]
      ,[poss_injry_cnt]
      ,[non_injry_cnt]
      ,[unkn_injry_cnt]
      ,[tot_injry_cnt]
      ,[death_cnt]
      ,[contrib_factr_p1_id]
      ,[contrib_factr_p2_id]
      ,[units_involved]
      ,[apd_confirmed_fatality]
      ,[apd_confirmed_death_count]
      ,[motor_vehicle_death_count]
      ,[motor_vehicle_serious_injury_count]
      ,[bicycle_death_count]
      ,[bicycle_serious_injury_count]
      ,[pedestrian_death_count]
      ,[pedestrian_serious_injury_count]
      ,[motorcycle_death_count]
      ,[motorcycle_serious_injury_count]
      ,[other_death_count]
      ,[other_serious_injury_count]
      ,[micromobility_serious_injury_count]
      ,[micromobility_death_count]
      ,[DI_CreateDate]
      ,[DI_WorkflowName]
      ,[PID]
  FROM [Final_Project].[dbo].[stg_austin_data]

USE Final_Project;
SELECT 
    units_involved,
    LEN(units_involved) - LEN(REPLACE(units_involved, '&', '')) + 1 AS unit_count
FROM 
    stg_austin_data;

SELECT MAX(LEN(units_involved) - LEN(REPLACE(units_involved, '&', '')) + 1) AS max_unit_count
FROM stg_austin_data;

SELECT units_involved
FROM stg_austin_data
WHERE LEN(units_involved) - LEN(REPLACE(units_involved, '&', '')) + 1 = (
    SELECT MAX(LEN(units_involved) - LEN(REPLACE(units_involved, '&', '')) + 1)
    FROM stg_austin_data
);


SELECT units_involved, COUNT(*) AS count
FROM stg_austin_data
GROUP BY units_involved;

WITH SplitUnits AS (
    SELECT 
        value AS unit,
        ROW_NUMBER() OVER (PARTITION BY value ORDER BY (SELECT NULL)) AS rn
    FROM (
        SELECT TRIM(value) AS value
        FROM (
            SELECT value
            FROM stg_austin_data
            CROSS APPLY STRING_SPLIT(units_involved, '&')
        ) AS t
    ) AS t
)
SELECT 
    unit,
    COUNT(unit) AS count
FROM SplitUnits
GROUP BY unit;





