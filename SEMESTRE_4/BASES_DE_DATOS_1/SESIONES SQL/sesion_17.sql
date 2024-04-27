use colegio;

-- calificacion de alumno por materia 
select a.clave_alu, concat_ws(' ',ap_paterno,ap_materno,a.nombre) alumno, 
m.clave_mat, m.nombre materia, e.calificacion, e.id_curso 
from alumnos a
join evaluaciones e on(a.clave_alu = e.clave_alu)
join materias m on (m.clave_mat = e.clave_mat)
order by 2, e.id_curso;

-- promedio por materia 
select clave_mat, materia, id_curso, avg(calificacion) promedio 
from(
	select a.clave_alu, concat_ws(' ',ap_paterno,ap_materno,a.nombre) alumno, 
	m.clave_mat, m.nombre materia, e.calificacion, e.id_curso 
	from alumnos a
	join evaluaciones e on(a.clave_alu = e.clave_alu)
	join materias m on (m.clave_mat = e.clave_mat)
) x
group by clave_mat, materia, id_curso
order by 1,2;

-- promedio por materia y curso 
select clave_mat, materia, id_curso, abreviatura, avg(calificacion) promedio 
from(
	select a.clave_alu, concat_ws(' ',ap_paterno,ap_materno,a.nombre) alumno, 
	m.clave_mat, m.nombre materia, e.calificacion, e.id_curso 
	from alumnos a
	join evaluaciones e on(a.clave_alu = e.clave_alu)
	join materias m on (m.clave_mat = e.clave_mat)
    natural join cursos c
) x
group by clave_mat, materia, id_curso, abreviatura
order by 1,2;

-- materias con promedio menor a 7 por curso 
select clave_mat, materia, id_curso, abreviatura, avg(calificacion) promedio 
from(
	select a.clave_alu, concat_ws(' ',ap_paterno,ap_materno,a.nombre) alumno, 
	m.clave_mat, m.nombre materia, e.calificacion, e.id_curso 
	from alumnos a
	join evaluaciones e on(a.clave_alu = e.clave_alu)
	join materias m on (m.clave_mat = e.clave_mat)
) x
natural join cursos c
group by clave_mat, materia, id_curso, abreviatura
having promedio < 7
order by 1,2;


-- materias con promedio menor a 7 por curso  sin usar having
select * from (
	select clave_mat, materia, id_curso, abreviatura, avg(calificacion) promedio 
	from(
			select a.clave_alu, concat_ws(' ',ap_paterno,ap_materno,a.nombre) alumno, 
			m.clave_mat, m.nombre materia, e.calificacion, e.id_curso 
			from alumnos a
			join evaluaciones e on(a.clave_alu = e.clave_alu)
			join materias m on (m.clave_mat = e.clave_mat)
		) x
		natural join cursos c
		group by clave_mat, materia, id_curso, abreviatura
		order by 1,2
)z
where promedio < 7 
order by 1,2;

-- valores unicos 
select distinct  curp,sexo from alumnos;

select ciudad from alumnos group by ciudad order by 1;

select sexo, count(*) count, count(ciudad), max(ciudad) max, min(ciudad) min, 
sum(ciudad), avg(ciudad) from alumnos
group by sexo;