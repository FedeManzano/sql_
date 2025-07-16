
GO
CREATE PROCEDURE sp_Insertar_Cliente
@NOMBRE VARCHAR(100),
@APELLIDO VARCHAR(100),
@TELEFONO VArCHAR(50),
@EMAIL VARCHAR(100)
AS 
BEGIN

    IF  @NOMBRE IS NULL OR 
        @NOMBRE LIKE '%[^a-zA-Z ]%'
    BEGIN
        PRINT('Nombre de cliente erroneo')
        RETURN 0 
    END

    IF  @APELLIDO IS NULL OR 
        @APELLIDO LIKE '%[^a-zA-Z ]%'
    BEGIN
        PRINT('Apellido de cliente erroneo')
        RETURN 0 
    END  

     IF  @EMAIL IS NULL OR 
         dbo.f_Validar_Correo_Electronico(@EMAIL) = 0
    BEGIN
        PRINT('Email de cliente erroneo')
        RETURN 0 
    END  


    IF EXISTS (SELECT * FROM Cliente WHERE Email = @EMAIL)
    BEGIN
        PRINT('Email repetido, ya utilizado')
        RETURN 0 
    END 


    DECLARE @NSOCIO CHAR(6) = dbo.f_Generar_Codigo_Socio()
    EXEC sp_Format_Tittle @CADENA = @NOMBRE OUTPUT
    EXEC sp_Format_Tittle @CADENA = @APELLIDO OUTPUT
    SET @EMAIL = LOWER(@EMAIL)

    INSERT INTO Cliente(CodSocio, NombreSocio, ApellidoSocio, Email, Telefono)
    VALUES 
    (@NSOCIO, @NOMBRE, @APELLIDO, @EMAIL, @TELEFONO)

    RETURN 1
END
GO