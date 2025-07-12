
CREATE OR ALTER TRIGGER tg_Validar_Usuario ON Usuario
FOR INSERT, UPDATE 
AS 
BEGIN
    DECLARE @TIPO CHAR(3) = (SELECT Tipo_Doc FROM inserted)
    DECLARE @DNI CHAR(8) = (SELECT Nro_Doc FROM inserted)
    DECLARE @CORREO CHAR(8) = (SELECT Correo FROM inserted)
    DECLARE @FNAC CHAR(20) = (SELECT FNacimiento FROM inserted)

    IF @TIPO IS NULL OR (@TIPO <> 'LC' AND  @TIPO <> 'DNI')
        RAISERROR('El tipo de documento no concuerda con LC / DNI', 20, 1)
    IF dbo.f_Validar_Dni(@DNI) = 0
        RAISERROR ('Nro de DNI Erroneo',11,1);
    IF dbo.f_Validar_Correo_Electronico(@CORREO)  = 0
         RAISERROR('El correo eletrónico es inválido', 20, 1)
    IF dbo.f_Validar_Fecha(@FNAC) = 0
        RAISERROR('La fecha de nacimiento es erronea', 20, 1)
END