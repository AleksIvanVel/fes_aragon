-- 1 Crear una BD llamada Ejercicio5
create database ejercicio5;
use ejercicio5;


-- 2 Crear las tablas personal, producto y certificación en la BD Ejercicio5 cada tabla debe tener al menos 5 campos, una PK, un dato tipo date y un dato tipo numérico 
create table personal(
	id_personal int not null primary key auto_increment,
    nombre varchar(50) not null,
    ap_paterno varchar(50) not null,
    ap_materno varchar(50),
    fecha_nacimiento date not null
);
show tables;
describe personal;

create table producto(
	id_producto int not null primary key,
    nombre_producto varchar(100) not null,
    marca_producto varchar(100) not null,
    descripcion_producto text null,
    fecha_expiracion date null
);
show tables;
describe producto;

create table certificacion(
	id_certificacion int not null primary key,
    fecha_certificacion date not null,
    descripcion_certificacion text null,
    
    -- 3 La tabla personal y certificacion deben tener una relación de cardinalidad 1:n con reglas de 		 integridad referencial
    id_personal int not null,
    foreign key(id_personal) references personal(id_personal)
    on delete cascade on update cascade
);
show tables;
describe certificacion;

-- 4 Agregar un índice único a cada tabla usando ALTER
alter table personal add index nombre(nombre, ap_paterno, ap_materno);
alter table producto add index producto(nombre_producto, marca_producto);
alter table certificacion add index pertenece_a(id_personal, fecha_certificacion);
show index from certificacion;

-- 5 Eliminar el índice único de la tabla producto usando ALTER
alter table producto drop index producto;
show index from producto;

-- 6 Agregar un campo precio de tipo entero en la tabla producto, dejar este campo en la penúltima posición usando ALTER
alter table producto add column precio int not null after descripcion_producto; 
describe producto;

-- 7 Cambiar el tipo de dato del campo precio a decimal(10,2)
alter table producto modify precio decimal(10,2) not null;
describe producto;

-- 8 Cambiar el nombre a la tabla personal por empleado
alter table personal rename empleado;
show tables;

-- 9 Eliminar uno de los campos de la tabla certificacion
describe certificacion;
alter table certificacion drop descripcion_certificacion; 

-- 10 Eliminar la PK de la tabla producto
alter table producto drop primary key;
describe producto;

-- 11 Crear una BD llamada Ejercicio5b
create database ejercicio5b;
show tables from ejercicio5b;

-- 12 Copiar las tablas personal y producto en la BD Ejercicio5b
create table ejercicio5b.personal like ejercicio5.empleado;
create table ejercicio5b.producto like ejercicio5.producto;
show tables;
describe producto;

-- 13 Crear una tabla producto_tmp y cargar todos los datos de productos con una sola instrucción
create temporary table ejercicio5b.producto_tmp like ejercicio5b.producto;
describe producto_tmp;

-- 14 Mostrar las tablas creadas en la tabla information_schema
select * from information_schema.tables
where table_schema = 'ejercicio5';

-- 15 Eliminar las BD Ejercicio5 y Ejercicio5b