
-- USE db_paquetes_turisticos

GO 
CREATE OR ALTER PROCEDURE sp_Insertar_Operador
AS 
BEGIN
    DECLARE @COD INT = (SELECT COUNT(1) FROM Operador) + 1
    DECLARE @DIRECCION VARCHAR(MAX) = dbo.f_Generar_Direccion_Random()
    DECLARE @EMAIL VARCHAR(MAX) = dbo.f_Generar_Email_Random()
    DECLARE @PROV INT = dbo.f_Random_Numbers(2) % 18 + 1 

    INSERT INTO Operador(CodOperador, Direccion, Email, CodProvincia)
    VALUES
    (@COD, @DIRECCION, @EMAIL, @PROV)

END
GO