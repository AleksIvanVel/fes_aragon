use colegio;

select nombre, curp, sexo
from alumnos
where nombre like '%JOSE%' or nombre like '%ADRIAN%' or nombre like '%ALEJANDR%';

-- EXPRESIONES REGULARES 
-- () --> funciona como or
-- [] --> evalua rangos 
-- : --> familias 

-- R LIKE  permite trabajar con exp regulares
select nombre, curp, sexo
from alumnos
where nombre RLIKE 'JOSE';  -- BUSCA LO QUE CONTENGA JOSE

select nombre, curp, sexo
from alumnos
where nombre RLIKE '^JOSE';  -- BUSCA LOS QUE INICIAN CON JOSE

select nombre, curp, sexo
from alumnos
where nombre RLIKE 'JOSE$';  -- BUSCA LOS QUE TERMINAN CON JOSE

select nombre, curp, sexo
from alumnos
where nombre RLIKE '^JOSE$';  -- BUSCA LOS QUE INICIEN Y TERMINAN CON JOSE

select nombre, curp, sexo
from alumnos
where nombre RLIKE '(JOSE|ADRIAN|ALEJANDR)';  -- BUSCA LOS QUE CONTENGAN JOSE, ADRIAN Y ALEJANDR EN UNA SOLA EXPRESION

select nombre, curp, sexo
from alumnos
where nombre RLIKE '(^JOSE|ADRIAN|ALEJANDR)';  -- BUSCA LOS QUE INICIEN CON JOSE O CONTENGAN ADRIAN O CONTENGAN ALEJANDR EN UNA SOLA EXPRESION

select nombre, curp, sexo
from alumnos
where nombre RLIKE '[ROZ]$'; -- NOMBRE QUE TERMINAN CON R u O o Z

select nombre, curp, sexo
from alumnos
where nombre RLIKE '[R-Z]$'; -- NOMBRE QUE TERMINAN desde R hasta Z

select 
IF(nombre RLIKE '^N', 'INICIAN CON N', 'no inician con N') as matching, 
count(*)
FROM alumnos 
group by matching;


-- REGEXP permite trabajar con expresiones regulares opera sobre los datos ASCII
select nombre, curp, sexo
from alumnos
where nombre REGEXP '[R-Z]$'
order by nombre;

-- CURP
select nombre, curp, sexo
from alumnos
where CURP REGEXP '^[A-Za-z]{4,}[0-9]{6,}[HM][A-Za-z]{2}[B,C,D,F,G,H,J,K,L,M,N,P,Q,R,S,T,V,W,X,Y,Z]{3}
						[[[A-Za-z]{1}]|[0-9]{2}]' -- DOS RANGOS
order by nombre;

select nombre, curp, sexo
from alumnos
where not CURP REGEXP '^[A-Za-z]{4,}[0-9]{6,}[HM][A-Za-z]{2}[B,C,D,F,G,H,J,K,L,M,N,P,Q,R,S,T,V,W,X,Y,Z]{3}
						[[[A-Za-z]{1}]|[0-9]{2}]' -- DOS RANGOS
order by nombre;

-- correo que tenga algun numero 
select nombre, curp, sexo, email
from alumnos
where email REGEXP '[0-9]'
order by nombre;

-- USO DE FAMILIAS
select nombre, curp, sexo, email
from alumnos
where email REGEXP '[:digit:]';

-- BUSCA TODO LO QUE NO INICIE CON UN @
select nombre, curp, sexo, email
from alumnos
where email REGEXP '^[^@]+@+\.[:alpha:]{2,}';

select nombre, curp, sexo, email
from alumnos
where  email REGEXP '^[^@]+@+\.[:alpha:]{2,}'
and not email REGEXP '(miemail|hitmail)i*';

-- con i* lo froza a que sea insensible a mayusculas  