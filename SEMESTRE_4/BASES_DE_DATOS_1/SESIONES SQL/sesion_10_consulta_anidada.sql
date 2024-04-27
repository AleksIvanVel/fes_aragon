-- CONSULTA ANIDADA
select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno, 
total_pagos, num_pagos, ult_f_pago
from alumnos a 
NATURAL LEFT JOIN (
	select clave_alu, IFNULL(sum(pago), 0) total_pagos, count(pago) num_pagos, 
    IFNULL(max(fecha_pago), '000-00-00') ult_f_pago from pagos group by clave_alu
    ) p
order by 2 desc;


-- ALUMNOS QUE NO HAYAN HECHO PAGOS 
select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre) alumno, 
total_pagos, num_pagos, ult_f_pago
from alumnos a 
NATURAL LEFT JOIN (
	select clave_alu, IFNULL(sum(pago), 0) total_pagos, count(pago) num_pagos, 
    IFNULL(max(fecha_pago), '000-00-00') ult_f_pago from pagos group by clave_alu
    ) p
    WHERE total_pagos is null
order by 2 desc;



-- CONSULTA CON DOBLE AGRUPAMIENTO
SELECT ciudad, sexo, count(*) n_alu
from alumnos
group by ciudad, sexo
order by 1; -- repide un valor por cada elemnto que tengamos 

-- utilizamos una TABLA PIVOTE con consuLta anidadA
SELECT ciudad,
SUM(if(sexo= ' ', n_alu, 0)) 'ND',
SUM(if(sexo= 'M', n_alu, 0)) 'MASCULINIO',
SUM(if(sexo= 'F', n_alu, 0)) 'FEMENINO',
SUM(if(sexo= 'X', n_alu, 0)) 'X'
from (select ciudad, sexo, count(*) n_alu from alumnos group by ciudad, sexo) x
group by ciudad
order by 1;

-- tabla pivote por SEXO
SELECT sexo,
SUM(IF((ciudad like '%quer%' or '%qro%'), n_alu, 0)) 'QUERETARO',
SUM(IF(NOT (ciudad like '%quer%' or '%qro%'), n_alu, 0)) 'NO QUERETARO'
from (
		select ciudad, sexo, count(*) n_alu from alumnos group by ciudad, sexo
	) x
group by sexo
order by 1;


use colegio;

select e.clave_alu, 
concat_ws(' ', ap_paterno, ap_materno, nombre) alumno,
id_curso, avg(calificacion) promedio
from evaluaciones e RIGHT join alumnos a
on(e.clave_alu = a.clave_alu)
group by e.clave_alu, concat_ws(' ', ap_paterno, ap_materno, nombre), id_curso
order by e.clave_alu;

select e.clave_alu, 
concat_ws(' ', ap_paterno, ap_materno, a.nombre) alumno,
e.id_curso, abreviatura cruso, avg(calificacion) promedio
from evaluaciones e 
RIGHT join alumnos a on(e.clave_alu = a.clave_alu)
LEFT join cursos c on (e.id_curso = c.id_curso)
group by e.clave_alu, concat_ws(' ', ap_paterno, ap_materno, a.nombre), e.id_curso, abreviatura
order by 2;


select e.clave_alu, a.clave_alu matricula,
concat_ws(' ', ap_paterno, ap_materno, a.nombre) alumno,
e.id_curso, abreviatura cruso, avg(calificacion) promedio
from evaluaciones e 
RIGHT join alumnos a on(e.clave_alu = a.clave_alu)
LEFT join cursos c on (e.id_curso = c.id_curso)
group by e.clave_alu, a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, a.nombre), e.id_curso, abreviatura
order by 2;


select matricula, alumno,
SUM(if(curso = '2015-2016', promedio, 0)) '2015-2016',
SUM(if(curso = '2016-2017', promedio, 0)) '2016-2017',
SUM(if(curso = '2017-2018', promedio, 0)) '2017-2018',
SUM(if(curso = '2018-2019', promedio, 0)) '2018-2019',
SUM(if(curso is null , promedio, 0)) 'SIN_CURSO'
from(
	select e.clave_alu, a.clave_alu matricula,
	concat_ws(' ', ap_paterno, ap_materno, a.nombre) alumno,
	e.id_curso, abreviatura curso, avg(calificacion) promedio
	from evaluaciones e 
	RIGHT join alumnos a on(e.clave_alu = a.clave_alu)
	LEFT join cursos c on (e.id_curso = c.id_curso)
	group by e.clave_alu, a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, a.nombre), e.id_curso, abreviatura 
    ) X
group by matricula, alumno
order by 2;

use colegio;

-- PROMEDIO POR ESTADO Y POR CURSO  32 RENGLONES  DE ESTADOS Y  5 COLUMNAS cursos

select matricula, alumno, estado,
SUM(if(curso = '2015-2016', promedio, 0)) '2015-2016',
SUM(if(curso = '2016-2017', promedio, 0)) '2016-2017',
SUM(if(curso = '2017-2018', promedio, 0)) '2017-2018',
SUM(if(curso = '2018-2019', promedio, 0)) '2018-2019',
SUM(if(curso is null , promedio, 0)) 'SIN_CURSO'
from(
		select e.id_curso, abreviatura curso, avg(calificacion) promedio, o.id_estado, estado 
		from evaluaciones e 
		JOIN alumnos a on (e.clave_alu = a.clave_alu)
		JOIN estados o on (a.id_estado = o.id_estado)
		group by e.id_curso
	) X
group by matricula, alumno, estado;


select  e.id_curso, abreviatura curso, avg(calificacion) promedio, o.id_estado, estado 
		from evaluaciones e 
		JOIN alumnos a on (e.clave_alu = a.clave_alu)
		JOIN estados o on (a.id_estado = o.id_estado)
		group by e.id_curso, abreviatura, o.id_estado, estado ;


select c.id_curso, abreviatura curso, avg(calificacion) promedio from cursos c
join evaluaciones e on (c.id_curso = e.id_curso)
group by c.id_curso, abreviatura;
select * from estados;
select * from alumnos;
show tables;