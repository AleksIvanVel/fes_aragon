-- insert insertar regisgtros en la tabla
-- update actualiza datos existentes
-- delete elimina datos 

use testbd;
SELECT * from escritor;

insert into escritor values --  forma 1 en que insertamos datos 
(null, 'GABRIEL', 'GARCIA', 'MARQUEZ', 'COLOMBIANA', 'GABO');

insert into escritor (nombre, ap_paterno) values
('OCTAVIO', 'PAZ'); -- constrain default 'MEXICANA'

insert into escritor (id_escritor, nombre, ap_paterno) values
(3, 'OCTAVIO', 'PAZ'); -- tiene la PK duplicada

insert into escritor (nombre) values
('FERNANDA'); -- CONSTRAIN NOT NULL EN AP_PATERNO

insert into escritor (ap_paterno, nombre, nacionalidad) values
('MELCHOR', 'FERNANDA', null); -- INSERTAMOS NULL EN 'NACIONALIDAD'

-- INSERTAR VARIAS COSAS AL MISMO TIEMPO 
insert into escritor (nombre, ap_paterno, nacionalidad) 
values 
('ELENA', 'GARRO', 'MEXICANA'),
('AMPARO','DAVILA','MEXICANA'),
('CARLOS','FUENTES','MEXICANA'),
('ISAAC','ASIMOV','EUA');

-- utilizando la calusula set CAMPO = VALOR
insert into escritor 
set nombre = 'ROSARIO', ap_paterno = 'CASTELLANOS', nacionalidad = 'MEXICANA';

-- creando una tabla temporal
create temporary table escritor_tmp like escritor;
select * from escritor_tmp;

insert into escritor_tmp
select * from escritor; -- insertamos los mismos datos mientras tenga el mismo numero de campos


-- generar una nueva tabla con una estructura modificable que contenga los mismos campos que otra
create temporary table escritor_tmp2 as select id_escritor, nombre, ap_paterno, nacionalidad, alias
from escritor;
desc escritor_tmp2;

use testbd;
select * from escritor_tmp2;

-- COMANDO UPDATE  
update escritor set nacionalidad = 'MX'; -- sin filtro afecta todos los valores 

-- FILTRAR CON WHERE
update escritor set nacionalidad = 'COLOMBIANA'
WHERE alias = 'GABO';

update escritor set nacionalidad = 'MEXICANA'
WHERE alias is null;

update escritor set nacionalidad = 'EUA'
WHERE id_escritor = 8;

update escritor set nacionalidad = 'COLOMBIANA',
ap_materno = null
WHERE alias = 'GABO';

show variables like '%safe%'; -- muestra todas las variables del sistema
set sql_safe_updates = 0;


-- COMANDO DELETE
delete from escritor where 
id_escritor > 9 or id_escritor = 2;

insert into escritor values  
(100, 'GABRIEL', 'GARCIA', 'MARQUEZ', 'COLOMBIANA', 'GABO');

insert into escritor values  
(null, 'GABRIEL', 'GARCIA', 'MARQUEZ', 'COLOMBIANA', 'GABO');

select * from escritor;

delete from escritor; -- elimina los datos sin el auto incremental 

insert into escritor values  
(null, 'GABRIEL', 'GARCIA', 'MARQUEZ', 'COLOMBIANA', 'GABO');

select * from escritor_tmp;
truncate table escritor_tmp; -- vacia la tabla por completo
insert into escritor_tmp values  
(null, 'GABRIEL', 'GARCIA', 'MARQUEZ', 'COLOMBIANA', 'GABO');

select * from escritor_tmp;

-- INTEGRIDAD REFERENCIAL
select * from escritor;
select * from libro; 

insert into libro values (null, 1000,'Libro X', null, null);

insert into libro values (null, 102,'100 años de soledad', null, null);

insert into libro values (null, 102,'El amor en tiempos de colera', null, null),
(null, 102,'El coronel no tiene quien le escriba', null, null),
(null, 106,'Yo robot', null, null),
(null, 106,'Fundacion', null, null);

update escritor set id_escritor = id_escritor + 100
where id_escritor > 103;

delete from escritor where id_escritor in(102,206);