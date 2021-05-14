create database if not exists Concesionario;

use Concesionario;

create table if not exists Cliente (
  Id_Cliente int not null auto_increment,
  Nombre varchar(30),
  Direccion varchar(40),
  Telefono varchar(10),
  Correo varchar(50),
  primary key (Id_Cliente)
) engine = InnoDB;

create table if not exists Coche (
  Id_Coche int not null auto_increment,
  Modelo varchar(30),
  Marca varchar(30),
  Color varchar(15),
  Id_Cliente int,
  primary key (Id_Coche),
  constraint Id_Cliente 
  foreign key (Id_Cliente) 
  references Cliente(Id_Cliente)
) engine = InnoDB;

create table if not exists Mecanico (
  Id_Mecanico int not null,
  nombre varchar(30),
  Telefono varchar(10),
  Fecha_Contratacion date,
  Correo varchar(50),
  primary key (Id_Mecanico)
) engine = InnoDB;

create table if not exists Reparacion (
  Id_Reparacion int not null,
  Id_Mecanico int,
  Id_Coche int,
  primary key (Id_Reparacion),
  CONSTRAINT Id_coche 
  FOREIGN KEY (Id_Coche) 
  REFERENCES Coche(Id_Coche),
  CONSTRAINT Id_Mecanico 
  FOREIGN KEY (Id_Mecanico) 
  REFERENCES Mecanico(Id_Mecanico)
) engine = InnoDB;
