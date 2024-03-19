--Jose Diaz Gonzalez / 18-03-2024
--ACTIVIDAD 1.1
--CASO 1
--VAR b_run1 NUMBER;
--EXEC :b_run1 := 11846972;
--VAR b_run2 NUMBER;
--EXEC :b_run2 := 18560875;
DECLARE
    v_nombre VARCHAR2(20);
    v_run VARCHAR2(20);
    v_sueldo NUMBER;
    v_bonificacion NUMBER;
BEGIN
    SELECT NOMBRE_EMP || ' ' || APPATERNO_EMP || ' ' || APMATERNO_EMP,
    DVRUT_EMP,SUELDO_EMP , SUELDO_EMP*0.4   
    INTO v_nombre,v_run,v_sueldo,v_bonificacion
    FROM EMPLEADO
    WHERE numrut_emp = :b_run1;
    --MENSAJES DE SALIDA
    DBMS_OUTPUT.PUT_LINE( 'DATOS CALCULO BONIFICACION EXTRA DEL 40% DEL SUELDO');
    DBMS_OUTPUT.PUT_LINE( 'Nombre del Empleado:'|| ' '|| v_nombre);
    DBMS_OUTPUT.PUT_LINE( 'RUN:' ||' '|| :b_run1||'-'||v_run); 
    DBMS_OUTPUT.PUT_LINE('Sueldo:'||' '|| v_sueldo);
    DBMS_OUTPUT.PUT_LINE('Bonificacion Extra:' ||' '||v_bonificacion ); 
    
END;
-------------------------------------------------
--VAR b_run2 NUMBER;
--EXEC :b_run2 := 18560875;
DECLARE
    v_nombre VARCHAR2(20);
    v_run VARCHAR2(20);
    v_sueldo NUMBER;
    v_bonificacion NUMBER;
BEGIN
    SELECT NOMBRE_EMP || ' ' || APPATERNO_EMP || ' ' || APMATERNO_EMP,
    DVRUT_EMP,SUELDO_EMP , SUELDO_EMP*0.4   
    INTO v_nombre,v_run,v_sueldo,v_bonificacion
    FROM EMPLEADO
    WHERE numrut_emp = :b_run2;
    --MENSAJES DE SALIDA
    DBMS_OUTPUT.PUT_LINE( 'DATOS CALCULO BONIFICACION EXTRA DEL 40% DEL SUELDO');
    DBMS_OUTPUT.PUT_LINE( 'Nombre del Empleado:'|| ' '|| v_nombre);
    DBMS_OUTPUT.PUT_LINE( 'RUN:' ||' '|| :b_run2||'-'||v_run); 
    DBMS_OUTPUT.PUT_LINE('Sueldo:'||' '|| v_sueldo);
    DBMS_OUTPUT.PUT_LINE('Bonificacion Extra:' ||' '||v_bonificacion ); 
    
END;
------------------------------------------
--CASO 2
--Consulta--
select* from empleado;
select * from estado_civil;
------------------------------------------------
VAR b_run1 NUMBER;
EXEC :b_run1 := 12487147 ;

DECLARE
    -- Declaración de variables
    v_nombre VARCHAR2(20);        
    v_run VARCHAR2(20);           
    v_sueldo VARCHAR2(20);  -- Se cambia el tipo de dato de INT a VARCHAR2 para poder agregar el símbolo de dólar
    v_estadocivil VARCHAR2(100);  
BEGIN
    SELECT emp.NOMBRE_CLI || ' ' || emp.APPATERNO_CLI || ' ' || emp.APMATERNO_CLI,
           emp.numrut_CLI||'-'||emp.DVRUT_CLI,
           '$' || TO_CHAR(emp.RENTA_CLI,'999G999'),  -- Se agrega el símbolo de dólar antes de formatear el número
           ec.desc_estcivil
    INTO v_nombre, v_run, v_sueldo, v_estadocivil
    FROM CLIENTE emp
    JOIN estado_civil ec ON emp.id_estcivil = ec.id_estcivil
    WHERE emp.numrut_cli = :b_run1;

    -- Mensajes de salida
    DBMS_OUTPUT.PUT_LINE('DATOS DEL CLIENTE');
    DBMS_OUTPUT.PUT_LINE('------------------');
    DBMS_OUTPUT.PUT_LINE('Nombre:'|| ' '|| v_nombre);
    DBMS_OUTPUT.PUT_LINE('RUN:' ||' '||v_run); 
    DBMS_OUTPUT.PUT_LINE('Estado Civil:' ||' '||v_estadocivil );     
    DBMS_OUTPUT.PUT_LINE('RENTA:'||' '|| v_sueldo);    
END;
-------------------

--CASO 3---

































SELECT * FROM empleado;