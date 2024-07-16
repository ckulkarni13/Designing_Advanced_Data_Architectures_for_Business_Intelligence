
USE Project_Final;


select dt.time_of_day, count(dt.time_of_day)
from Fact_Collision f inner join Dim_Time dt
on f.TimeSK = dt.TimeSK
group by dt.time_of_day;
 
select dd.season, count(dd.season)
from Fact_Collision f inner join Dim_Date dd
on f.DateSK = dd.DateSK
group by dd.season;
 
select dd.day_of_the_week, count(dd.day_of_the_week)
from Fact_Collision f inner join Dim_Date dd
on f.DateSK = dd.DateSK
group by dd.day_of_the_week;
 
select cfd.contribution_description, count(cfd.contribution_description)
from Fact_Factors f inner join Dim_Contributing_factor cfd
on f.ContributingFactorSK = cfd.ContributingFactorSK
group by cfd.contribution_description
 
select avg(speed_limit) as avg_speed_limit, max(speed_limit) as max_speed_limit, min(speed_limit) as min_speed_limit
from Fact_Collision 
where speed_limit >= 0;
 
select vtd.vehicle_type, count(vtd.vehicle_type)
from Fact_VehiclesInvolved f inner join Dim_Vehicle_Type vtd
on f.VehicleTypeSK = vtd.VehicleTypeSK
group by vehicle_type;
 