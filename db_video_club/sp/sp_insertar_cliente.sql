USE db_video_club;

GO
CREATE PROCEDURE sp_Insertar_Cliente
@NOMBRE_CLI VARCHAR(20),
@APELLIDO_CLI VARCHAR(20),
@DIRECCION VARCHAR(100),
@TEL VARCHAR(40),
@EMAIL VARCHAR(100)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		IF @NOMBRE_CLI IS NULL OR @NOMBRE_CLI LIKE '%[^a-zA-Z ]%'
		BEGIN
			PRINT ('Nombre del cliente es erroneo')
			ROLLBACK
			RETURN
		END

		IF @APELLIDO_CLI IS NULL OR @APELLIDO_CLI LIKE '%[^a-zA-Z ]%'
		BEGIN
			PRINT ('Apellido del cliente es erroneo')
			ROLLBACK
			RETURN
		END

		IF @DIRECCION IS NULL OR @DIRECCION LIKE '%[^a-zA-Z0-9 ]%'
		BEGIN
			PRINT ('Dirección del cliente es erronea')
			ROLLBACK
			RETURN
		END


		SET @EMAIL = TRIM(LOWER(@EMAIL))

		IF EXISTS (SELECT * FROM Cliente WHERE Email = @EMAIL)
		BEGIN
			PRINT ('Email ya estaba registrado')
			ROLLBACK
			RETURN
		END

		IF	@EMAIL IS NULL		OR
			@EMAIL LIKE '% %'	OR
			@EMAIL LIKE '%@%@'	OR
			@EMAIL LIKE '%@.%'	OR
			@EMAIL LIKE '%.@%'	OR
			@EMAIL LIKE '%[^a-z0-9-_.@]%' OR
			LEN(@EMAIL) < 6
		BEGIN
			PRINT('Correo Inválido')
			ROLLBACK
			RETURN
		END

		SET @NOMBRE_CLI = TRIM(UPPER(@NOMBRE_CLI))
		SET @APELLIDO_CLI = TRIM(UPPER(@APELLIDO_CLI))
		SET @DIRECCION = TRIM(UPPER(@DIRECCION))

		INSERT INTO Cliente( NombreCliente, ApellidoCliente, Direccion, Tel, Email)
		VALUES
		(@NOMBRE_CLI, @APELLIDO_CLI, @DIRECCION, @TEL, @EMAIL)

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
	END CATCH
END
GO
