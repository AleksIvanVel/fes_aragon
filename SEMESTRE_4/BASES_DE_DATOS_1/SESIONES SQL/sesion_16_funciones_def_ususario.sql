use colegio;

-- FUNCIONES DEFINIDAS POR EL USUSARIO; objeto de la base de datos que se pueden cambiar 
	show function status;
    
-- funciones de una base de dtaos en particular 
	show function status where db = 'colegio';
    
-- puede tener sencias sql por lo que tenemos que cambiar el delimitador 
	delimiter $$
    drop function if exists saludo $$
    create function saludo(str varchar(100))
    returns varchar(100)
    deterministic
    begin
		declare resultado varchar(150) default '';
        declare hora int default 0;
        
        set hora = hour(sysdate());
        case
			when hora between 1 AND 11 then set resultado = concat('Buenos dias ', str);
            when hora between 12 AND 16 then set resultado = concat('Buenas tardes ', str);
            when hora between 19 AND 23 then set resultado = concat('Buenas noches ', str);
            else set resultado = concat('HOLA ', str);
        end case;
        return resultado;
    end $$
    delimiter ;
    
    -- PARA SABER QUE SUCEDE CON UNA FUNCION
		show create function saludo;
        delimiter $$
        CREATE DEFINER=`root`@`localhost` FUNCTION `saludo`(str varchar(100)) RETURNS varchar(100) CHARSET utf8mb4
		DETERMINISTIC
		begin
		declare resultado varchar(150) default '';
        declare hora int default 0;
        
        set hora = hour(sysdate());
        case
			when hora between 1 AND 11 then set resultado = concat('Buenos dias ', str);
            when hora between 12 AND 16 then set resultado = concat('Buenas tardes ', str);
            when hora between 19 AND 23 then set resultado = concat('Buenas noches ', str);
            else set resultado = concat('HOLA ', str);
        end case;
        return resultado;
    end $$
    delimiter ;
    
    select saludo('jelow');
    
    select nombre, fedita, saludo(nombre) saludo from alumnos;
    
    -- VERSION DE SALUDO NO. 2
       delimiter $$
    drop function if exists saludo $$
    create function saludo(str varchar(100), fecha datetime)
    returns varchar(100)
    deterministic
    begin
		declare resultado varchar(150) default '';
        declare hora int default 0;
        
        set hora = hour(fecha);
        case
			when hora between 1 AND 11 then set resultado = concat('Buenos dias ', str);
            when hora between 12 AND 16 then set resultado = concat('Buenas tardes ', str);
            when hora between 19 AND 23 then set resultado = concat('Buenas noches ', str);
            else set resultado = concat('HOLA ', str);
        end case;
        return resultado;
    end $$
    delimiter ;
    
	select saludo('jelow', '2023-05-04 15:00:00');
	select nombre, fedita, saludo(nombre, fedita) saludo from alumnos;
    
    
-- SE PUEDEN CONCATENAR FUNCIONES O ANIDAR
    select nombre, fedita, saludo(concat_ws(' ', nombre, ap_paterno, ap_materno), fedita) saludo from alumnos;
     

-- CREANDO FUNCION 'PROMEDIO'

  delimiter $$
    drop function if exists promedio $$
    create function promedio(
								matricula varchar(10),
                                curso varchar(10))
    returns decimal(10,2)
    reads sql data -- funciona para ller datos de una consulta sql
    deterministic
    begin
		declare nmat int;
        declare suma float;
        declare resultado decimal(10,2) default 0;
        
        
        select count(clave_mat) into nmat
        from(select * from evaluaciones where clave_alu= matricula and id_curso = curso) e join 
        materias m using(clave_mat) where  promedia = 1;
        
        select sum(calificacion) into suma from evaluaciones where clave_alu = matricula and id_curso = curso;
        
        set resultado = format((suma / nmat), 2);
        return resultado;
    end $$
    delimiter ;
    
    select promedio('11070116', 'C013');
    
    select * from (
    select a.clave_alu, concat_ws(' ', a.nombre, ap_paterno, ap_materno) alumno, abreviatura curso, promedio(a.clave_alu, sa.id_curso) promedio
    from alumno_salon sa natural join alumnos a
    JOIN cursos c on(sa.id_curso = c.id_curso)) x
    where promedio is not null;
    
    
-- version dos de funcion PROMEDIO
  delimiter $$
    drop function if exists promedio $$
    create function promedio(
								matricula varchar(10),
                                curso varchar(10))
    returns decimal(10,2)
    reads sql data -- funciona para ller datos de una consulta sql
    deterministic
    begin
        declare resultado decimal(10,2) default 0;
        
        
        select format(avg(e.calificacion),2) into resultado
        from(select * from evaluaciones where clave_alu= matricula and id_curso = curso) e join 
        materias m using(clave_mat) where  promedia = 1;

        return resultado;
    end $$
    delimiter ;


-- creando otra funcion

 delimiter $$
    drop function if exists edad $$
    create function edad(fecha date)
    returns varchar(255)
    deterministic
    begin 
		return concat_ws(' ',
        year(from_days(datediff(now(), fecha))), 'AÑOS',
        month(from_days(datediff(now(), fecha))), 'MESES',
        day(from_days(datediff(now(), fecha))), 'DIAS');
    
    end $$
    delimiter ;
    
select clave_alu, concat_ws(' ', nombre, ap_paterno, ap_materno) alumno, fedita, edad(fedita) edad from alumnos;
    
    
    select * from pagos;
    
    