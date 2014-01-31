-- =================================================
-- Autor: Stephan Endres, Diego Salas
-- Resumen: Crea un random
-- Fecha creacion: 20/08/2013
-- Fecha modificacion:29/01/2014
-- =================================================
create or replace function myrand(a IN int,b IN int)  
return number 
is 
begin 

	return trunc(abs(( GREATEST(a,b) - LEAST(a,b) + 1 ) * abs(dbms_random.value)) + LEAST(a,b)); 

end; 
/
