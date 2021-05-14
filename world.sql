#Usar la base de datos World
use World;

/*EJERCICIOS*/
#1
select * from country;

#2
select Code, Name, LifeExpectancy from country where LifeExpectancy > 78;

#3
select Code, Name from country where Continent = "North America";

#4
select Code, Name from country where Region = "Southern Europe";

#5
select * from country where Continent = "Africa";

#6
select * from country where Region = "Caribbean";

#7
select * from country where Name like 'B%';

#8
select * from city where District = "Luanda";

#9
select * from city where Population > 200000;

#10
select distinct Language from countrylanguage; 

#11
select * from countrylanguage where IsOfficial = "T";

#12
select * from countrylanguage where IsOfficial = "T" and Language = "Spanish" ;

#13
select Name,Population from country where Name = "United States" or  Name = "Canada";

#14
update countrylanguage set IsOfficial = "T" where CountryCode = "DOM" and Language = "Creole French";
update countrylanguage set IsOfficial = "F" where CountryCode = "DOM" and Language = "Spanish";
select * from countrylanguage where CountryCode ="DOM"
