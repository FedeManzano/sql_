USE db_video_club;

GO
CREATE PROCEDURE sp_Realizar_Alquiler
@COD_PEL INT,
@COD_CLI CHAR(36),
@FECHA_ALQ DATE
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Pelicula WHERE CodPel = @COD_PEL)
		BEGIN
			PRINT('La pelicula no existe')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF dbo.f_Validar_Fecha(@FECHA_ALQ) = 0
		BEGIN
			PRINT('La fecha es inválida')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF NOT EXISTS (SELECT * FROM Cliente WHERE CodCli = @COD_CLI)
		BEGIN
			PRINT('El cliente no existe')
			ROLLBACK TRANSACTION
			RETURN
		END


		IF (SELECT Estado FROM Cliente WHERE CodCli = @COD_CLI) = 0
		BEGIN
			PRINT('El cliente fue dado de baja')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF (SELECT COUNT(1) FROM Alquiler WHERE CodCli = @COD_CLI AND FechaDev IS NULL) > 0
		BEGIN
			PRINT('El cliente debe ejemplares no devueltos')
			ROLLBACK TRANSACTION
			RETURN
		END

		DECLARE @NRO_EJ SMALLINT = (SELECT TOP(1) NroEj FROM Ejemplar WHERE CodPel = @COD_PEL AND Estado = 1)

		DECLARE @ID_ALQ INT = (SELECT COUNT(1) FROM Alquiler) + 1


		INSERT INTO Alquiler(IdAlquiler, CodPel,NroEj, CodCli, FechaAlq)
		VALUES
		(@ID_ALQ, @COD_PEL, @NRO_EJ, @COD_CLI, @FECHA_ALQ)

		UPDATE Ejemplar SET Estado = 0 WHERE CodPel = @COD_PEL AND NroEj = @NRO_EJ

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
	END CATCH
END
GO