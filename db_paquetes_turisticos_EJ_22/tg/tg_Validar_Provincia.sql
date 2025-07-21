-- USE db_paquetes_turisticos
GO 
CREATE OR ALTER TRIGGER tg_Validar_Provincia ON Provincia 
FOR INSERT
AS 
BEGIN
    DECLARE @COD_PAIS INT = (SELECT CodPais FROM inserted)
    IF NOT EXISTS (SELECT * FROM Pais WHERE CodPais = @COD_PAIS)
        RAISERROR('El código del país ingresado no existe', 15, 1)
END 
GO

