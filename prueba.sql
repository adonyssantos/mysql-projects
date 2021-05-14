#CREAMOS LA BASE DE DATOS
create database if not exists PRUEBA;

#CREAMOS LAS TABLAS
use PRUEBA;

#CREAMOS LAS TABLAS
create table if not exists DEPARTAMENTO(
	ID_DEPT int not null,
    NOMBRE varchar(50) not null,
    UBICACION varchar(50),
    primary key (ID_DEPT)
)engine=InnoDB;

create table if not exists EMPLEADO(
	ID_EMP int not null,
    NOMBRE varchar(50) not null,
    TELEFONO varchar(10),
    DIRECCION varchar(50),
    SEXO enum('M', 'F'),
    primary key (ID_EMP),
    ID_DEPT int
    constraint ID_DEPT
    foreign key (ID_DEPT)
    reference DEPARTAMENTO (ID_DEPT)
)engine=InnoDB;
