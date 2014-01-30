--=================================================
--Autor: Stephan Endres, Diego Salas
--Resumen: Creacion de la base de datos
--Fecha creacion: 20/08/2013
--Fecha modificacion:29/01/2014
--=================================================
Prompt ******  Reabastecimiento  ....

CREATE TABLE reabastecimiento
    ( Id_reabastecimiento NUMBER NOT NULL primary key,
      Nombre    VARCHAR2(25),
      Valor    NUMBER(1)
    );
	
CREATE SEQUENCE sqid_reabastecimiento
 START WITH     1
 INCREMENT BY   1;
 
Prompt ******  Punto  ....

CREATE TABLE punto
    ( Id_punto NUMBER NOT NULL primary key,
      Nombre    VARCHAR2(25),
      Cant_puntos    NUMBER(1)
    );

CREATE SEQUENCE sqid_punto
 START WITH     1
 INCREMENT BY   1;
	
Prompt ******  Continente ....

CREATE TABLE continente 
    ( Id_continente NUMBER NOT NULL primary key,
      Nombre    VARCHAR2(25),
      Valor_puntos    NUMBER(5)	
    ); 

CREATE SEQUENCE sqid_continente
 START WITH     1
 INCREMENT BY   1;
	
Prompt ******  Colonias ....

CREATE TABLE colonia
( Id_colonia NUMBER NOT NULL primary key,
  Nombre    VARCHAR2(25),
  Cod_colonia    VARCHAR2(5) NOT NULL,
  Id_continente    NUMBER NOT NULL
);

ALTER TABLE colonia
ADD ( CONSTRAINT Cod_unique UNIQUE (Cod_colonia)
	, CONSTRAINT colonia_continente_fk
        	 FOREIGN KEY (Id_continente)
          	  REFERENCES continente(Id_continente) 
    ) ;

CREATE SEQUENCE sqid_colonia
 START WITH     1
 INCREMENT BY   1;
	
Prompt ******  Fronteras ....

CREATE TABLE frontera
( Id_colonia NUMBER NOT NULL,
  Frontera   NUMBER NOT NULL
);

ALTER TABLE frontera
ADD ( CONSTRAINT	frontera_pk 
					 primary key (Id_colonia,Frontera)
	, CONSTRAINT     frontera_colonia_fk
                     FOREIGN KEY (Id_colonia)
                      REFERENCES colonia (Id_colonia)
    , CONSTRAINT     frontera_frontera_fk
                     FOREIGN KEY (Frontera)
                      REFERENCES colonia (Id_colonia)
     ) ;

Prompt ******  Jugador ....

CREATE TABLE jugador
    ( Id_jugador    NUMBER NOT NULL primary key,
		color  VARCHAR2(40) NOT NULL,
		Energia NUMBER NOT NULL,
		Puntos NUMBER NOT NULL
    ) ;

CREATE SEQUENCE sqid_jugador
 START WITH     1
 INCREMENT BY   1;
	
Prompt ******  Eras ....

CREATE TABLE era
    ( Id_era    NUMBER NOT NULL primary key,
		Id_jugador NUMBER NOT NULL
    ) ;

ALTER TABLE era
ADD ( CONSTRAINT era_jugador_fk
       		 FOREIGN KEY (Id_jugador)
        	  REFERENCES jugador (Id_jugador)
     ) ;

CREATE SEQUENCE sqid_era
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       5;


Prompt ******  Turnos ....

CREATE TABLE turno
    ( Id_turno    NUMBER NOT NULL primary key,
		Id_jugador NUMBER NOT NULL
    ) ;

ALTER TABLE turno
ADD ( CONSTRAINT turno_jugador_fk
       		 FOREIGN KEY (Id_jugador)
        	  REFERENCES jugador (Id_jugador)
     ) ;
	 
CREATE SEQUENCE sqid_turno
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       5;

 Prompt ******  Tipo de Figura ....
 
 CREATE TABLE tipo_figura
    ( Id_tipo_figura    NUMBER NOT NULL primary key,
		Nombre VARCHAR2(25) NOT NULL,
		Cant_lado_dado NUMBER(1) NOT NULL,
		Coste_energia NUMBER(1) NOT NULL
    ) ;
 
CREATE SEQUENCE sqid_tipo_figura
 START WITH     1
 INCREMENT BY   1;
 
Prompt ******  Figura ....

CREATE TABLE figura
    ( Id_figura NUMBER NOT NULL primary key,
		Id_tipo_figura    NUMBER NOT NULL,
		Id_colonia    NUMBER NOT NULL,
		Id_jugador    NUMBER NOT NULL		
    ) ;

ALTER TABLE figura
ADD ( CONSTRAINT     figura_tfigura_fk
                     FOREIGN KEY (Id_tipo_figura)
                      REFERENCES tipo_figura (Id_tipo_figura)
    , CONSTRAINT     figura_colonia_fk
                     FOREIGN KEY (Id_colonia)
                      REFERENCES colonia (Id_colonia)
    , CONSTRAINT     figura_jugador_fk
                     FOREIGN KEY (Id_jugador)
                      REFERENCES jugador (Id_jugador)
    ) ;

CREATE SEQUENCE sqid_figura
 START WITH     1
 INCREMENT BY   1;
 
 
 Prompt ******  COLONIA_ASIGNADA ....
 
 CREATE TABLE COLONIA_ASIGNADA 
	(	"ID_JUGADOR" NUMBER, 
		"ID_COLONIA" NUMBER
	);
 
