USE db_viajes;

GO
ALTER PROCEDURE sp_Insertar_Chofer
@NOMBRE VARCHAR(30),
@APELLIDO VARCHAR(30),
@F_ING DATE,
@TELEFONO VARCHAR(30)
AS
BEGIN
	BEGIN TRANSACTION 
	BEGIN TRY
		IF @NOMBRE LIKE '%[^a-zA-Z]%'
		BEGIN
			PRINT('Nombre erroneo')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF @APELLIDO LIKE '%[^a-zA-Z]%'
		BEGIN
			PRINT('Apellido erroneo')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF dbo.f_Validar_Fecha(@F_ING) = 0
		BEGIN
			PRINT('Fecha de ingreso erronea')
			ROLLBACK TRANSACTION
			RETURN
		END

		DECLARE @LIC CHAR(9) = dbo.f_Generador_Licencias()

		INSERT INTO Chofer(NroLicenciaChofer, Nombre, Apellido, Telefono, Fecha_ingreso)
		VALUES
		(@LIC, UPPER(@NOMBRE), UPPER(@APELLIDO), @TELEFONO, @F_ING)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END
GO