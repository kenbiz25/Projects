-- 1. to check if everything is in order

select top 5 *
from [Portfolio 1].dbo.covid_deaths


select top 5 *
from [Portfolio 1]..covid_vaccinations
-- 2. .. comes in place of dbo consider line 1

select top 5 *
from [Portfolio 1].dbo.covid_deaths
order by 3, 4

-- 3. you can hover in the * to see all column names
-- 4. Check dataset we are working on, ordering is by column, say country and time

select top 5 *
from [Portfolio 1]..covid_vaccinations
order by 3, 4

SELECT location,date, new_cases, total_deaths, population
from [Portfolio 1].dbo.covid_deaths

-- 5. Find total cases vs total deaths - to show survival/chances of dying
--questions to answer - convert millions to actual number

SELECT location,date,total, new_cases, total_deaths, (total_deaths_per_million/total_cases_per_million)*100 as death_percentage
from [Portfolio 1].dbo.covid_deaths
where location like ('united states')
order by 2

--6. Total cases vs population
SELECT location, date, (total_cases_per_million/population)*100 as death_percentage, total_deaths
from [Portfolio 1].dbo.covid_deaths
where location like ('kenya')
order by 2

--7. country Infections over time

SELECT date, total_tests, total_cases_per_million, total_deaths 
from [Portfolio 1].dbo.covid_deaths
where location like ('kenya')
order by 1

--8. continents with highest infections

SELECT continent, SUM(population) as populationcont, 
from [Portfolio 1].dbo.covid_deaths
group by continent

--9. countries with highest infections
--how to handle million rates
select location, population, max(total_cases_per_million/population)*100 as percentageinfectionrate
from [Portfolio 1].dbo.covid_deaths
group by location, population
order by percentageinfectionrate desc

--10. countries with highest infections rates compared to population
select location, population, max(total_cases_per_million) as highestinfectionrate, max(total_cases_per_million/population) as
percentageinfected
from [Portfolio 1].dbo.covid_deaths
group by location, population
order by percentageinfected desc


--11. countries with highest death count compared to population
-- configured he continent error at this point
select location, max(CAST(total_deaths as int)) as highestDC
from [Portfolio 1].dbo.covid_deaths
where continent is not null
group by location, population
order by highestDC desc

--11. Breakdown by continent
select continent, max(CAST(total_deaths as int)) as highestDC
from [Portfolio 1].dbo.covid_deaths
where continent is not null
group by continent
order by highestDC desc

--12. Continent with highest death count population

select continent, max(CAST(total_deaths as int)) as highestDC
from [Portfolio 1].dbo.covid_deaths
where continent is not null
group by continent
order by highestDC desc


