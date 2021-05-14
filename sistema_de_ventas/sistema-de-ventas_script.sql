create database if not exists sistemaDeVentas_Adonys;
use sistemaDeVentas_Adonys;

drop database sistemaDeVentas_Adonys;

create table if not exists cliente_Adonys(
	idCliente int not null,
    nombre varchar(30),
    telefono varchar(10),
    direccion varchar(30),
    RUT varchar(30),
    primary key (idCliente)
)engine=InnoDB;

create table if not exists proveedor_Adonys(
	idProveedor int not null,
    nombre varchar(30),
    telefono varchar(10),
    paginaWeb varchar(100),
    direccion varchar(30),
    RUT varchar(30),
    primary key (idProveedor)
)engine=InnoDB;

create table if not exists categoria_Adonys(
	idCategoria int not null,
    nombre varchar(30),
    descripcion varchar(100),
    primary key (idCategoria)
)engine=InnoDB;

create table if not exists venta_Adonys(
	idVenta int not null,
    idCliente int,
    fecha date,
    descuento int,
    precio int,
    cantidad int,
    montoTotal int,    
    primary key (idVenta),
    constraint idCliente
    foreign key (idCliente) 
    references cliente_Adonys(idCliente)
)engine=InnoDB;

create table if not exists producto_Adonys(
	idProducto int not null,
    idProveedor int,
    idVenta int,
    nombre varchar(30),
    stock varchar(30),
    precio int,
    primary key (idProducto),
    constraint idProveedor
    foreign key (idProveedor) 
    references proveedor_Adonys(idProveedor),
    constraint idVenta
    foreign key (idVenta) 
    references venta_Adonys(idVenta)
)engine=InnoDB;

insert into cliente_Adonys 
values 
	(1, "Adonys Santos", "8494595609", "La Vega", 16),
    (2, "Samuel Santos", "8494595610", "Cutupu", 17),
    (3, "Matias Santos", "8494595611", "Rep. Dom", 18);
    
insert into proveedor_Adonys 
values 
	(1, "Priviciones AS", "8093139234", "www.prov-as.com", "Santiago", 14),
    (2, "Priviciones SS", "8093139233", "www.provissions.net", "La Vega", 15),
    (3, "Priviciones MS", "8093139232", "www.ms-prov.es", "Santo Domingo", 16);
    
insert into categoria_Adonys 
values 
	(1, "Electronicos", "Productos electronicos"),
    (2, "Alimentos", "Productos de alimentacion"),
    (3, "Herramientas", "Productos de herramientas");

insert into venta_Adonys 
values 
	(1, 2, now(), 0, 10, 2, 20),
    (2, 3, now(), 3, 15, 4, 57),
    (3, 1, now(), 10, 100, 1, 90);
    
insert into producto_Adonys 
values 
	(1, 2, 3, "Computadora", "Si", 100),
    (2, 3, 1, "Jugo", "Si", 10),
    (3, 1, 2, "Pala", "No", 15);