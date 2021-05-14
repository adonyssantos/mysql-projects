create database if not exists Cultivos_Del_Valle;

use Cultivos_Del_Valle;

create table if not exists Categoria(
    Id_Categoria int not null auto_increment,
    Nombre varchar(40),
    Descripcion varchar(60),
    primary key(Id_Categoria)
)engine=InnoDB;

create table if not exists Producto(
    Id_Producto varchar(5) not null,
    Nombre varchar(40),
    Precio float(11),
    Descripcion varchar(60),
    Id_Categoria int, 
    primary key(Id_Producto),
    constraint Id_Categoria
    foreign key(Id_Categoria)
    references Categoria(Id_Categoria)
)engine=InnoDB;

create table if not exists Vendedor(
    Id_Vendedor int not null,
    Nombre varchar(50),
    Fecha_De_Entrada date,
    Fecha_De_Nacimiento date,
    Direccion varchar(50),
    Cedula int,
    Correo varchar(50),
    Telefono int,
    Estado_Civil enum('Casado', 'Soltero'),
    primary key(Id_Vendedor)
)engine=InnoDB;

create table if not exists Venta(
    Id_Venta int not null,
    Id_Producto int not null, 
    Id_Vendedor int not null,
    primary key(Id_Venta),
    constraint Id_Producto
    foreign key(Id_Producto)
    references Producto(Id_Producto),
    constraint Id_Vendedor
    foreign key(Id_Vendedor)
    references Vendedor(Id_Vendedor)
)engine=InnoDB;

drop database Cultivos_Del_Valle;
