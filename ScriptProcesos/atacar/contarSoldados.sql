--=================================================
--Autor: Diego Salas
--Resumen: Devuelve la cantidad de tropas de un contrincante determinado
-- en una colonia determinada
--Fecha creacion: 20/08/2013
--Fecha modificacion:29/01/2014
--=================================================
CREATE OR REPLACE FUNCTION contarSoldados (pidcolonia NUMBER, pidtipofigura NUMBER)
	RETURN NUMBER
AS
	cant NUMBER:=0;
BEGIN
	
	--Cuento los regimientos que tiene el enemigo
			select count(fig.Id_Tipo_Figura) INTO cant
			from Figura fig
			INNER JOIN Tipo_figura tf on fig.Id_tipo_figura= tf.Id_tipo_figura
			INNER JOIN Jugador j on fig.Id_jugador= j.Id_jugador
			INNER JOIN Colonia c ON fig.Id_colonia= c.Id_colonia
			WHERE c.Id_colonia= pidcolonia
			and tf.Id_Tipo_Figura= pidtipofigura;
	
	
	
	RETURN nvl(cant,0);
END;
/
