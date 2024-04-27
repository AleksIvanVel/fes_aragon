-- comentario: Aleks Ivan Vealzquez Arriaga 

Show databases;

-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'how databases' at line 1

show variables like '%dir%'; -- todas las varibles del servidor, like para buscar cadenas dentro de cadenas

create database testbd;
drop database testbd;

show tables from testbd; -- mostrar las tabalas de la base de datos especificada

use testbd; -- usar una determinada base de datos 

select database(); -- nos inidca que base estamos utilizando 
select database(), user(), connection_id(), version(), sysdate();

select 9 * 7  + 1 as exp1, (9*7)+1 exp, 'hola mundo' saludo; -- renombrar campos con as o un espacio

select sysdate(), current_date(), current_time(), current_date -- EL SEGUNDO CURRENT_DATE ES UN VALOR 

-- DEFINIR VARIABLES 

set @nombre = 'Aleks';
set @iva = 0.16;
set @costo = 1000;

select sysdate(), current_date(), current_time(), current_date, @nombre, now();

select 1000 costo, @iva impuesto, 1000 + (1000*@iva) total -- operaciones con valores y variables 
select @costo costo, @iva impuesto, @costo + (@costo*@iva) total -- operaciones con valores y variables 