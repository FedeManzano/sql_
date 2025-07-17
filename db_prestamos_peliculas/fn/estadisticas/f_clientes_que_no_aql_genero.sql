
GO
CREATE OR ALTER FUNCTION f_Clientes_Que_No_Alquilaron_Genero(@GENERO VARCHAR(MAX))
RETURNS TABLE 
AS 
    RETURN
    (
        SELECT DISTINCT PRE.CodSocio AS C_SOCIO
        FROM Prestamo AS PRE 
        WHERE PRE.CodPelicula IN 
        (
            SELECT PEL.CodPelicula
            FROM Pelicula AS PEL 
            WHERE PEL.IdGenero NOT IN 
            (
                SELECT GEN.IdGenero
                FROM Genero AS GEN 
                WHERE LOWER(GEN.NombreGenero) = LOWER(TRIM(@GENERO))
            )
        )
    )
GO
