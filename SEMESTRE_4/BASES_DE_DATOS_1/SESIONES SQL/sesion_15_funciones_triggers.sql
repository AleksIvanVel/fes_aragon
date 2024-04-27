use colegio;


-- FUNCIONES se manda a llamara dentro de cada select 

-- TRIGGERS  objetos que se guardan en la base de datos, procedimientos alamcenados que se disparan cuando algo sucede... insert update delete sobre una tabla en particular, cada tabla pude tener tres triggers diferentes 

-- TIPOS DE TRIGGERS row triggers y satatement triggers... 
-- INSERT -> NEW, UPDATE -> NEW y OLD, DELETE -> OLD
-- VALIDAR DATOS BEFORE, GUARDAR O RESPALDAR DATOS AFTER
-- DELIMITER // luego lo regresamos con DELIMITER ;

-- SINTAXIS CRERATE TRIGGER <NOMBRE DE TRIGGER>, BEFORE|AFTER, INSERT|UPDATE|DELETE, ON <NOMBRE DE TABLA>, FOR EACH ROW|FOR EACH STATEMENT <sentencias sql>


describe information_schema.triggers;

select trigger_name, event_manipulation, event_object_table, action_statement from information_schema.triggers
where trigger_schema= 'colegio';

select * from niveles;
select * from grados; 

insert into niveles values(null, 'ico');

delimiter $$
drop trigger if exists bi_niveles $$ 
create trigger bi_niveles
before insert on niveles
for each row 
begin
	if (not new.nombre rlike '(ingenieria|licenciatura)') then
		signal sqlstate'45000'
        set message_text = 'El nombre del nivel no es valido';
    end if;
    
	SET NEW.id_nivel = NEW.id_nivel + 100;
	SET NEW.NOMBRE = upper(new.NOMBRE);
end $$
delimiter ;

insert into niveles values (30, 'computacion');

select * from niveles;
select * from grados;

delimiter $$
drop trigger if exists ai_niveles $$ 
create trigger ai_niveles
after insert on niveles
for each row 
begin
	insert into grados values(new.id_nivel, new.nombre);
end $$
delimiter ;

select trigger_name, event_manipulation, event_object_table, action_statement from information_schema.triggers
where trigger_schema= 'colegio';

alter table grados modify nombre varchar(50) not null;

insert into niveles values (40, 'ingenieria en computacion'),(50, 'ingenieria industrial'), (60, 'licenciatura en derecho');

select * from niveles;
select * from grados;


drop table if exists bitacora;
create table bitacora(
	id int not null auto_increment primary key,
    fecha datetime not null,
    ususario varchar(50) not null,
    tabla varchar(50) not null,
    sentencia varchar(50) not null,
    accion text null
    );
    
    select * from bitacora;

delimiter $$
drop trigger if exists ad_niveles $$ 
create trigger ad_niveles
after DELETE on niveles
for each row 
begin
	insert into bitacora values(
		null,
        sysdate(),
        user(),
        'NIVELES',
        'DELETE',
       -- json_object("id_nivel", old.id_nivel,'nombre', old.nombre) -- bitacora en formato json
       concat_ws('|', OLD.id_nivel, OLD.nombre)
    );
end $$
delimiter ;



delete from niveles where id_nivel >= 7;
select * from niveles;
select * from bitacora;


delimiter $$
drop trigger if exists au_niveles $$ 
create trigger au_niveles
after UPDATE on niveles
for each row 
begin
	insert into bitacora values(
		null,
        sysdate(),
        user(),
        'NIVELES',
        'UPDATE',
       json_object("OLD_id_nivel", old.id_nivel, 'id_nivel', new.id_nivel, 'OLD_nombre', old.nombre, 'nombre', new.nombre) 
       -- bitacora en formato json
    );
end $$
delimiter ;

update niveles set id_nivel = id_nivel + 1000, nombre = concat_ws('NIV', nombre);
update niveles set id_nivel = id_nivel - 1000, nombre = mid(nombre,5);
select * from niveles;
select * from bitacora;

