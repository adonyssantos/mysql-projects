#CREAR BASE DE DATOS
create database if not exists REGISTRO;

#USAR LA BASE DE DATOS
use EJERCICIO;

/*
CREAR TABLAS
*/

#TABLAS FACULTAD
create table if not exists Facultad(
	Id_Facultad int not null,
    Facultad varchar(50),
    primary key (Id_Facultad)
)engine=InnoDB;

#TABLAS ESCUELA
create table if not exists Escuela(
	Id_Escuela int not null,
    Escuela varchar(50),
	Id_Facultad int not null,
    primary key (Id_Escuela),
    constraint Id_Facultad
    foreign key (Id_Facultad)
    references Facultad(Id_Facultad)
)engine=InnoDB;

#TABLAS USUARIO
create table if not exists Usuario(
	Id_User int not null,
    Nombres varchar(50),
    Genero enum('M', 'F'),
	Id_Escuela int not null,
    Direccion varchar(50),
    primary key (Id_User)
)engine=InnoDB;

#TABLAS TIPO
create table if not exists Tipo(
	Id_Tipo int not null,
    Usuario varchar(50),
    primary key (Id_Tipo)
)engine=InnoDB;

#TABLAS LIBRO
create table if not exists Libro(
	Id_Libro int not null,
    Titulo varchar(50),
    Autor varchar(50),
    Editorial varchar(50),
    Ejemplar int,
    Imagen varchar(50),
    primary key (Id_Libro)
)engine=InnoDB;

#TABLAS PRESTAMO
create table if not exists Prestamo(
	Id_Prestamo int not null,
    Fecha_Prest date,
    Fecha_Dev date,
	Id_Libro int not null,
    Ejemplar int,
    Id_User int not null,
    Id_Tipo int not null,
    Demora varchar(50),
    primary key (Id_Prestamo),
    constraint Id_Libro
    foreign key (Id_Libro)
    references Libro(Id_Libro),
    constraint Id_User
    foreign key (Id_User)
    references Usuario(Id_User),
	constraint Id_Tipo
    foreign key (Id_Tipo)
    references Tipo(Id_Tipo)
)engine=InnoDB;

#TABLAS DISPONIBLE
create table if not exists Disponible(
	Id_Disponible int not null,
    Ejemplar varchar(50),
    Disponible varchar(50),
    primary key (Id_Disponible)
)engine=InnoDB;

/*
#PARA ELIMINAR UNA BASE DE DATOS
drop database EJERCICIO;
*/
