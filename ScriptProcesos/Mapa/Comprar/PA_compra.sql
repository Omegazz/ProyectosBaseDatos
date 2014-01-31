-- =================================================
-- Autor: Stephan Endres, Diego Salas
-- Resumen: Compra las unidades por tipos
-- Fecha creacion: 20/08/2013
-- Fecha modificacion:29/01/2014
-- =================================================
CREATE or REPLACE Procedure pa_compra (jugador number, colonia number, cantidad number, soldado number)
IS
	pjugador number:=jugador;
	pcolonia number:=colonia;
	pcantidad number:=cantidad;
	psoldado number:=soldado;
	pjugadorColonia number;
	costo number := 0;
    costoTotal number := 0;
	i number := 1;
    ener number := 0;
BEGIN
	select coste_energia into costo
		from tipo_figura t
		where t.id_tipo_figura=psoldado;
	costoTotal := costo*pcantidad;
	
	select energia into ener
		from jugador 
		where id_jugador = pjugador;
		
	select unique(id_jugador) into pjugadorColonia
		from figura
		where id_colonia = pcolonia;
	
	if pjugador = pjugadorColonia then
		if costoTotal <= ener then
		
			while i <= pcantidad loop
				INSERT INTO figura VALUES
					( sqid_figura.nextval,
					psoldado,
					pcolonia,
					pjugador
					);
				i := i+1;
			end loop;
		
			update jugador
			set energia = ener-costoTotal
			where id_jugador = pjugador;
			
			DBMS_OUTPUT.PUT_LINE('Se compraron '||pcantidad||' figuras');	
		else
			DBMS_OUTPUT.PUT_LINE('No posee suficiente energia');
		end if;
	else
		DBMS_OUTPUT.PUT_LINE('La colonia seleccionada no te pertenece');
	end if;
END;
/
