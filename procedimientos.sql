use sakila;

create procedure insertActor (actor_id smallint(10), first_name varchar(30), last_name varchar(30), last_update timestamp)
insert into actor (actor_id, first_name, last_name, last_update) value (actor_id, first_name, last_name, last_update);

create procedure updateActor (id smallint(10), apellido varchar(30))
update actor set last_name =  apellido where actor_id = id;

use tiendida;

create procedure insertCategory (category_id tinyint(10), nombre varchar(30), last_update timestamp)
insert into category (category_id, Nombre, last_update) values (category_id, nombre, last_update);
