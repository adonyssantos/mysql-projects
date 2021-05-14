/*Aqui cree la base de datos*/
create database tienda;
use tienda;

/*Hice dos tablas, una llamada PRODUCTOS y otra PRODUCTOS_BORRADOS*/
create table if not exists producto(
	idPruducto int not null,
    nombre varchar(50),
    precio int,
    primary key (idPruducto)
)engine=InnoDB;

/*En esta tabla se va a guardar un registro de los productos que existieron de la BD, 
pero que ahorra estan borrados.*/
create table if not exists productosBorrados(
	codigo int not null auto_increment,
    nombre varchar(50),
    precio int,
    fecha date,
    primary key (codigo)
)engine=InnoDB;

/*Aqui cree el trigger que pedia lo siguiente: 
Crear un trigger para llevar un registro de los productos 
que sean eliminados de la tabla productos. 
Cada vez que se elimine un producto se debe de guardar 
este como prueba de que ese producto existió en la base de datos.

Utilice un delimitador porque al tener varias sentencias juntas daba error,
entonces esa fue la forma que encontre de solucionar eso.*/
delimiter $$ 
create trigger productosBorrados_BD
    before delete
    on producto for each row
begin
    insert into productosBorrados (nombre, precio, fecha)
	values (old.nombre, old.precio, now());
end$$    
delimiter ;

/*EJEMPLO DEL TRIGGER FUNCIONANDO*/

#Insertamos un producto
insert into producto (idPruducto, nombre, precio)
values (1, "Pan", 7);

#Visualizamos que se agrego correctamente
select * from producto;

#Eliminamos el producto
delete from producto where idPruducto = 1;

#Y visualizamos que se agrego correctamente a la tabla PRODUCTOS_BORRADOS
select * from productosBorrados;
