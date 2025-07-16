GO
CREATE OR ALTER FUNCTION f_Disponibilidad_De_Pelicula(@C_PEL INT)
RETURNS TABLE 
AS 
    RETURN 
    (
        SELECT  TITULO, COUNT(ESTADO_EJEMPLAR) EJ_DISPONIBLES, 
                (SELECT COUNT(NroEjemplar) FROM Ejemplar WHERE CodPelicula = @C_PEL ) AS TOTAL_EJE
        FROM dbo.f_Ejemplares_Disponibles_Pelicula(@C_PEL)
        WHERE ESTADO_EJEMPLAR = 'DISPONIBLE'
        GROUP BY TITULO
    )
GO