
GO
CREATE OR ALTER FUNCTION f_Generar_Codigo_Prestamo()
RETURNS CHAR(7)
AS 
BEGIN 
    DECLARE @CODPREST CHAR(7) = dbo.f_Random_Letters(3,1) + '-' + dbo.f_Random_Numbers(3)

    WHILE EXISTS (SELECT * FROM Prestamo WHERE CodSocio = @CODPREST)
    BEGIN 
        SET @CODPREST = dbo.f_Random_Letters(3,1) + '-' + dbo.f_Random_Numbers(3)
    END
    RETURN @CODPREST
END
GO