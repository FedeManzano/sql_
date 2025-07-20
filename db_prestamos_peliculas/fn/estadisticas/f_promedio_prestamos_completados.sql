
GO
CREATE OR ALTER FUNCTION f_Promedio_prestamos_Completados()
RETURNS FLOAT
AS 
BEGIN 
    RETURN 
    (
        SELECT AVG(CANT_PRESTAMOS_ACTIVOS.CANT_PRES_ACTIVOS)
        FROM 
        (
            SELECT COUNT(PRE.FechaPrestamo) CANT_PRES_ACTIVOS
            FROM Prestamo PRE 
            WHERE PRE.FechaDevolucion IS NOT  NULL
        ) AS CANT_PRESTAMOS_ACTIVOS
    )
END
