use colegio;

-- CAMBIA EL IDIOMA EN QUE APRACEN LOS DATOS, EN ESTE CASO LOS CAMBIAMOS A ESP    
show variables like 'lc_time_names';
set lc_time_names = 'es_MX';


-- fFUNCIONES DE FECHA 
select nombre, ap_paterno, ap_materno, sexo, fedita from alumnos;

-- DATE_FORMAT(FECHA, FORMATO) retorna una cadena que contiene la fecha en un formato determinado 
	SELECT nombre, ap_paterno, ap_materno, sexo, fedita,
    DATE_FORMAT(fedita, '%d') dia,
    DATE_FORMAT(fedita, '%m') mes,
    DATE_FORMAT(fedita, 'dato cambiado el %D del mes %M del año %Y') ff
FROM
    alumnos;
    -- %m numero del mes
    -- %M nombre del mes
    -- %d dia en numero
	-- %D dia en numero cardinal
    
	select sysdate(), date_format(sysdate(), 'Hoy es el dia %j del año'), -- %j da el numero de dia del año de 365 dias
    date_format(sysdate(), 'es la semana no %u'), -- numero se mana del año
    date_format(sysdate(), '%Y-%m-%d'); 
	
    
    select date_format(fedita, '%a') dia, count(*) n_alu -- dia de la semana 
    from alumnos 
    group by date_format(fedita, '%a')
    order by 2 desc;
    
    
	select 
    date_format(fedita, '%Y-%m-%d') fecha,
    date_format(fedita, '%T') H24,
	date_format(fedita, '%r') H12,
	date_format(fedita, '%p') am_pm   -- %T retorna la hora en formato 24hrs
    from alumnos; 					  -- %r retorna le hora en fromato 12 hrs 
    
    select nombre fedita 
    from alumnos 
    where date_format(fedita, '%Y') = '2017';
    
    
    select nombre, fedita, YEAR(fedita) ANIO, MONTH(fedita) mes, monthname(fedita) nombre_mes,
    dayname(fedita) nombre_dia, day(fedita) dia, 
    dayofmonth(fedita) dia_del_mes, dayofyear(fedita) dia_del_anio, hour(fedita) hora, minute(fedita) minuto, 
    second(fedita) segundo, quarter(fedita) trimestre
    from alumnos;
    
    -- DATE_ADD() suma cantidades al parametro de fecha indicado 
		select nombre, fedita,
		date_add(fedita, interval 1 year ) mas  -- sumamos un año
		from alumnos;
        
    -- DATE_SUB()  resta cantidades al parametro de fecha indicado
		select nombre, fedita,
		date_sub(fedita, interval 1 year ) menos -- restamos un año un año
		from alumnos;
        
        
	select nombre, fedita,
    date_add(fedita, interval 1 year ) mas,
    date_sub(fedita, interval 1 year ) menos,
    date_sub(fedita, interval -1 year) menoss,
    date_add(fedita, interval 2 hour) dos_horas_mas,
    date_add(date_add(fedita, interval 2 hour), INTERVAL 1 YEAR) ANIDADO
    from alumnos;
    
    SELECT current_TIME() HORA_LOCAL, 
    DATE_ADD(current_time(), INTERVAL -1 HOUR) HORA_TIJUANA,
    DATE_ADD(current_time(), INTERVAL 1 HOUR) HORA_CANCUN;
    
    -- current_time() solo la hora actual
    -- currente_date() fecha y hora actual
    -- now() 
    
    -- DATEDIFF() regresa la diferencia en dias de las dos fechas indicadas 
    select nombre, fedita, datediff(now(), fedita) diferencia_de_dias
    from alumnos;
    
    -- diferencia en años 
    select nombre, fedita, datediff(now(), fedita) diferencia_de_dias,
    datediff(now(), fedita ) / 365 diferencia_de_aios
    from alumnos;
    
    -- diferencia en horas
	select nombre, fedita, datediff(now(), fedita) diferencia_de_dias,
    datediff(now(), fedita ) / 365 diferencia_de_anios,
	datediff(now(), fedita ) * 24 diferencia_de_horas
    from alumnos;
    
    
select distinct year(fedita) numero, date_format(fedita, '%Y') cadena
from alumnos;

update 
alumnos set fedita = date_add(fedita, interval 5 year);

update 
alumnos set fedita = date_add(fedita, interval -5 year);


	-- TIMESTAMPDIFF
    select nombre, fedita, datediff(now(), fedita) fif_dias, 
    timestampdiff(day, fedita, now()) dif_dias,
    timestampdiff(year, fedita, now()) dif_anios,
    timestampdiff(month, fedita, now()) dif_mes,
    timestampdiff(hour, fedita, now()) dif_horas,
    timestampdiff(minute, fedita, now()) dif_minutos
    from alumnos;
    
    set @f = '2003-10-28';
    
	-- FROM_DAYS() convierte una situeacion de diferencia de datos en fecha
    select @f, from_days(@f) dif_dias;
    
    select @f, datediff(now(),@f) dif_dias, from_days(datediff(now(),@f)) foromato_fecha;
    
     select @f, datediff(now(),@f) dif_dias, 
     from_days(datediff(now(),@f)) foromato_fecha,
     date_format(from_days(datediff(now(),@f)), 'TU EDAD ES: %y años, %m meses, %d dias');
    
    