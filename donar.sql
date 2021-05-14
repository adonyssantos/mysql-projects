/*Realice un procedimiento para determinar si la persona puede donar sangre, 
si el peso es menor a 50 guarde en estado “no admitido”, 
en caso contrario sería “admitido”.*/

create database hospital;

use hospital;

Create table persona(
peso int,
estado varchar(20)
);

delimiter $$
create procedure donarSangre
(in peso int) 
begin
 declare estado char(20);
if peso < 50 then
set estado = "No puedes donar sangre";
else
IF peso >= 50 then
SET estado = "Si puedes donar sangre";
end if; 
end if; 
 insert into persona values (peso, estado);
end
$$ delimiter ;
