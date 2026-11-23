SET SERVEROUTPUT ON
ROLLBACK;

DECLARE
    v_id_transaccion VARCHAR2(100);
BEGIN
    -- Antes: todavía no hay transacción abierta
    DBMS_OUTPUT.PUT_LINE('Antes del bloque: transaccion = ' ||
                    NVL(DBMS_TRANSACTION.LOCAL_TRANSACTION_ID, 'ninguna'));

    -- COMIENZO: se nombra la transacción y se ejecuta el primer DML
    SET TRANSACTION NAME 'tx_departments2';

    INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
    VALUES (330, 'Logistica', NULL, 1700);

    UPDATE departments2
    SET    department_name = 'Logistica Norte'
    WHERE  department_id = 330;

    -- Durante: la transacción ya tiene identificador activo
    v_id_transaccion := DBMS_TRANSACTION.LOCAL_TRANSACTION_ID;
    DBMS_OUTPUT.PUT_LINE('COMIENZO: transaccion ' || v_id_transaccion ||
                    ' abierta (1 INSERT y 1 UPDATE pendientes)');

    -- FINALIZACIÓN: COMMIT confirma los cambios y cierra la transacción
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('FIN: COMMIT de la transaccion ' || v_id_transaccion);

    -- Después: ya no hay transacción activa
    DBMS_OUTPUT.PUT_LINE('Despues del COMMIT: transaccion = ' ||
                    NVL(DBMS_TRANSACTION.LOCAL_TRANSACTION_ID, 'ninguna'));
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM || '. Se hizo ROLLBACK.');
        RAISE;
END;
/

-- Comprobación: la fila 330 quedó guardada definitivamente
SELECT department_id, department_name, location_id
FROM   departments2
WHERE  department_id = 330;