
GO
CREATE OR ALTER FUNCTION f_Mes_Mas_Alquileres_Año (@AÑO INT)
RETURNS VARCHAR(MAX)
AS 
BEGIN

    DECLARE @MES_AÑO VARCHAR(MAX) = ''

    SELECT @MES_AÑO = dbo.f_Mes_Año_Str(MONTH(PRE.FechaPrestamo), @AÑO)
    FROM Prestamo AS PRE 
    WHERE YEAR(PRE.FechaPrestamo) = @AÑO 
    GROUP BY MONTH(PRE.FechaPrestamo)
    HAVING COUNT(PRE.CodPrestamo) >= 
    (
        SELECT MAX(CANTIDAD_PRESTAMOS_MES.CANT_MES)
        FROM 
        (
            SELECT MONTH(PRE.FechaPrestamo) AS MES, COUNT(PRE.CodPrestamo) AS CANT_MES 
            FROM Prestamo AS PRE 
            WHERE YEAR(PRE.FechaPrestamo) = @AÑO 
            GROUP BY MONTH(PRE.FechaPrestamo)
        ) AS CANTIDAD_PRESTAMOS_MES
    )

    RETURN @MES_AÑO
END