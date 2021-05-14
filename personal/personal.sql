# # # # # # # # # # # # # # # # # #
# 		      CREACION 		      #
# # # # # # # # # # # # # # # # # #

create database PERSONAL;

use PERSONAL;

create table DEPARTAMENTOS(
	Clave_Depto int not null,
    Nombre varchar(30),
    Presupuesto int,
    primary key(Clave_Depto)
)engine=InnoDB;

create table EMPLEADOS(
	Clave_empleado varchar(8) not null,
    Nombre varchar(30),
    Apellido varchar(30),
    Clave_Depto int not null,
    primary key(Clave_empleado),
    constraint Clave_Depto
    foreign key (Clave_Depto)
    references DEPARTAMENTOS(Clave_Depto)
)engine=InnoDB;

# # # # # # # # # # # # # # # # # #
# 		   AGREGAR DATOS	      #
# # # # # # # # # # # # # # # # # # 

insert into DEPARTAMENTOS 
(Clave_Depto, Nombre, Presupuesto)
values (1, "Personal", 80000);

insert into DEPARTAMENTOS 
(Clave_Depto, Nombre, Presupuesto)
values (2, "Almacen", 70000);


insert into DEPARTAMENTOS 
(Clave_Depto, Nombre, Presupuesto)
values (3, "Contabilidad", 60000);

insert into DEPARTAMENTOS 
(Clave_Depto, Nombre, Presupuesto)
values (4, "Manufactura", 50000);

insert into DEPARTAMENTOS 
(Clave_Depto, Nombre, Presupuesto)
values (5, "Empaque", 30000);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP01", "Armando", "Lopez", 2);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP02", "Tatiana", "Vargas", 1);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP03", "Laura", "Ituria", 3);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP04", "Juan", "Perez", 4);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP05", "Ivan", "Lopez", 4);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP06", "Margarita", "Hernandez", 1);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP07", "Jesus", "Perez", 3);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP08", "Tonatiuh", "Flores", 2);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP09", "Juan", "Lopez", 4);

insert into EMPLEADOS 
(Clave_empleado, Nombre, Apellido, Clave_Depto)
values ("EMP10", "Jose", "Hernandez", 5);

# # # # # # # # # # # # # # # # # #
# 		    CONSULTAS		      #
# # # # # # # # # # # # # # # # # # 

select * from departamentos;

select * from empleados;

select Nombre, Apellido from empleados;

select distinct Apellido from empleados; 

select * from empleados where Apellido = "Lopez";

select * from empleados where Apellido = "Lopez" or  Apellido = "Perez";

select Nombre, Clave_Empleado from empleados where Clave_Depto = 4;

select * from empleados where Clave_Depto = "1" or Clave_Depto = "3" order by Nombre;

select Nombre, Apellido from empleados where Apellido like"H%";

select Clave_Empleado, Nombre, Apellido from empleados where Clave_Depto = 3;

select e.Nombre, e.Apellido, d.Nombre as departamento from empleados 
as e inner join departamentos 
as d on e.Clave_Depto = d.Clave_Depto;

# # # # # # # # # # # # # # # # # #
# 		      VISTAS  		      #
# # # # # # # # # # # # # # # # # #

create view PERSONAL as
select * from empleados where Clave_Depto = 1;

create view Pérez as
select * from empleados where Apellido = "Pérez";

create view Grandes_presupuestos as
select * from departamentos where Presupuesto >= 50000;
