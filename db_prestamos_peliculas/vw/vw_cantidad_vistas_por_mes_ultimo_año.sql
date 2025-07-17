GO
CREATE OR ALTER VIEW vw_Cantidad_Vistas_Peliculas_Por_Mes
AS 
    SELECT MONTH(pre.FechaPrestamo) MES, pre.CodPelicula, COUNT(pre.CodPrestamo) CANT_PEL
    FROM Prestamo pre 
    WHERE YEAR(pre.FechaPrestamo) = 
    (
        SELECT MAX(YEAR(FechaPrestamo))
        FROM Prestamo
    )
    GROUP BY MONTH(pre.FechaPrestamo), pre.CodPelicula
GO