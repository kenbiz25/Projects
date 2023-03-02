select ME0301.manager_id, ME0301.name, (ME0301.total_dls-ME0210.total_dls) AS last_15_days
from dbo.['Manager-export_2023-03-01$'] as ME0301
left join dbo.[Manager-export_2023-02-10] AS ME0210
on ME0301.manager_id=ME0210.manager_id
where ME0301.name = ('alternative content')


-- Error converting data type nvarchar to float. Work out the conversion table within.