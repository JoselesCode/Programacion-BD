VAR b_annio NUMBER;
EXEC :b_annio := 2024;

DECLARE
    v_min_id_emp NUMBER;
    v_max_id_emp NUMBER;
    v_id_empleado NUMBER;
    v_num_emp NUMBER;
    v_dvrun_emp VARCHAR2(20);
    v_nombre_completo VARCHAR2(250);
    v_nombre_comuna VARCHAR2(250);
    v_sueldo_b NUMBER;
    v_porc NUMBER;
    v_valor_mov NUMBER;
    v_m_extra NUMBER;
    v_total NUMBER;
    
BEGIN
    SELECT MAX(id_emp),
    MIN(id_emp)
    INTO v_max_id_emp , v_min_id_emp
    FROM EMPLEADO e;
    
    WHILE v_min_id_emp <= v_max_id_emp LOOP
        SELECT e.ID_EMP, e.numrun_emp,e.DVRUN_EMP,
        e.PNOMBRE_EMP||' '||e.SNOMBRE_EMP||' '||e.APPATERNO_EMP||' '|| e.APMATERNO_EMP,
        c.nombre_comuna,
        e.sueldo_base,
        TRUNC(e.sueldo_base / 100000),
        round(TRUNC(e.sueldo_base / 100000)*e.sueldo_base /100,0),
        CASE
            WHEN c.nombre_comuna = 'María Pinto' THEN 20000
            WHEN c.nombre_comuna = 'Curacaví' THEN 25000
            WHEN c.nombre_comuna = 'Talagante' THEN 30000
            WHEN c.nombre_comuna = 'El Monte' THEN 35000
            WHEN c.nombre_comuna = 'Buin' THEN 40000
            ELSE 0
        END,
        (v_m_extra +v_valor_mov)
        
        INTO v_id_empleado,v_num_emp,v_dvrun_emp,v_nombre_completo,
        v_nombre_comuna,v_sueldo_b,v_porc,v_valor_mov,v_m_extra,v_total
        FROM EMPLEADO e JOIN COMUNA c ON e.id_comuna = c.id_comuna
        WHERE e.id_emp = v_min_id_emp;
        
        DBMS_OUTPUT.PUT_LINE(:b_annio||' '|| RPAD(v_id_empleado,4)||' '||
        v_num_emp ||' '|| v_dvrun_emp||'  '||RPAD(v_nombre_completo,30)
        ||'  '|| RPAD(v_nombre_comuna,13)||'  '||RPAD(v_sueldo_b,10)
        ||' '||RPAD( v_porc,3) ||''|| RPAD(v_valor_mov,9)||' '||RPAD(v_m_extra,6)
        ||' '|| v_total) ;
        
        v_min_id_emp := v_min_id_emp +10;
    END LOOP;
END;

select * from empleado;