use colegio;
select * from cursos;
select * from estados;
select * from alumnos;
select * from evaluaciones;

select e.estado, c.abreviatura, avg(eva.calificacion) as promedio
from estados e
left join alumnos a on a.id_estado = e.id_estado
left join evaluaciones eva on eva.clave_alu = a.clave_alu
left join cursos c on c.id_curso = eva.id_curso
group by e.estado, c.abreviatura
order by c.abreviatura desc;

select distinct estado,
sum(if(curso = '2015-2016', promedio, 0)) '2015-2016',
sum(if(curso = '2016-2017', promedio, 0)) '2016-2017',
sum(if(curso = '2017-2018', promedio, 0)) '2017-2018',
sum(if(curso = '2018-2019', promedio, 0)) '2018-2019'
from (
		select e.estado estado, avg(eva.calificacion) promedio, c.abreviatura curso from estados e
		left join alumnos a on a.id_estado = e.id_estado
		left join evaluaciones eva on eva.clave_alu = a.clave_alu
		left join cursos c on c.id_curso = eva.id_curso
		group by e.estado, c.abreviatura
	) x
group by estado
order by estado asc;


