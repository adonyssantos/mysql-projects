create database if not exists AdonysSantos;
use AdonysSantos;

create table if not exists productoAdonys(
	idProducto int not null,
    nombre varchar(30),
    precio int,
    categoria varchar(10),
    primary key (idProducto)
)engine=InnoDB;

create table if not exists productosModificados(
	codigo int not null,
    nombre varchar(30),
    precio int,
    categoria varchar(10),
    fecha_modifico date,
    primary key (codigo)
)engine=InnoDB;

delimiter $$ 
create trigger productosModificados_AU
    after update
    on productoAdonys for each row
begin
    insert into productosModificados (codigo, nombre, precio, categoria, fecha_modifico)
	values (old.idProducto, old.nombre, old.precio, old.categoria, now());
end$$    
delimiter ;

/*EJEMPLO DEL TRIGGER FUNCIONANDO*/
insert into productoAdonys (idProducto, nombre, precio, categoria)
values (1, "Jugo de Manzana", 23, "Jugos");

#Visualizamos que se agrego correctamente
select * from productoAdonys;

#Modificamos el producto
update productoAdonys set precio = 25 where idProducto = 1;

#Y visualizamos que se modifico correctamente y que se agrego a la tabla "productosModificados".
select * from productoAdonys;
select * from productosModificados;
