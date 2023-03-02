select country_name, sum(total_dls) as Tota_Dls_country
from dbo.['Manager-export_2023-03-01$']
where country_name in ('kenya', 'Uganda', 'tanzania','nigeria', 'south africa')
group by country_name

SELECT manager_id,total_dls, name, EMAIL
FROM DBO.['Manager-export_2023-03-01$']
WHERE country_name='KENYA'