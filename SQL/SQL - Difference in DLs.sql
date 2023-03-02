select manex0301.manager_id, manex0301.name,
manex0301.total_dls, manex0106.total_dls,
(manex0301.total_dls-manex0106.total_dls) as Diff_Dls
from dbo.['Manager-export_2023-03-01$'] as manex0301
join dbo.['manager-export_2023-01-06$'] as manex0106
on manex0301.manager_id=manex0106.manager_id
order by Diff_Dls asc

--(((manex0301.total_dls-manex0106.total_dls)/manex0106.total_dls)*100) as growth_percentage
--