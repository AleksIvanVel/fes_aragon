use colegio;

select * from salones;
-- conformado por las siguientes tablas
select * from niveles;
select * from grados;
select * from cursos;

select * from salones s, niveles n
where s.id_nivel = n.id_nivel; -- hay dos llaves que no hacen match
-- nombre del descriptor BACHILLERATO no nivel 4

-- operador JOIN
-- forma 1
select * 
from salones s JOIN niveles n
ON(s.id_nivel = n.id_nivel); -- JOIN es mas rapido que el operador ","

-- forma 2
select * 
from salones s JOIN niveles n
USING(id_nivel); -- la usamos cuando la llave primaria y la llave froanea se llaman igual
-- deja un solo id, en este caso el primer id_nivel que encuentra

-- forma 3
select * 
from salones s NATURAL JOIN niveles n; -- -- la usamos cuando la llave primaria y la llave froanea se llaman igual

-- LEFT JOIN 
-- muestra todos los renglones de la izquierda aunque no tenga correspondencia con los de la derecha
select * 
from salones s LEFT JOIN niveles n
ON(s.id_nivel = n.id_nivel)
order by n.id_nivel; -- rellena los salones que hacen falta 

-- muestra solo los renglones de la izquierda aunque no tenga correspondencia con los de la derecha
select*
from salones s LEFT JOIN niveles n
ON(s.id_nivel = n.id_nivel)
where n.id_nivel is null
order by n.id_nivel;  -- dos salones que no tienen un nivel valido 


select * 
from salones s LEFT JOIN niveles n
USING(id_nivel)
order by n.id_nivel; -- en este caso se queda el id_nivel de la tabla salones

select * 
from salones s NATURAL LEFT JOIN niveles n
order by n.id_nivel; 

-- RIGTH LEF
select * 
from salones s RIGHT JOIN niveles n
ON(s.id_nivel = n.id_nivel)
order by n.id_nivel desc; -- todos los renglones de la derecha aunque no tengan correspondencia con los de la izq

-- nivlees que no tiene ningun salon registrado
select * 
from salones s RIGHT JOIN niveles n
ON(s.id_nivel = n.id_nivel)
where s.id_nivel is null
order by n.id_nivel desc;

-- modificamos la proyeccion
select n.*, s.*
from salones s RIGHT JOIN niveles n
ON(s.id_nivel = n.id_nivel)
where s.id_nivel is null
order by n.id_nivel desc;



select * from salones s  -- left del join con niveles
JOIN niveles n ON(s.id_nivel = n.id_nivel)-- el resultado de esos dos son el left del join con grados
JOIN grados g ON(s.id_grado = g.id_grado)
JOIN cursos c ON(s.id_curso = c.id_curso);


-- cambiamos la presentacion de los datos en la proyeccion
select s.id_salon, observaciones salon, tipo_grupo, n.nombre nivel, 
g.nombre grado, c.abreviatura curso
from salones s 
LEFT JOIN niveles n ON(s.id_nivel = n.id_nivel)
JOIN grados g ON(s.id_grado = g.id_grado)
JOIN cursos c ON(s.id_curso = c.id_curso);

select s.id_salon, observaciones salon, tipo_grupo, n.nombre nivel, 
g.nombre grado, c.abreviatura curso
from salones s 
LEFT JOIN niveles n ON(s.id_nivel = n.id_nivel)
JOIN grados g ON(s.id_grado = g.id_grado)
JOIN cursos c ON(s.id_curso = c.id_curso)
where n.nombre = 'SECUNDARIA'
order by g.nombre; -- el filtro es por el nombre del campo no por el id

-- FULL OUTER JOIN 
	-- se utiliza el union (suma)
    select id_nivel clave, nombre item, 'nivel' tipo from niveles
    UNION
	select id_grado, nombre, 'grado' from grados
    UNION
	select id_curso, nombre, 'curso' from cursos;-- se permite todo menos order by 
    
    
    select * from (select id_nivel clave, nombre item, 'nivel' tipo from niveles
    UNION
	select id_grado, nombre, 'grado' from grados
    UNION
	select id_curso, nombre, 'curso' from cursos) u
    where u.clave <= 5;
    
    select id_nivel clave, nombre item, 'nivel' tipo from niveles
    UNION
    select id_nivel clave, nombre item, 'nivel' tipo from niveles; -- cuando los datos son repetidos el union funciona como un distinct
    
    -- UNION ALL
	select id_nivel clave, nombre item, 'nivel' tipo from niveles
    UNION ALL
    select id_nivel clave, nombre item, 'nivel' tipo from niveles
    UNION ALL
    select id_nivel clave, nombre item, 'nivel' tipo from niveles;
    -- forza a que todos los datos se muestren
    
-- FULL OUTER JOIN 
select * from salones s LEFT JOIN niveles n 
ON(s.id_nivel = n.id_nivel)
UNION
select * from salones s RIGHT JOIN niveles n 
ON(s.id_nivel = n.id_nivel);


select * from salones s LEFT JOIN niveles n 
ON(s.id_nivel = n.id_nivel)
where n.id_nivel is NULL
UNION
select * from salones s RIGHT JOIN niveles n 
ON(s.id_nivel = n.id_nivel)
where s.id_nivel is NULL;



select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno,
sum(pago) total_pagos, count(*) num_pagos, max(fecha_pago) 
from alumnos a NATURAL JOIN pagos p
group by a.clave_alu;

-- todos los alumnos y los pagos que han hecho 
select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno,
sum(pago) total_pagos, count(pago) num_pagos, max(fecha_pago) 
from alumnos a 
NATURAL LEFT JOIN pagos p
group by a.clave_alu
order by 4, 2 desc;

select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno,
sum(pago) total_pagos, count(pago) num_pagos, max(fecha_pago) 
from alumnos a 
NATURAL LEFT JOIN pagos p
where p.clave_alu IS NULL
group by a.clave_alu
order by 4, 2 desc; -- alumnos que no han hecho ningun pago 


select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno,
IFNULL(sum(pago), 0) total_pagos, 
count(pago) num_pagos, 
IFNULL(max(fecha_pago), '000-00-00') ult_f_pago 
from alumnos a 
NATURAL LEFT JOIN pagos p
group by a.clave_alu
order by 4, 2 desc;

select * from pagos where clave_alu = '11040044';


