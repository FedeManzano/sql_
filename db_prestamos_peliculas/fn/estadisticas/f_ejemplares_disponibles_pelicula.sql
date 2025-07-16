
GO
CREATE OR ALTER FUNCTION f_Ejemplares_Disponibles_Pelicula(@C_PEL INT)
RETURNS TABLE 
AS 
    RETURN 
    (
        SELECT * FROM vw_Estado_Ejemplares
        WHERE C_PELICULA = @C_PEL
    )
GO
