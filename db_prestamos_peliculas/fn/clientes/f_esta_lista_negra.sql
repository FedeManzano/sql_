
GO
CREATE OR ALTER FUNCTION f_Esta_Lista_Negra(@COD_SOC CHAR(6))
RETURNS INT 
AS 
BEGIN 
    IF @COD_SOC IN 
    (
        SELECT c.CodSocio
        FROM Cliente c 
        WHERE c.Estado = 0
    )
        RETURN 1
    RETURN 0
END
GO
