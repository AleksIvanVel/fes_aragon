use datosabiertos;
show tables;
describe COVID19MEXICO;
select count(*) from  COVID19MEXICO;

-- cuantas personas infectadas hay por estado
select  estado, total_infectados
from(
	select distinct ENTIDAD_RES,
	sum(if(RESULTADO_ANTIGENO=1, RESULTADO_ANTIGENO, 0)) "total_infectados"
	FROM COVID19MEXICO 
	group by ENTIDAD_RES
) x
join bdcolegio02.estados e on (x.entidad_res = e.id_estado)
order by estado;