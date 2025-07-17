
GO
CREATE OR ALTER FUNCTION f_Clientes_Aquilarion_Pelicula(@TIT_PEL VARCHAR(MAX))
RETURNS TABLE
AS 
    RETURN 
    (
        SELECT DISTINCT PRE.CodSocio C_SOCIO
        FROM Prestamo AS PRE 
        WHERE PRE.CodPelicula IN 
        (
            SELECT PEL.CodPelicula
            FROM Pelicula AS PEL 
            WHERE UPPER(PEL.Titulo) = UPPER(@TIT_PEL)
        )
    )