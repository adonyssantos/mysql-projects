#CREAR BASE DE DATOS
create database if not exists tienda;

#USAR LA BASE DE DATOS
use tienda;

/*
CREAR TABLAS
*/

#TABLAS PRODUCTO
create table if not exists Producto(
	Id_Pruducto int not null,
    Nombre varchar(50),
    Descripcion varchar(50),
    Precio int,
    Cantidad int,
    primary key (Id_Pruducto)
)engine=InnoDB;

#TABLAS CLIENTE
create table if not exists Cliente(
	Id_Cliente int not null,
    Nombre varchar(50),
    Telefono varchar(10),
    Fecha_Nacimiento date,
    Edad int,
    primary key (Id_Cliente),
    Id_Pruducto int not null,
    constraint Id_Pruducto
    foreign key (Id_Pruducto)
    references Producto(Id_Pruducto)
)engine=InnoDB;

/*
INSERTAR REGISTROS EN LA TABLA
*/

#TABLA PRODUCTO 
insert into Producto (Id_Pruducto, Nombre, Descripcion, Precio, Cantidad) 
values (1, "Resfresco", "Coca-Cola", 30, 100);
insert into Producto (Id_Pruducto, Nombre, Descripcion, Precio, Cantidad) 
values (2, "Leche", "La Vaca", 60, 70);
insert into Producto (Id_Pruducto, Nombre, Descripcion, Precio, Cantidad) 
values (3, "Pan", "De harina", 5, 400);
insert into Producto (Id_Pruducto, Nombre, Descripcion, Precio, Cantidad) 
values (4, "Jugo", "De naranja", 50, 150);
insert into Producto (Id_Pruducto, Nombre, Descripcion, Precio, Cantidad) 
values (5, "Fruta", "Mango", 15, 200);
insert into Producto (Id_Pruducto, Nombre, Descripcion, Precio, Cantidad) 
values (6, "Refresco", "7up", 25, 100);

#TABLA CLIENTE 
insert into Cliente (Id_Cliente, Nombre, Telefono, Fecha_Nacimiento, Edad, Id_Pruducto) 
values (11, "Adonys Santos", "8494595609", 13/8/2003, 16, 1);
insert into Cliente (Id_Cliente, Nombre, Telefono, Fecha_Nacimiento, Edad, Id_Pruducto) 
values (12, "Miguel Rivass", "8094244255", 13/5/2014, 13, 2);
insert into Cliente (Id_Cliente, Nombre, Telefono, Fecha_Nacimiento, Edad, Id_Pruducto) 
values (13, "Luis Sanchez", "8494595609", 21/8/2003, 16, 3);
insert into Cliente (Id_Cliente, Nombre, Telefono, Fecha_Nacimiento, Edad, Id_Pruducto) 
values (14, "Roberto Angel", "8295638574", 13/8/1998, 32, 4);
insert into Cliente (Id_Cliente, Nombre, Telefono, Fecha_Nacimiento, Edad, Id_Pruducto) 
values (15, "Vanessa Abreu", "8094595609", 13/8/2004, 16, 5);
insert into Cliente (Id_Cliente, Nombre, Telefono, Fecha_Nacimiento, Edad, Id_Pruducto) 
values (16, "Yusset Morales", "8093138339", 23/3/2016, 12, 6);

select * from Producto;
select * from Cliente;
select * from Producto where Cantidad > 150;
select * from Producto where Cantidad > 150 and Cantidad < 400;
