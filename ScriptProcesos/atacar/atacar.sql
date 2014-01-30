--=================================================
--Autor: Diego Salas
--Resumen: Ejecucion de llenado de tablas con datos necesarios para jugar
--Fecha creacion: 20/08/2013
--Fecha modificacion:29/01/2014
--=================================================
CREATE OR REPLACE PROCEDURE atacar(pidjugador NUMBER, pidcoloniaactual NUMBER, pidcoloniadestino NUMBER)
AS
	
	CURSOR listadofronteras IS
		SELECT DISTINCT f.Frontera
		FROM Frontera f
		INNER JOIN Colonia c1 ON f.Id_colonia= c1.Id_colonia
		INNER JOIN Colonia c2 ON f.Frontera = c2.Id_colonia
		INNER JOIN Figura fig ON f.Frontera= fig.Id_colonia
		WHERE c1.Id_colonia=pidcoloniaactual
		and fig.Id_jugador<> pidjugador;
	
	totalSoldadosAtacante NUMBER:=0;
	totalSoldadosDefensor NUMBER:=0;
	--Regimientos con los que atacare	
	cantRegActuAtac NUMBER:=0;
	--Regimientos que actualmente tiene el enemigo
	cantRegActuDef NUMBER:=0;
	--Comandantes del enemigo
	cantComActAtac NUMBER:=0;
	--Comandantes del defensor
	cantComActDef NUMBER:=0;
	--Totalidad de muertes del atacante
	cantSoldDescAtac NUMBER:=0;
	--Totalidad de muertes del defensor
	cantSoldDescDef NUMBER:=0;
	esfrontera boolean:=FALSE;
	idFrontera NUMBER:=0;
	cantdados NUMBER:=0;
	--Listas de daños atacante y defensor
	--Son de tipo "lista" que es un varray de 20 espacios y numericos
	listadaniosAtacante lista;
	listadaniosDefensor lista;
	--Para comparar muertes
	diferencia number:=0;
	residuo number:=0;
BEGIN
	
	OPEN listadofronteras;
	
	LOOP
		FETCH listadoFronteras INTO idFrontera;
			IF pidcoloniadestino= idFrontera THEN
				--Es frontera y si 
				esfrontera:=TRUE;	
			END IF;
			
		EXIT WHEN listadoFronteras%NOTFOUND;
	END LOOP;
	
	CLOSE listadoFronteras;
	
	--Cuento regimientos de atacante
	cantRegActuAtac:= contarSoldados(pidcoloniaactual, 1);
	--Cuento comandantes de atacante
	cantComActAtac:=contarSoldados(pidcoloniaactual, 2);
	
	--Cuento regimientos de defensor
	cantRegActuDef:= contarSoldados(pidcoloniadestino, 1);
	--Cuento comandantes de defensor
	cantComActDef:=contarSoldados(pidcoloniadestino, 2);
	
	-------------------------------------------------------------------------------------------
	
	--Para atacar, se descuenta uno
	IF cantRegActuAtac> 1 AND cantComActAtac>=0 THEN
		cantRegActuAtac:= cantRegActuAtac-1;
	ELSIF cantRegActuAtac< 1 and cantComActAtac>=0 then
		cantComActAtac:=cantComActAtac-1;
	else
		cantRegActuAtac:= 0;
	END IF;
	
	-->
	-->
	-------------------------------------------------
	IF esfrontera=TRUE THEN
		----------------------------------------
		--Es frontera
		----------------------------------------
		dbms_output.put_line('--------------------------------------');
		dbms_output.put_line('La colonia especificada si es frontera');
		
		if cantRegActuAtac>=1 or cantComActAtac>1 then
			--Tiene suficiente para atacar
			dbms_output.put_line('--------------------------------------');
			dbms_output.put_line('Cantidad suficiente de soldados');
			dbms_output.put_line(' ');
			
			if pidcoloniaactual<> pidcoloniadestino then
				dbms_output.put_line('--------------------------------------');
				dbms_output.put_line('Validación de colonia finalizada');
				dbms_output.put_line('Permiso para atacar concedido!!!');
			
				
				/*
				*****************************************************************
				* 					Comienza el ataque							*
				*****************************************************************
				*/
				
				--Validar con cuantos dados se tirará
				totalSoldadosAtacante:= cantRegActuAtac+ cantComActAtac ;
				totalSoldadosDefensor := cantRegActuDef+ cantComActDef;
				
				if totalSoldadosAtacante<totalSoldadosDefensor then
					--El menor dice cuantos dados son
					cantdados:=totalSoldadosAtacante;
				else
					cantdados:=totalSoldadosDefensor;
				end if;
				dbms_output.put_line('--------------------------------------');
				dbms_output.put_line('La cantidad de dados permitidos es de: '||cantdados);
				dbms_output.put_line('  ');
				
				-----------------------------------------------
				--Llenado de listas
				-----------------------------------------------
			
				--Puedo llamar una funcion y pasar por parametros los dados, cantReg y cantCom
				dbms_output.put_line('--------------------------------------');
				dbms_output.put_line('Preparando ataques');
				listadaniosAtacante:= calcularataques(cantRegActuAtac, cantComActAtac, cantdados);
				listadaniosDefensor:= calcularataques(cantRegActuDef, cantComActDef, cantdados);
				dbms_output.put_line('Cargando......');
				dbms_output.put_line('-----------');
				dbms_output.put_line('----------');
				dbms_output.put_line('---------');
				dbms_output.put_line('--------');
				dbms_output.put_line('-------');
				dbms_output.put_line('------');
				dbms_output.put_line('-----');
				dbms_output.put_line('----');
				dbms_output.put_line('---');
				dbms_output.put_line('--');
				dbms_output.put_line('-');
				dbms_output.put_line('*');
				dbms_output.put_line('Ataques preparados!!');
				----------------------------
				--Fin del llenado
				----------------------------
				
				-----------------------------
				--Comparación
				----------------------------
				for i in 1..cantdados loop
					if listadaniosAtacante(i)>= listadaniosDefensor(i) then
						cantSoldDescAtac:= cantSoldDescAtac+1;
					else
						cantSoldDescDef:= cantSoldDescDef+1;
					end if;
				end loop;
				dbms_output.put_line(' ');
				dbms_output.put_line('------------------------------------------------------------');
				dbms_output.put_line('Cantidad de soldados descuenta el atacante: '||cantSoldDescAtac);
				dbms_output.put_line(' ');
				dbms_output.put_line('Cantidad de soldados descuenta el defensor: '||cantSoldDescDef);
				dbms_output.put_line('-------------------------------------------------------------');
				dbms_output.put_line(' ');
				-----------------------------------------------------------------------------------------------
				--	Fase de comparación de ataques para descuento de reg, com o conquistar colonias
				-----------------------------------------------------------------------------------------------
				dbms_output.put_line('Inicia la fase de comparación!!');
				-->
				-->
				--------------------------------------------------------------
				if cantSoldDescAtac>= totalSoldadosDefensor then
					
					----------------------------------
					--			Descuente del atacante
					-----------------------------------
					if cantComActAtac>= cantSoldDescDef and cantSoldDescDef>0 then
						--descuenta todos los comandantes del atacante
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniaactual
											and Id_tipo_figura= 2
											and rownum<= cantSoldDescDef);
											
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('Se han descontado comandantes del atacante');
						
					elsif cantComActAtac =0 and cantSoldDescDef<=cantRegActuAtac then
						--Solo elimina regimientos
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniaactual
											and Id_tipo_figura= 1
											and rownum<= cantSoldDescDef);
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('Se han descontado regimientos del atacante');
						
					elsif cantSoldDescDef=0 then
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('El defensor no obtuvo muertes a favor');
					
					else
						--descuenta regimientos y comandantes del atacante
						residuo:= cantSoldDescDef- cantComActAtac;
						
						--Todos los comandantes
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniaactual
											and Id_tipo_figura= 2);
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('Se han descontado todos los comandantes del atacante');
						
						--Parte de los regimientos
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniaactual
											and Id_tipo_figura= 1
											and rownum<= residuo);
						dbms_output.put_line('**************************************************************');						
						dbms_output.put_line('Se han descontado '||residuo||' regimientos del atacante');
						
					end if;
					
					--Colonización
					delete 
					from figura
					where id_colonia= pidcoloniadestino;
					
					--Inserto un regimiento en la colonia colonizada
					Insert into figura (Id_figura, Id_tipo_figura, Id_colonia, Id_jugador) values (sqid_figura.nextval, 1, pidcoloniadestino, pidjugador);
					
					dbms_output.put_line('Ha ocurrido una colonización!');
					dbms_output.put_line('**************************************************************');
					dbms_output.put_line('Movilización del regimiento a la nueva colonia en proceso');
					
					--Hago un update en los regimientos del atacante
					delete 
					from figura
					where Id_figura IN (select Id_figura
										from figura
										where id_colonia= pidcoloniaactual
										and rownum<=1);	
					dbms_output.put_line('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
					dbms_output.put_line('Movimiento exitoso!');
					
				-->
				-->
				--------------------------------------------------------------
				elsif cantSoldDescAtac< totalSoldadosDefensor and 
					cantSoldDescDef< totalSoldadosAtacante then
					--Ambas tropas realizan descuentos
					dbms_output.put_line('**************************************************************');
					dbms_output.put_line('Reporte de muertes de ambas colonias');
					dbms_output.put_line('Colonización sin exito');
					
					--------------------
					--Atacante
					--------------------
					
					if cantComActAtac>= cantSoldDescDef and cantSoldDescDef>0 then
						--descuenta todos los comandantes del atacante
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniaactual
											and Id_tipo_figura= 2
											and rownum<= cantSoldDescDef);
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('Se han descontado comandantes del atacante');
					elsif cantComActAtac =0 and cantSoldDescDef<=cantRegActuAtac then
						--Solo elimina regimientos
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniaactual
											and Id_tipo_figura= 1
											and rownum<= cantSoldDescDef);
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('Se han descontado regimientos del atacante');
						
					elsif cantSoldDescAtac=0 then
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('El atacante no obtuvo muertes a favor');
					
					else
						--descuenta regimientos y comandantes del atacante
						residuo:= cantSoldDescDef- cantComActAtac;
						
						--Todos los comandantes
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniaactual
											and Id_tipo_figura= 2);
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('Se han descontado todos los comandantes del atacante');
						
						--Parte de los regimientos
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniaactual
											and Id_tipo_figura= 1
											and rownum<= residuo);
						dbms_output.put_line('**************************************************************');						
						dbms_output.put_line('Se han descontado '||residuo||' regimientos del atacante');
						
					end if;

				
				
					-------------------
					--Defensor
					-------------------
					if cantComActDef>= cantSoldDescAtac and cantSoldDescAtac>0 then
						--descuenta todos los comandantes del defensor
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniadestino
											and Id_tipo_figura= 2
											and rownum<=cantSoldDescAtac);
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('Se han descontado comandantes del defensor');
					elsif cantComActDef =0 and cantSoldDescAtac<=cantRegActuDef then
						--Solo elimina regimientos
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniadestino
											and Id_tipo_figura= 1
											and rownum<= cantSoldDescAtac);
						dbms_output.put_line('**************************************************************');					
						dbms_output.put_line('Se han descontado regimientos del defensor');
						
					elsif cantSoldDescDef=0 then
						
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('El defensor no obtuvo muertes a favor');
						
					else
						--descuenta regimientos y comandantes del atacante
						residuo:= cantSoldDescAtac- cantComActDef;
						
						--Todos los comandantes
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniadestino
											and Id_tipo_figura= 2);
						dbms_output.put_line('**************************************************************');				
						dbms_output.put_line('Se han descontado todos los comandantes del defensor');
						
						--Parte de los regimientos
						DELETE
						FROM Figura
						WHERE Id_figura IN (SELECT Id_figura
											FROM Figura 
											WHERE Id_colonia= pidcoloniadestino
											and Id_tipo_figura= 1
											and rownum<= residuo);
						
						dbms_output.put_line('**************************************************************');					
						dbms_output.put_line('Se han descontado '||residuo||' regimientos del defensor');
						
						
					end if;

				-->
				-->
				--------------------------------------------------------------
				else
					--Defensor elimina todos los comandantes
					DELETE
					FROM Figura
					WHERE Id_figura IN (SELECT Id_figura
										FROM Figura 
										WHERE Id_colonia= pidcoloniaactual
										and Id_tipo_figura= 2);
					
					--Defensor elimina los regimientos
					DELETE
					FROM Figura
					WHERE Id_figura IN (SELECT Id_figura
										FROM Figura 
										WHERE Id_colonia= pidcoloniaactual
										and Id_tipo_figura= 1
										and rownum<= cantRegActuAtac);
					
					dbms_output.put_line('**************************************************************');					
					dbms_output.put_line('Se podría decir que la batalla estuvo al mando de la colonia defensora!');
					dbms_output.put_line('La colonia defensora ha eliminado todas las tropas del atacante!!');
					
				end if;
				
				dbms_output.put_line('------------------------------------');
				dbms_output.put_line('Fase de ataque terminada');
				dbms_output.put_line('------------------------------------');
			
			
			else
					dbms_output.put_line(' ');
					dbms_output.put_line('------------------------------------');
					dbms_output.put_line('********ERROR***********');
					dbms_output.put_line('Imposible atacar a la misma colonia');
					dbms_output.put_line('------------------------------------');
					dbms_output.put_line(' ');
			end if;
			
		ELSE
			--Cantidad insuficiente de tropas
			dbms_output.put_line('------------------------------------');
			dbms_output.put_line('********ERROR***********');
			dbms_output.put_line('La cantidad necesaria para ataques no es suficiente');
			dbms_output.put_line('------------------------------------');
		END IF;
		
	ELSE	
		--No es frontera y sale
		dbms_output.put_line('------------------------------------');
		dbms_output.put_line('********ERROR***********');
		dbms_output.put_line('La colonia escogida no es frontera o es de mis colonias');
		dbms_output.put_line('Permiso para atacar denegado');
		dbms_output.put_line('------------------------------------');
	END IF;
	
END;
/
