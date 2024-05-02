# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
select name, population from city where name like 'ping%' order by population asc;

#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
select name, population from city where name like 'ran%' order by population desc;

# 3: Count all cities
#
select count(*) from city;
#
# 4: Get the average population of all cities
#
select avg(Population) from city;

#
# 5: Get the biggest population found in any of the cities
#
select max(population) from city;
#
# 6: Get the smallest population found in any of the cities
#
select min(population) from city;
#
# 7: Sum the population of all cities with a population below 10000
#
select sum(population) from city where Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
#
select countrycode, count(*) from city where countrycode in ('moz', 'vnm') group by countrycode;
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#
select countrycode, count(*) from city where countrycode = 'moz' or countrycode = 'vnm' group by countrycode;
#
# 10: Get average population of cities in MOZ and VNM
#
select CountryCode, avg(Population) from city where countrycode = 'moz' or countrycode = 'vnm' group by countrycode;
#
# 11: Get the countrycodes with more than 200 cities
#'
select countrycode, count(*) as city_count from city group by countrycode having count(*) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
#
select countrycode, count(*) as city_count from city group by countrycode having count(*) > 200 order by city_count desc;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#
SELECT cl.Language FROM CountryLanguage cl JOIN Country c ON cl.CountryCode = c.Code JOIN City ci ON c.Code = ci.CountryCode WHERE ci.Population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
SELECT DISTINCT c.Name AS CityName, cl.Language FROM City c JOIN Country co ON c.CountryCode = co.Code JOIN CountryLanguage cl ON co.Code = cl.CountryCode WHERE c.Population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#CountryCode
#
select city.name as city_name, city.CountryCode as countrycode, city.Population as Population from city 
join city as selected_city on city.CountryCode = selected_city.CountryCode 
where selected_city.Population = 122199;


# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
select c2.name from city as c1 join city as c2 on c1.CountryCode = c2.CountryCode 
where c1.Population = 122199 and c1.id <> c2.id;
#
# 17: What are the city names in the country where Luanda is capital?
#
SELECT c.Name from City as c join country as co on CountryCode = co.code
where co.Capital = (select id from city where name = 'Luanda');

#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#
select c.Name from city as c join country as co on c.CountryCode = co.code
where co.Capital in (select id from city where CountryCode = (select countrycode from city whare name = 'Yaren'));

#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#

SELECT DISTINCT language FROM countrylanguage WHERE countrycode IN ( SELECT countrycode FROM country
WHERE region = (SELECT region FROM city WHERE name = 'Riga'));

#
# 20: Get the name of the most populous city
#

select name from city order by Population desc limit 1;

