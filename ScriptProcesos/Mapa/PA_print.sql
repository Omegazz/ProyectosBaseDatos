-- =================================================
-- Autor: Stephan Endres, Diego Salas
-- Resumen: Procedimiento almacenado que imprime el mapa RISQ
-- Fecha creacion: 20/08/2013
-- Fecha modificacion:29/01/2014
-- =================================================
CREATE or REPLACE Procedure PA_print
IS
	pcontinente1 varchar2(25);
	pcolonia1 varchar2(25);
	pid_colonia1 number;
	pjugador1 varchar2(2);
	pregimiento1 number;
	pcomandantes1 number;
	
	pcontinente2 varchar2(25);
	pcolonia2 varchar2(25);
	pid_colonia2 number;
	pjugador2 varchar2(2);
	pregimiento2 number;
	pcomandantes2 number;
	
	pcontinente3 varchar2(25);
	pcolonia3 varchar2(25);
	pid_colonia3 number;
	pjugador3 varchar2(2);
	pregimiento3 number;
	pcomandantes3 number;
	
	pcontinente4 varchar2(25);
	pcolonia4 varchar2(25);
	pid_colonia4 number;
	pjugador4 varchar2(2);
	pregimiento4 number;
	pcomandantes4 number;
	
	pcontinente5 varchar2(25);
	pcolonia5 varchar2(25);
	pid_colonia5 number;
	pjugador5 varchar2(2);
	pregimiento5 number;
	pcomandantes5 number;
	
	pcontinente6 varchar2(25);
	pcolonia6 varchar2(25);
	pjugador6 varchar2(2);
	pid_colonia6 number;
	pregimiento6 number;
	pcomandantes6 number;
	
	pcontinente7 varchar2(25);
	pcolonia7 varchar2(25);
	pid_colonia7 number;
	pjugador7 varchar2(2);
	pregimiento7 number;
	pcomandantes7 number;
	
	pcontinente8 varchar2(25);
	pcolonia8 varchar2(25);
	pid_colonia8 number;
	pjugador8 varchar2(2);
	pregimiento8 number;
	pcomandantes8 number;
	
	contCiclo number:=1;
	pid_contiente number:=0;
	
BEGIN
	
	while contCiclo<=5 loop
	
		--id del continente ------------ 1ro!
		pid_contiente:=pid_contiente+1;
		--primero
			select unique(con.nombre), col.nombre, substr(j.color,1,2), col.id_colonia
					into pcontinente1, pcolonia1, pjugador1, pid_colonia1
				from jugador j join figura f on (j.id_jugador=f.id_jugador) 
					join colonia col on (f.id_colonia=col.id_colonia)
					join continente con on (col.id_continente=con.id_continente)
				where f.id_colonia=pid_contiente;
			
			--cant regimientos
			begin
				select count(f.id_figura)
						into pregimiento1
					from figura f
					where f.id_tipo_figura = 1 and f.id_colonia=pid_contiente
					group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pregimiento1:=0;
			end;
			
			--cant comandantes
			begin
			select count(f.id_figura)
					into pcomandantes1
				from figura f
				where f.id_tipo_figura = 2 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pcomandantes1:=0;
			end;
		
		--id del continente ------------ 2do!
		pid_contiente:=pid_contiente+1;
		--primero
			select unique(con.nombre), col.nombre, substr(j.color,1,2), col.id_colonia
					into pcontinente2, pcolonia2, pjugador2, pid_colonia2
				from jugador j join figura f on (j.id_jugador=f.id_jugador) 
					join colonia col on (f.id_colonia=col.id_colonia)
					join continente con on (col.id_continente=con.id_continente)
				where f.id_colonia=pid_contiente;
			
			--cant regimientos
			begin
			select count(f.id_figura)
					into pregimiento2
				from figura f
				where f.id_tipo_figura = 1 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pregimiento2:=0;
			end;
			
			--cant comandantes
			begin
			select count(f.id_figura)
					into pcomandantes2
				from figura f
				where f.id_tipo_figura = 2 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pcomandantes2:=0;
			end;
				
		--id del continente ------------ 3ro!
		pid_contiente:=pid_contiente+1;
		--primero
			select unique(con.nombre), col.nombre, substr(j.color,1,2), col.id_colonia
					into pcontinente3, pcolonia3, pjugador3, pid_colonia3
				from jugador j join figura f on (j.id_jugador=f.id_jugador) 
					join colonia col on (f.id_colonia=col.id_colonia)
					join continente con on (col.id_continente=con.id_continente)
				where f.id_colonia=pid_contiente;
			
			--cant regimientos
			begin
			select count(f.id_figura)
					into pregimiento3
				from figura f
				where f.id_tipo_figura = 1 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pregimiento3:=0;
			end;
			
			--cant comandantes
			begin
			select count(f.id_figura)
					into pcomandantes3
				from figura f
				where f.id_tipo_figura = 2 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pcomandantes3:=0;
			end;
				
		--id del continente ------------ 4to!
		pid_contiente:=pid_contiente+1;
		--primero
			select unique(con.nombre), col.nombre, substr(j.color,1,2), col.id_colonia
					into pcontinente4, pcolonia4, pjugador4, pid_colonia4
				from jugador j join figura f on (j.id_jugador=f.id_jugador) 
					join colonia col on (f.id_colonia=col.id_colonia)
					join continente con on (col.id_continente=con.id_continente)
				where f.id_colonia=pid_contiente;
			
			--cant regimientos
			begin
			select count(f.id_figura)
					into pregimiento4
				from figura f
				where f.id_tipo_figura = 1 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pregimiento4:=0;
			end;
			
			--cant comandantes
			begin
			select count(f.id_figura)
					into pcomandantes4
				from figura f
				where f.id_tipo_figura = 2 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pcomandantes4:=0;
			end;
				
		--id del continente ------------ 5to!
		pid_contiente:=pid_contiente+1;
		--primero
			select unique(con.nombre), col.nombre, substr(j.color,1,2), col.id_colonia
					into pcontinente5, pcolonia5, pjugador5, pid_colonia5
				from jugador j join figura f on (j.id_jugador=f.id_jugador) 
					join colonia col on (f.id_colonia=col.id_colonia)
					join continente con on (col.id_continente=con.id_continente)
				where f.id_colonia=pid_contiente;
			
			--cant regimientos
			begin
			select count(f.id_figura)
					into pregimiento5
				from figura f
				where f.id_tipo_figura = 1 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pregimiento5:=0;
			end;
			
			--cant comandantes
			begin
			select count(f.id_figura)
					into pcomandantes5
				from figura f
				where f.id_tipo_figura = 2 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pcomandantes5:=0;
			end;
				
		--id del continente ------------ 6to!
		pid_contiente:=pid_contiente+1;
		--primero
			select unique(con.nombre), col.nombre, substr(j.color,1,2), col.id_colonia
					into pcontinente6, pcolonia6, pjugador6, pid_colonia6
				from jugador j join figura f on (j.id_jugador=f.id_jugador) 
					join colonia col on (f.id_colonia=col.id_colonia)
					join continente con on (col.id_continente=con.id_continente)
				where f.id_colonia=pid_contiente;
			
			--cant regimientos
			begin
			select count(f.id_figura)
					into pregimiento6
				from figura f
				where f.id_tipo_figura = 1 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pregimiento6:=0;
			end;
			
			--cant comandantes
			begin
			select count(f.id_figura)
					into pcomandantes6
				from figura f
				where f.id_tipo_figura = 2 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pcomandantes6:=0;
			end;
				
		--id del continente ------------ 7mo!
		pid_contiente:=pid_contiente+1;
		--primero
			select unique(con.nombre), col.nombre, substr(j.color,1,2), col.id_colonia
					into pcontinente7, pcolonia7, pjugador7, pid_colonia7
				from jugador j join figura f on (j.id_jugador=f.id_jugador) 
					join colonia col on (f.id_colonia=col.id_colonia)
					join continente con on (col.id_continente=con.id_continente)
				where f.id_colonia=pid_contiente;
			
			--cant regimientos
			begin
			select count(f.id_figura)
					into pregimiento7
				from figura f
				where f.id_tipo_figura = 1 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pregimiento7:=0;
			end;
			
			--cant comandantes
			begin
			select count(f.id_figura)
					into pcomandantes7
				from figura f
				where f.id_tipo_figura = 2 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pcomandantes7:=0;
			end;
				
		--id del continente ------------ 8vo!
		pid_contiente:=pid_contiente+1;
		--primero
			select unique(con.nombre), col.nombre, substr(j.color,1,2), col.id_colonia
					into pcontinente8, pcolonia8, pjugador8, pid_colonia8
				from jugador j join figura f on (j.id_jugador=f.id_jugador) 
					join colonia col on (f.id_colonia=col.id_colonia)
					join continente con on (col.id_continente=con.id_continente)
				where f.id_colonia=pid_contiente;
			
			--cant regimientos
			begin
			select count(f.id_figura)
					into pregimiento8
				from figura f
				where f.id_tipo_figura = 1 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pregimiento8:=0;
			end;
			
			--cant comandantes
			begin
			select count(f.id_figura)
					into pcomandantes8
				from figura f
				where f.id_tipo_figura = 2 and f.id_colonia=pid_contiente
				group by f.id_colonia;
				--se controla cuando no hay datos
			exception
			when no_data_found then
				pcomandantes8:=0;
			end;
		
		
		-- Se realiza el print
		DBMS_OUTPUT.PUT_LINE(rpad('-',80,'-'));
		DBMS_OUTPUT.PUT_LINE(':'||rpad(pcontinente1,9,' ')||':'||rpad(pcontinente2,9,' ')||':'||rpad(pcontinente3,9,' ')||':'||rpad(pcontinente4,9,' ')||':'||rpad(pcontinente5,9,' ')||':'||rpad(pcontinente6,9,' ')||':'||rpad(pcontinente7,9,' ')||':'||rpad(pcontinente8,9,' '));
		DBMS_OUTPUT.PUT_LINE(':'||rpad(pcolonia1,9,' ')||':'||rpad(pcolonia2,9,' ')||':'||rpad(pcolonia3,9,' ')||':'||rpad(pcolonia4,9,' ')||':'||rpad(pcolonia5,9,' ')||':'||rpad(pcolonia6,9,' ')||':'||rpad(pcolonia7,9,' ')||':'||rpad(pcolonia8,9,' '));
		DBMS_OUTPUT.PUT_LINE(':'||'ID_Col '||rpad(pid_colonia1,2,' ')||':'||'ID_Col '||rpad(pid_colonia2,2,' ')||':'||'ID_Col '||rpad(pid_colonia3,2,' ')||':'||'ID_Col '||rpad(pid_colonia4,2,' ')||':'||'ID_Col '||rpad(pid_colonia5,2,' ')||':'||'ID_Col '||rpad(pid_colonia6,2,' ')||':'||'ID_Col '||rpad(pid_colonia7,2,' ')||':'||'ID_Col '||rpad(pid_colonia8,2,' '));
		DBMS_OUTPUT.PUT_LINE(':'||rpad(pjugador1,2,' ')||'('||lpad(pregimiento1,2,' ')||','||lpad(pcomandantes1,2,' ')||')'||':'||rpad(pjugador2,2,' ')||'('||lpad(pregimiento2,2,' ')||','||lpad(pcomandantes2,2,' ')||')'||':'||rpad(pjugador3,2,' ')||'('||lpad(pregimiento3,2,' ')||','||lpad(pcomandantes3,2,' ')||')'||':'||rpad(pjugador4,2,' ')||'('||lpad(pregimiento4,2,' ')||','||lpad(pcomandantes4,2,' ')||')'||':'||rpad(pjugador5,2,' ')||'('||lpad(pregimiento5,2,' ')||','||lpad(pcomandantes5,2,' ')||')'||':'||rpad(pjugador6,2,' ')||'('||lpad(pregimiento6,2,' ')||','||lpad(pcomandantes6,2,' ')||')'||':'||rpad(pjugador7,2,' ')||'('||lpad(pregimiento7,2,' ')||','||lpad(pcomandantes7,2,' ')||')'||':'||rpad(pjugador8,2,' ')||'('||lpad(pregimiento8,2,' ')||','||lpad(pcomandantes8,2,' ')||')');
		DBMS_OUTPUT.PUT_LINE(rpad('-',80,'-'));
		contCiclo:=contCiclo+1;
		
	end loop;
END;
/
