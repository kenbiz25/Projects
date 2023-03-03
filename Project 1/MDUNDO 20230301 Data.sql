-- View All Data
SELECT * FROM Mdundo.dbo.['Manager-export_2023-03-01$']

--earnings by country/ balances
SELECT country_name, sum(ISNULL(total_earnings,0)) as Earned, sum(ISNULL(total_payout,0)) as Disbursed,
(sum(total_earnings)+ sum(isnull(total_payout,0))) as Balance
FROM Mdundo.dbo.['Manager-export_2023-03-01$']
group by country_name
order by Balance desc

--Manager earnings. Paid out, Balances
SELECT manager_id,name,email,country_name,ISNULL (total_earnings, 0) AS total_earnings, 
ISNULL(total_payout, 0) AS total_payout, (total_earnings+ isnull(total_payout,0)) as Balance
from Mdundo.dbo.['Manager-export_2023-03-01$']
order by Balance desc

--Active Manager earnings. Paid out, Balances
SELECT manager_id,name,email,country_name,ISNULL (total_earnings, 0) AS total_earnings, 
ISNULL(total_payout, 0) AS total_payout, (total_earnings+ isnull(total_payout,0)) as Balance
from Mdundo.dbo.['Manager-export_2023-03-01$']
where active=1
order by Balance desc

--Inactive Manager earnings. Paid out, Balances
SELECT manager_id,name,email,country_name,ISNULL (total_earnings, 0) AS total_earnings, 
ISNULL(total_payout, 0) AS total_payout, (total_earnings+ isnull(total_payout,0)) as Balance
from Mdundo.dbo.['Manager-export_2023-03-01$']
where active=-1 or active=0
order by Balance desc

--Mdundo accounts earnings. Paid out, Balances
SELECT manager_id,name,email,country_name,ISNULL (total_earnings, 0) AS total_earnings, 
ISNULL(total_payout, 0) AS total_payout, (total_earnings+ isnull(total_payout,0)) as Balance
from Mdundo.dbo.['Manager-export_2023-03-01$']
where email LIKE ('%mdundo%') or
email like ('notification%')
order by Balance desc

--accounts above 50
SELECT manager_id,name,email,country_name,ISNULL (total_earnings, 0) AS total_earnings, 
ISNULL(total_payout, 0) AS total_payout, (total_earnings+ isnull(total_payout,0)) as Balance
from Mdundo.dbo.['Manager-export_2023-03-01$']
where email LIKE ('%mdundo%') or
email like ('notification%') or
total_earnings>=50
order by Balance desc

--count mdundo accounts above 50
SELECT count(manager_id) as count_managers, sum(total_earnings), sum(total_payout)
from Mdundo.dbo.['Manager-export_2023-03-01$']
where email LIKE ('%mdundo%') or
email like ('notification%') or
total_earnings>=50

--count mdundo accounts below 50
SELECT count(manager_id) as count_managers, sum(total_earnings), sum(total_payout)
from Mdundo.dbo.['Manager-export_2023-03-01$']
where email not LIKE ('%mdundo%') or
email not like ('notification%') or
total_earnings<=50


