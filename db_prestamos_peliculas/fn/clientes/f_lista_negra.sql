
GO
CREATE OR ALTER FUNCTION f_Lista_Negra()
RETURNS TABLE 
AS 
    RETURN
    (
        SELECT c.CodSocio
        FROM Cliente c 
        WHERE c.Estado = 0
    )
GO