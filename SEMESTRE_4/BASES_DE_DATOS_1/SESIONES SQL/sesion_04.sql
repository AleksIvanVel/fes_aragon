-- select recupera datos de una tabla
-- from
-- where
-- group
-- having
-- order by
-- limit

show tables;

-- comando select para recuoerar datos de funciones 
select user(), database(), sysdate();
select 5*7 as multi, 800/4 as divide, 'hola' saludo; -- renombramiento de campos con as o un espacio seguido de una etiqueta

select ((8*7) - (5/4)) operacion, sysdate() fecha, user();


describe empleado;

-- proyeccion: numero de campos que muestro con el comodin * que representa la lista de campos 
-- seleccion: numero de registros que se recuperan 
select * from empleado;

select empno, enombre, epaterno, sexo, sueldo,
(sueldo/18) sueldo_usd, -- creamos un nuevo campo sueldo en dolares
sueldo * sueldo sueldo_2 
from empleado;

-- distinct muestra los valores unicos de una lista de campos
select distinct sexo from empleado;
select distinct empno from empleado;
select distinct deptono from empleado;
select distinct deptono, sexo from empleado; -- combinacion de n campos mas campos, mas registros
select distinct enombre from empleado;

-- where sirve para filtrar con condicionales
select * from empleado where sexo = 'F';
select * from empleado where sexo = 'M';
-- select * from empleado where sexo = null;

select * from empleado where sexo is null; -- evaluamos con el operador is null
select * from empleado where sexo is not null;

select * from empleado where sexo = 'M' and deptono = 2;
select * from empleado where sexo = 'M' or deptono = 2;

select distinct enombre from empleado where sexo = 'F'; -- filtramos y mostramos los nombre unicos de sexo f

-- GROUP BY
select sexo from empleado group by sexo; -- lo que esta en la proyeccion debe estear en el agrupamiento
-- funciones de agregacion: saca valores sobre los grupos
	-- count
	-- sum
	-- prom
    -- valor max y min
select sexo, count(*) from empleado group by sexo; -- cuenta todos los elementos que hay en un grupo 

select sexo, count(*) num_empleadaos, sum(sueldo) sueldo_total, max(sueldo) sueldo_maximo, min(sueldo) sueldo_minimo, avg(sueldo) sueldo_proimedio from empleado group by sexo;

select deptono, count(*) num_empleadaos, sum(sueldo) sueldo_total, max(sueldo) sueldo_maximo, min(sueldo) sueldo_minimo, avg(sueldo) sueldo_proimedio from empleado group by deptono; -- cambiamos de grupo

select deptono, sexo, count(*) num_empleadaos, sum(sueldo) sueldo_total, max(sueldo) sueldo_maximo, min(sueldo) sueldo_minimo, avg(sueldo) sueldo_proimedio from empleado group by deptono, sexo;

select deptono, count(*) num_empleadaos, sum(sueldo) sueldo_total, max(sueldo) sueldo_maximo, min(sueldo) sueldo_minimo, avg(sueldo) sueldo_proimedio from empleado 
where sexo = 'F'
group by deptono;-- filtra, agrupa y muestra

-- having filtra resultados de funciones de agregacion
select deptono, count(*) num_empleadaos, sum(sueldo) sueldo_total, max(sueldo) sueldo_maximo, min(sueldo) sueldo_minimo, avg(sueldo) sueldo_proimedio from empleado 
where sexo = 'F'
group by deptono
having count(*) > 1;

select enombre, count(*) nemp from empleado group by enombre having count(*) > 1;
	-- condiciones para campos con where, condiciones para funciones de agrehacion con having
    
select * from empleado;

-- ORDER BY 

-- ordenamos nombnre por paterno
select * from empleado order by epaterno, 3, enombre; -- oredanmos por nombre de campo y por numero de campo
select * from empleado order by  6 desc, epaterno, 3, enombre; -- desc orden descentende

select enombre, count(*) nemp
from empleado
group by enombre
having count(*) > 1
order by 2 desc; -- mostramos los nombres que mas se repiten 

-- LIMIT: limita el numero de renglones que vemo
select * from empleado limit 5; -- los primeros 5
select * from empleado limit 5, 5; -- a partir de n quiero otros n
select * from empleado limit 5, 15;-- a ártir de 5 quiero que me muestre otros 15

select enombre, count(*) nemp
from empleado
group by enombre
having count(*) > 1
order by 2 desc, 1
limit 3;

-- teniendo todos las calusulas
select enombre, count(*) nemp
from empleado
where sexo = 'M'
group by enombre
having count(*) > 1
order by 2 desc, 1
limit 3; -- mostramos los nombres que mas se repiten  