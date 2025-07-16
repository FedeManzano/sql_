
GO
CREATE OR ALTER FUNCTION f_Get_Nro_Ejemplar(@COD_PEL INT)
RETURNS INT
AS 
BEGIN
    IF NOT EXISTS (SELECT *  FROM Pelicula WHERE CodPelicula = @COD_PEL)
        RETURN -1
    DECLARE @NRO_EJEMPLAR INT = 
    (
        SELECT COUNT(*)
        FROM Ejemplar AS eje
        WHERE eje.CodPelicula = @COD_PEL
    ) + 1
    
    RETURN @NRO_EJEMPLAR
END
GO
