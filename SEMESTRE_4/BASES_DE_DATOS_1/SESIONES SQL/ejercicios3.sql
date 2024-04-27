-- VELAZQUEZ ARRIAGA ALEKS IVAN

use colegio;
show tables;

select*from alumno_salon
order by activo desc;

select * from salones;


-- 1 listar el alumno y el salon en el que esta inscrito actualmente
select concat_ws(' ', ap_paterno, ap_materno, nombre) alumno, a.clave_alu, s.observaciones  
from alumnos a 
left join alumno_salon al on (a.clave_alu = al.clave_alu)
right join salones s on (al.id_salon = s.id_salon)
where al.activo = 1
order by alumno;

-- 2 listar las 5 materias con mayor promedio por curso
select*from materias;
select*from cursos; 
select*from evaluaciones;


select m.clave_mat, m.nombre, avg(calificacion) promedio, c.id_curso, c.abreviatura curso
from materias m 
left join evaluaciones e on (m.clave_mat = e.clave_mat)
right join cursos c on (c.id_curso = e.id_curso)
group by m.clave_mat, m.nombre, c.abreviatura, c.id_curso
order by promedio desc
limit 5;

-- 3 listar el alumno y el promedio de calificaciones del curso 2018-2019
select*from alumnos; 
select*from evaluaciones;
select*from cursos;

select a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, a.nombre) alumno, avg(calificacion) promedio, cu.abreviatura curso
from alumnos a
join evaluaciones e on (a.clave_alu = e.clave_alu)
join cursos cu on (e.id_curso = cu.id_curso)
where abreviatura = '2018-2019'
group by  a.clave_alu, calificacion, cu.abreviatura, cu.id_curso, concat_ws(' ', ap_paterno, ap_materno, a.nombre) 
order by alumno;

-- 4 listar el promedio de pagos por alumno por curso
select * from alumnos;
select * from pagos;
select * from cursos;

select concat_ws(' ', ap_paterno, ap_materno, a.nombre) alumno, format(avg(pago), 2) prom_pago, c.abreviatura curso
from alumnos a
join pagos p on (a.clave_alu = p.clave_alu)
join cursos c on (c.id_curso = p.id_curso)
group by concat_ws(' ', ap_paterno, ap_materno, a.nombre), c.abreviatura
order by alumno;

-- 5 listar los profesores de los salones de 2do grado (usar consulta anidada)
select * from profesores;
select * from cursos;
select * from salones;
select * from profesor_grupo;
select * from grados;
-- id_grado
show tables;

select clave_prof, concat_ws(' ', apellido_p, apellido_m, nombres) profesor, salon, grado
from(
select p.clave_prof, nombres, apellido_p, apellido_m, observaciones salon, g.nombre grado
from profesores p
join profesor_grupo pg on (p.clave_prof = pg.clave_prof)
join salones s on (pg.id_salon = s.id_salon)
join grados g on (s.id_grado = g.id_grado)
) x
where grado = '2o';

