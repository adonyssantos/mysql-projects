use  tiendita;

#ESTUDIA: UPDATE // ORDERBY

select * from categoria;

select * from detalle_producto_proveedor where idProveedor=6;

select * from productos where precio >= 20;

select * from proveedores order by id desc;

select * from temp;

select * from productos order by nombre desc;

update categoria set nombre = "Caramelos" 
where nombre = "Dulces";

select * from productos;

select nombre, precio from productos where nombre like'%D%';

insert into productos 
(idProducto, nombre, precio, idCategoria, existencia)
values
(23, "Platano  verde", 10, 5, 2);

select * from productos group by precio;
