
GO
CREATE OR ALTER FUNCTION f_Alquilo_Menos_Peliculas()
RETURNS TABLE
AS 
    RETURN 
    (
        SELECT pre.CodSocio C_SOC, COUNT(pre.CodPrestamo) AS SOC_MIN_CANTIDAD
        FROM Prestamo AS pre 
        WHERE pre.FechaDevolucion IS NOT NULL
        GROUP BY pre.CodSocio
        HAVING COUNT(pre.CodPrestamo) <=
        (
            SELECT MIN(CANT_PREST_SOCIO.CANT_PREST) MIN_CANTIDAD
            FROM 
            (
                SELECT pre.CodSocio AS COD_SOC, COUNT(pre.CodPrestamo) AS CANT_PREST
                FROM Prestamo AS pre 
                WHERE pre.FechaDevolucion IS NOT NULL
                GROUP BY pre.CodSocio
            ) AS CANT_PREST_SOCIO
        )
    )