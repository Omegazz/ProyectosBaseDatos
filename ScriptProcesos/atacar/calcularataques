--=================================================
--Autor: Diego Salas
--Resumen: Realiza los ataques mediante un random, tomando en cuenta
-- la cantidad y tipo de tropas. Al finalizar, ordena los ataques de mayor a menor
-- descontando las tropas de ambos contrincantes.
--Fecha creacion: 20/08/2013
--Fecha modificacion:29/01/2014
--=================================================
create or replace function calcularataques (pregimientos number, pcomandantes number, pdados number)
	RETURN lista 
as
	aux NUMBER:=0;
	mayor NUMBER:=0;
	listamayores lista;
	i number:=1;
	j number:=1;
	n number:=0;
	diferencia number:=0;
	residuo number:=0;
BEGIN
	listamayores := lista();
	listamayores.EXTEND(pdados);
	
	--Posibles ataques
	--reg= regimientos totales
	--com= comandanes totales
	--dados= cantidad máxima de soldados que se enfrentarán
	--diferencia= calcula la cantidad de regimientos q atacan
	--residuo= calcula la cantidad de comandantes que atacan
	
	/*
	reg:=4;
	com:=2;
	*/
	/*
	reg:=8;
	com:=1;	
	*/
	/*
	reg:=4;
	com:=2;	
	*/	
	if pdados=1 and pcomandantes=1 or pregimientos=0 then
		listamayores(1):= trunc((dbms_random.value(1,7)),0);	
	elsif pdados=1 and pcomandantes=0 or pregimientos=1 then
		listamayores(1):= trunc((dbms_random.value(1,9)),0);
	else
			--------------------------------------------
			--Llenado
			--------------------------------------------
			if pcomandantes>=pdados then
				--solo con comandantes
				for cont IN 1..pdados loop
					listamayores(cont):= trunc((dbms_random.value(1,9)),0);
				end loop;
				
			elsif pregimientos<pdados and pcomandantes>1 and pcomandantes<pdados then
				
				diferencia:= pdados-pcomandantes; --Regimientos que atacan
				residuo:= pdados-diferencia; --Comandantes que atacan
				--Regimientos
				loop
					listamayores(i):= trunc((dbms_random.value(1,7)),0);
					i:=i+1;
					exit when i>diferencia;
				end loop;
				--------------------------------------------------------
				--Comandantes
				loop 
					listamayores(i):= trunc((dbms_random.value(1,9)),0);
					i:=i+1;
					exit when i>pdados;
				end loop;
				
				
			elsif pregimientos>pdados and pcomandantes>=1 then
			
				diferencia:= pdados-pcomandantes; --Regimientos que atacan
				if diferencia< 0 then
					diferencia:=diferencia*-1;
				end if;
				
				residuo:= pdados-diferencia; --Comandantes que atacan
				
				loop
					listamayores(i):= trunc((dbms_random.value(1,7)),0);
					i:=i+1;
					exit when i>diferencia;
				end loop;
				--------------------------------------------------------
				--Comandantes
				loop 
					listamayores(i):= trunc((dbms_random.value(1,9)),0);
					i:=i+1;
					exit when i>pdados;
				end loop;
				
				
			else
				for cont IN 1..pdados loop
					--Solo regimientos
					listamayores(cont):= trunc((dbms_random.value(1,7)),0);
				end loop;
			end if;
		
		------------------------------------------------------------------------
		
		n:=listamayores.count -1;
		--Se tiene q reiniciar "i" porque lo uso como contador global
		i:=1;
		
		--------------------------------------------
		--Ordenado de mayor a menor
		--------------------------------------------
		loop
			mayor:=i;
			
			j:= i+1;
			loop
				
				if listamayores(j)> listamayores(mayor) then
					mayor:=j;
				end if;
				
				j:=j+1;
				exit when j> listamayores.count;
			end loop;
			
			
			if i<>mayor then
				aux:=listamayores(i);
				listamayores(i):=listamayores(mayor);
				listamayores(mayor):=aux;
			end if;
				
			i:=i+1;
			exit when i> n;
		end loop;
	
	end if;
	
	/*
	--Impresion
	FOR i IN 1..listamayores.count LOOP
		dbms_output.put_line(listamayores(i));
	END LOOP;
	*/
	return listamayores;
END;
/
