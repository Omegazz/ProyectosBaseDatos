-- =================================================
-- Autor: Stephan Endres, Diego Salas
-- Resumen: Borra los datos de las tablas del juego.
--  Limpia la sesion.
-- Fecha creacion: 20/08/2013
-- Fecha modificacion:29/01/2014
-- =================================================
create or replace
procedure reset_seq( p_seq_name in varchar2 )
is
    l_val number;
begin

    execute immediate
    'select ' || p_seq_name || '.currval from dual' INTO l_val;

    execute immediate
    'alter sequence ' || p_seq_name || ' increment by -' || l_val || 
                                                          ' minvalue 0';

    execute immediate
    'select ' || p_seq_name || '.nextval from dual' INTO l_val;

    execute immediate
    'alter sequence ' || p_seq_name || ' increment by 1 minvalue 0';
end;
/

delete from figura;
delete from tipo_figura;
delete from turno;
delete from era;
delete from jugador;
delete from frontera;
delete from colonia;
delete from continente;
delete from punto;
delete from reabastecimiento;

exec reset_seq('sqid_jugador');
exec reset_seq('sqid_colonia');
exec reset_seq('sqid_continente');
exec reset_seq('sqid_figura');
exec reset_seq('sqid_punto');
exec reset_seq('sqid_reabastecimiento');
exec reset_seq('sqid_tipo_figura');
exec reset_seq('sqid_turno');
