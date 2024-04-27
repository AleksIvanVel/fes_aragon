use colegio;

select * from alumnos;
select count(*) from alumnos;

select * from estados;
select count(*) from estados;

select count(*) from estados where id_estado = 22;

-- producto cartesiano (,)
select * from alumnos, estados order by clave_alu; -- el operador "," solo permite inner join 

select count(*) from alumnos, estados order by clave_alu;

select * 
from alumnos a, estados e
where a.id_estado = e.id_estado 
order by clave_alu;

select * from pagos order by 1;

select count(*) from alumnos a, pagos p;

-- haciendo el join
select *
from alumnos a, pagos p
where a.clave_alu = p.clave_alu
order by 1;

select count(*) from alumnos a, pagos p, estados e, cursos c
where a.clave_alu = p.clave_alu and a.id_estado = e.id_estado and p.id_curso = c.id_curso;

select * from alumnos a, pagos p, estados e, cursos c
where a.clave_alu = p.clave_alu and a.id_estado = e.id_estado and p.id_curso = c.id_curso;

select a.clave_alu, a.nombre, a.ap_paterno, a.ap_materno, estado, c.nombre curso, pago, fecha_pago
from alumnos a, pagos p, estados e, cursos c
where a.clave_alu = p.clave_alu 
and a.id_estado = e.id_estado 
and p.id_curso = c.id_curso
order by a.clave_alu;

select a.clave_alu, a.nombre, a.ap_paterno, a.ap_materno, estado, c.nombre curso, count(*) num_pagos, sum(pago) total_pagos
from alumnos a, pagos p, estados e, cursos c
where a.clave_alu = p.clave_alu 
and a.id_estado = e.id_estado 
and p.id_curso = c.id_curso
group by a.clave_alu, a.nombre, a.ap_paterno, a.ap_materno, estado, c.nombre
having count(*) >= 10
order by 3, 4, 2;


-- total de pagos por estado
select  estado, count(*) num_pagos, sum(pago) total_pagos
from alumnos a, pagos p, estados e
where a.clave_alu = p.clave_alu 
and a.id_estado = e.id_estado 
group by estado
order by 1;


-- total de pagos por alumno sexo
select  estado, sexo, count(*) num_pagos, sum(pago) total_pagos
from alumnos a, pagos p, estados e
where (a.clave_alu = p.clave_alu 
and a.id_estado = e.id_estado) and sexo = 'F' 
group by estado, sexo
order by 1;


select  * from alumnos where sexo = 'F';
select * from pagos where year(fecha_pago) = 2018;


-- consultas anidadas 
select  estado, sexo, count(*) num_pagos, sum(pago) total_pagos
from (select  * from alumnos where sexo = 'F') a, (select * from pagos where year(fecha_pago) = 2018) p, estados e
where a.clave_alu = p.clave_alu 
and a.id_estado = e.id_estado 
group by estado
order by 1;

select  year(fecha_pago) anio, estado, sexo, count(*) num_pagos, sum(pago) total_pagos
from (select  * from alumnos where sexo = 'F') a, pagos p, estados e
where a.clave_alu = p.clave_alu 
and a.id_estado = e.id_estado 
group by estado,  year(fecha_pago)
order by 1; 


