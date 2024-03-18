DECLARE
    v_nombre VARCHAR(20);
    v_apellido Varchar(20);
BEGIN
    SELECT NOMBRE_CLI, appaterno_cli
    INTO v_nombre, v_apellido
    FROM CLIENTE
    WHERE numrut_cli = 4604866;



    DBMS_OUTPUT.PUT_LINE('El nombre del clinete es '|| v_nombre||' '|| v_apellido );
    
End;

