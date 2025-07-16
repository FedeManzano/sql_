
GO
CREATE OR ALTER FUNCTION f_Generar_Codigo_Socio()
RETURNS CHAR(6)
AS 
BEGIN 
    DECLARE @CODSOC CHAR(6) = dbo.f_Random_Letters(1,1) + '-' + dbo.f_Random_Numbers(3)

    WHILE EXISTS (SELECT * FROM Cliente WHERE CodSocio = @CODSOC)
    BEGIN 
        SET @CODSOC = dbo.f_Random_Letters(1,1) + '-' + dbo.f_Random_Numbers(3)
    END
    RETURN @CODSOC
END
GO