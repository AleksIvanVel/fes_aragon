use	testbd;
select database();

show databases; -- information_schema diccionario de datos de MySQL 
show tables; -- muestra las tablas de las bases de datos donde estamos conectados
show tables from information_schema; -- muestra tabalas de una bd especifica
show variables; -- muestra todas la varibales del sistema  la tabla que se muestra se conoce como record set

-- eliminacion de tablas

-- creacion de tablas 
create table escritor(
	id_escritor int not null auto_increment primary key,
    nombre varchar(50) not null,
    ap_paterno varchar(50) not null,
    ap_materno varchar(50) null,
    nacionalidad varchar(30) null default 'MEXICANA',
    alias varchar(30)
);

show tables;

describe escritor; -- muestra la estructura de la tabla indicada 
show columns from escritor; -- muestra la estructura de la tabla indicada 
show index from escritor; -- muestra los indices de la tabla especificada 

create table libro (
	id_libro int not null auto_increment,
    id_escritor int null, -- fk
    titulo varchar(50) not null,
    contenido text null,
    primary key(id_libro), -- otra forma de declarar pk, para pk compuesta primary key (n, m, o)
    foreign key(id_escritor) references escritor(id_escritor) -- llave foranea realcion punteada
    on delete cascade on update set null 	-- integridad referencial 
);

describe libro;
show index from libro;

alter table libro add unique uk_titulo (titulo); -- cambiar estructura de la tabla 
alter table libro modify id_libro int not null; -- modifica la columna especificada de la tabla indicada 
alter table libro drop primary key; -- quitamos elementos especificos de la tabla indicada

alter table libro modify id_libro int not null auto_increment, 
add primary key(id_libro);  -- se hacen dos cambios a la estructura de la tbala en un solo

alter table libro add column abstrac varchar(300) null; -- agregar una columna al final de la tabla
alter table libro add categoria int null after titulo; -- agregar una columna despues de una indicada

alter table libro drop categoria,
change abstrac resumen varchar(300); -- cambiamos un nombre a un campo 



create table if not exists autor(
	id_escritor int not null auto_increment primary key,
    nombre varchar(50) not null,
    ap_paterno varchar(50) not null,
    ap_materno varchar(50) null,
    nacionalidad varchar(30) null default 'MEXICANA',
    alias varchar(30)
);

drop table autor;

create temporary table if not exists autor_tmp(  -- tablas temporales que cuando se cierra la sesion se elimina 
	id_escritor int not null auto_increment primary key,
    nombre varchar(50) not null,
    ap_paterno varchar(50) not null,
    ap_materno varchar(50) null,
    nacionalidad varchar(30) null default 'MEXICANA',
    alias varchar(30)
);

select * from autor_tmp;
use testbd;
show tables;

-- creamos una nueva base de datos

create database testbd2;
create table testbd2.escritor like testbd.escritor; -- copiamos una estructura de otra base de datos
show tables from testbd2;

desc testbd2.escritor;

show create table escritor;

CREATE TABLE `escritor` (
  `id_escritor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ap_paterno` varchar(50) NOT NULL,
  `ap_materno` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(30) DEFAULT 'MEXICANA',
  `alias` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_escritor`)
);

rename table testbd2.escritor to testbd2.escribano; -- renombramos una tabla de una base de datos especifica 

show tables from testbd2;

rename table testbd2.escribano to testbd.escribano; -- movemos la tabla de base de datos 

show tables from testbd;

drop table autor, escribano;

select * from information_schema.tables
where table_schema = 'testbd'; -- filtramos datos
