use colegio;

select nombre,curp, email
from alumnos
where nombre like '%jose%';

-- BINARY activa busqueda sensible a mayusculas
select nombre,curp, email
from alumnos
where BINARY nombre like '%jose%';

-- obtenemos el resultado logico de una operacion
select nombre,curp, email, BINARY nombre like 'jose', BINARY nombre like 'JOSE'
from alumnos
where nombre like 'jose';

select nombre,curp, email, BINARY nombre like 'jose', BINARY nombre like 'JOSE', sexo = 'f'
from alumnos
where nombre like 'jose';

-- lower() pasa todo a minisculas en la proyeccion
-- upper() pasa todo a mayuculas en la proyeccion
select nombre,curp, email, lower(nombre), upper(email)
from alumnos
where BINARY lower(nombre) like '%jose%';


-- pasamos el estado de la base a mayuculas 
-- update alumnos set email= upper(email) where email <> ' ';

-- concat()
select concat(nombre, ' ', ap_paterno, ' ', ap_materno) alumno, curp, email from alumnos;

-- concat ws() concatena todos los paramtreo y pone en medio el promer parametro que pongamos
select concat_ws(' ', nombre, ap_paterno, ap_materno) alumno, curp, email from alumnos;

-- replace() reemplaza cadenas dentro de otras cadenas, 1- donde lo va a busca, 2- que va a reemplaza, 3- con que lo va a reemplazar
select replace(nombre, 'A', '4') alumno, curp, email from alumnos;

select replace(nombre, 'JOSE', 'JUAN') alumno ,curp, email from alumnos
where nombre like '%jose%';


-- buscamos alumnos que no tengan un email valido o no tengan alguno 
select nombre,curp, email from alumnos
where email not like '%@%';

-- les ponemos un email 
select nombre,ap_paterno, sexo, curp, email,
replace(lower(concat(left(nombre, 1),'.', ap_paterno, '@aragon.mx')), ' ', '_') nuevo_email
from alumnos
where email not like '%@%';

update alumnos set email = replace(lower(concat(left(nombre, 1),'.', ap_paterno, '@aragon.mx')), ' ', '_') 
where email not like '%@%'; 

select nombre,ap_paterno, ap_materno, curp, email from alumnos
where email like '%@aragon.mx%';

-- if(condicion, que pasa si es v, que pasa si es f)
select nombre,ap_paterno, ap_materno, sexo, curp, email, 
if (sexo= 'F', 'FEMENINO', '') f
from alumnos where email like '%@aragon.mx%';

-- if anidado
select nombre,ap_paterno, ap_materno, sexo, curp, email, 
if (
	sexo= 'F', 'FEMENINO', 
	if (
		sexo= 'M', 'MASCULINO', 'NO DEFINIDO'
        )
	) genero
from alumnos where email like '%@aragon.mx%';

select nombre,ap_paterno, sexo, curp, email,
replace(lower(concat(left(nombre, 1),'.', ap_paterno, 
		if(sexo='', '@fes.mx', '@unam.mx'))), ' ', '_') nuevo_email
from alumnos
where email like '%@aragon.mx%';

select nombre,ap_paterno, sexo, curp, email,
if(length(curp) <> 18, 'sin curp', curp ) curp -- si tiene un curp invalido le ponemos "sin curp"
from alumnos where email like '%@aragon.mx%';  

select nombre,
locate(' ', nombre),
left(nombre, locate(' ', nombre) -1),
mid(nombre, locate(' ', nombre) + 1),
if(locate(' ', nombre)=0, nombre, left(nombre, locate(' ', nombre) -1)) nombre_1,
if(locate(' ', nombre)=0, '', mid(nombre, locate(' ', nombre) + 1)) nombre_2
from alumnos; -- separa en campos diferentes los nombres de los alumnos

-- repeat() repite n veces el paramtero dado 
select nombre, repeat(nombre,3) from alumnos;


-- cereando un CSV
	-- forma 1
	select concat_ws(',', nombre, ap_paterno, ap_materno, curp, email) datos
	from alumnos where nombre like '%jose%';


	-- forma 2 con export 
	select nombre, ap_paterno, ap_materno, curp, email
	from alumnos where nombre like '%jose%';

-- crando una variable  
	set @b = ' ';
    
-- elnombre mas largo
    select length(nombre) from alumnos
	order by 1 desc
    limit 1;
    
    select max(length(nombre)) ln, max(length(ap_paterno)) lp, max(length(ap_materno)) lm from alumnos; -- nombre, appelido paterno y apellido materno mas largos 
    
    select concat(
    nombre, repeat(@b, 30-length(nombre)),
    ap_paterno, repeat(@b, 30-length(ap_paterno)),
    ap_materno, repeat(@b, 30-length(ap_materno)),
    sexo, repeat(@b, 1-length(sexo)),
    curp, repeat(@b, 18-length(curp))
    ) datos
    from alumnos where nombre like '%jose%'
    into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\alumnos.txt';
    
    show variables like '%secure%';