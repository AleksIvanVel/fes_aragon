use colegio;
select * from alumnos;

-- filtrar con where
select * from alumnos
where sexo = 'F';

select * from alumnos
where sexo = 'F' and estatura > 0;

select * from alumnos
where sexo = 'F' or estatura > 0;

-- jerarquia de selccion 
select * from alumnos
where (sexo = 'F' and estatura > 0) or ciudad <> 'QUERETARO'; -- '<>' DIFERENTE DE 

select distinct nombre from alumnos
where sexo = 'F'
order by 1;

select * from alumnos
where sexo = 'F'
and (nombre = 'ALICIA' OR nombre = 'WENDY' OR nombre = 'ALEJANDRA' OR nombre = 'ANA PAULA')
order by 1;  

-- TAMBIEN SE PUEDE NEGAR LA CONDICIONS
select * from alumnos
where sexo = 'F'
and NOT (nombre = 'ALICIA' OR nombre = 'WENDY' OR nombre = 'ALEJANDRA' OR nombre = 'ANA PAULA')
order by nombre;

-- SE PUEDE EVALUAR ELEMENTOS DE UNA LISTA
select * from alumnos
where sexo = 'F'
and nombre IN( 'ALICIA', 'WENDY', 'ALEJANDRA', 'ANA PAULA', 'PATITO23') -- evalua una lista de valores
order by nombre;

-- elementos en una lista NEGADA: lo que sea que no esta en la lista 
select * from alumnos
where sexo = 'F'
and nombre NOT in( 'ALICIA', 'WENDY', 'ALEJANDRA', 'ANA PAULA', 'PATITO23')
order by nombre;

select * from alumnos
where estatura >= 1.60 and estatura <= 1.69 
order by sexo, estatura DESC; -- alumnos que miden entre 1.60 y 1.69

select * from alumnos
where (estatura >= 1.60 and estatura <= 1.69) and sexo = 'M'
order by sexo, estatura DESC; -- alumnos hombres que miden entre 1.60 y 1.69

-- OPERADOR BEETWEN PARA RANGOS
select * from alumnos
where estatura between 1.60 and 1.69 and sexo = 'M'
order by sexo, estatura DESC; -- alumnos hombres que miden entre 1.60 y 1.69

-- beetwen negado
select * from alumnos
where estatura NOT between 1.60 and 1.69 and sexo = 'M'
order by sexo, estatura DESC; -- alumnos hombres que NO miden entre 1.60 y 1.69

select distinct nombre from alumnos order by 1; -- retorna nombres unicos (no repetidos)

select distinct nombre from alumnos 
where nombre between 'oso' and 'pato'
order by 1;  

select distinct nombre from alumnos 
where nombre between 'o' and 'q' -- desde o hasta p
order by 1; 

select distinct nombre from alumnos 
where nombre between 'od' and 'q' -- desde od hasta q
order by 1; 

select distinct fedita from alumnos order by 1 desc;

select distinct nombre, fedita from alumnos 
where fedita between '2018-03-14 00:00:00' and '2018-03-14 23:59:59' order by 1 desc;

select distinct nombre, fedita from alumnos 
where NOT fedita between '2018-03-14 00:00:00' and '2018-03-14 23:59:59' order by 1 desc;

-- INTERSECCION
select * from pagos order by 1;

select distinct clave_alu from pagos order by 1;

	-- consultas anidadas 
	select * from alumnos 
	where clave_alu in (select distinct clave_alu from pagos) -- alumnos que hayan hecho pagos
	order by 1;

	select * from alumnos 
	where clave_alu NOT in (select distinct clave_alu from pagos) -- alumnos que no hayan hecho pagos
	order by 1;
    
select * from alumnos
where nombre = 'alejandra';

-- LIKE busca sub cadenas dentro de cadenas 
select * from alumnos
where nombre like 'alejandra'; -- like sin ningun comodin funciona como el =

select * from alumnos
where nombre like '%alejandra%'; -- like %'n'% representa cualquier cadena que contenga alejandra, no importa que haya antes o despues 

-- nombres que comienzan con alejandra
select * from alumnos
where nombre like 'alejandra%'; -- like 'n'%  representa cadena que comienza con

-- nombres que termina con alejandra
select * from alumnos
where nombre like '%alejandra'; -- like %'n'  representa cadena que termina  con

select * from alumnos
where nombre like '% alejandra'; -- like '% n' representa cualquier cadena que contenga n alejandra,

-- todos los alumnos que contengan una letra a en su nombre
select * from alumnos
where nombre like '%a%' order by 1;

 -- COMODIN DE POSICIONES _
 
select * from alumnos
where nombre like '____' order by 1; -- nombres de alumnos que tengan 4 caracteres 

-- alumnos que tengan una 'a' en la tercer posicion
select nombre from alumnos
where nombre like '__a%' order by 1;

-- alumnos que tengan una 'a' en la tercer posicion y terminen en una 'a'
select nombre from alumnos
where nombre like '__a%a' order by 1;

-- alumnos que NO tengan una 'a' en la tercer posicion y terminen en una 'a'
select nombre from alumnos
where nombre NOT like '__a%a' order by 1;

select nombre, CURP from alumnos
where curp like '____93%' order by 1; -- alumnos que hayan nacido en el 93 respecto a su CURP

select nombre, CURP from alumnos
where curp like '____93____M%' order by 1; -- alumnos que hayan nacido en el 93 respecto a su CURP y sean de sexo M

select distinct ciudad from alumnos order by 1;

select distinct ciudad from alumnos 
where ciudad like '%quer%' or ciudad like '%qro%'
order by 1;

-- OPCION 1
create temporary table alumnos_tmp as select * from alumnos;

-- OPCION 2
create temporary table alumnos_tmp2 like alumnos;
insert into alumnos_tmp2 select * from alumnos;

describe alumnos_tmp2;
select distinct ciudad from alumnos_tmp 
where ciudad like '%quer%' or ciudad like '%qro%'
order by 1;

update alumnos_tmp set ciudad = 'QUERETARO' where ciudad like '%quer%' or ciudad like '%qro%';
select * from alumnos_tmp;

select nombre, email from alumnos 
where email like '%@%.%';

select nombre, email from alumnos 
where email NOT like '%@%.%';


-- FUNCIONES DE CADENA 
	-- length  longitud de la cadena
    -- right   a paritr de la derecha 4 caracteres
    -- left    a partir de la izqueirda 4 caracteres
    -- mid   
    -- substr 
	select nombre, length(nombre), right(nombre, 4), left(nombre,4), mid(nombre,4,4), substr(nombre,4), substr(nombre,4,4) 
    from alumnos order by 1; 
    
    select nombre, locate(nombre, 'a'), locate('a', nombre,7)  -- localiza la primera aparcicion de una subcadena  
    from alumnos order by 1; 
    
    -- todos los alumnos que tengan mas de un nombre 
    -- FORMA 1
		select nombre from alumnos
		where locate(' ', nombre) > 0
		order by 1;
    
    -- FORMA 2
		select nombre from alumnos
		where nombre like '% %'
		order by 1;
        
	-- LOS 10 NOMBRES MAS LARGOS CON LENGTH
		select nombre, length(nombre) largo from alumnos
        order by 2 desc 
        limit 10;
        
        select length(nombre) largo, count(*) num_registros from alumnos
        group by length(nombre) 
        order by 2 desc;
        
        select length(nombre) largo, count(*) num_registros from alumnos
        group by length(nombre)
        having count(*) >= 70
        order by 2 desc;
        
        select nombre from alumnos
        where length(nombre) = 7 
        order by 1 desc;


        