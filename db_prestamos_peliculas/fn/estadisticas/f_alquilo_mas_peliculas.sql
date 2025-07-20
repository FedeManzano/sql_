
GO
CREATE OR ALTER FUNCTION f_Alquilo_Mas_Peliculas()
RETURNS TABLE
AS 
    RETURN 
    (
        SELECT pre.CodSocio C_SOC, COUNT(pre.CodPrestamo) AS SOC_MAX_CANTIDAD
        FROM Prestamo AS pre 
        WHERE pre.FechaDevolucion IS NOT NULL
        GROUP BY pre.CodSocio
        HAVING COUNT(pre.CodPrestamo) >= 
        (
            SELECT MAX(CANT_PREST_SOCIO.CANT_PREST) MAX_CANTIDAD
            FROM 
            (
                SELECT pre.CodSocio AS COD_SOC, COUNT(pre.CodPrestamo) AS CANT_PREST
                FROM Prestamo AS pre 
                WHERE pre.FechaDevolucion IS NOT NULL
                GROUP BY pre.CodSocio
            ) AS CANT_PREST_SOCIO
        )
    )