-- USE db_paquetes_turisticos

GO
CREATE OR ALTER FUNCTION f_Generar_Email_Random ()
RETURNS VARCHAR(MAX)
AS 
BEGIN
    DECLARE @NUMERO VARCHAR(4) = dbo.f_Random_Numbers(2)
    DECLARE @EMAIL VARCHAR(MAX) = dbo.f_Random_Letters(7, DEFAULT) + '_' + @NUMERO + '@gmail.com'
    RETURN @EMAIL 
END
GO
