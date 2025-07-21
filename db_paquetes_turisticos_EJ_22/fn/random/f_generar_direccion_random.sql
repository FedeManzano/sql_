-- USE db_paquetes_turisticos

GO
CREATE OR ALTER FUNCTION f_Generar_Direccion_Random ()
RETURNS VARCHAR(MAX)
AS 
BEGIN
    DECLARE @CALLE VARCHAR(40) = dbo.f_Random_Letters(20, DEFAULT),
            @NUMERO VARCHAR(4) = dbo.f_Random_Numbers(4),
            @LOCALIDAD VARCHAR(40) = dbo.f_Random_Letters(13, DEFAULT)

    DECLARE @DIRECCION VARCHAR(MAX) = @CALLE + ' ' + @NUMERO + ', ' + @LOCALIDAD

    RETURN @DIRECCION 
END
GO


