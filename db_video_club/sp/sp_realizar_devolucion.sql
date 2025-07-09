USE db_video_club;

GO
CREATE PROCEDURE sp_Realizar_Devolucion
@COD_ALQ INT,
@FECHA_DEV DATE
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Alquiler WHERE IdAlquiler = @COD_ALQ)
		BEGIN
			PRINT('El alquiler nunca se realizó')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF dbo.f_Validar_Fecha(@FECHA_DEV) = 0
		BEGIN
			PRINT('La fecha es erronea')
			ROLLBACK TRANSACTION
			RETURN
		END

		DECLARE @COD_PEL INT =  (SELECT CodPel FROM Alquiler WHERE IdAlquiler = @COD_ALQ)
		DECLARE @NRO_EJ SMALLINT =  (SELECT NroEj FROM Alquiler WHERE IdAlquiler = @COD_ALQ)

		UPDATE Alquiler SET FechaDev = @FECHA_DEV WHERE IdAlquiler = @COD_ALQ
		UPDATE Ejemplar SET Estado = 1 WHERE CodPel = @COD_PEL AND NroEj = @NRO_EJ
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 2
			ROLLBACK TRANSACTION
	END CATCH
END
GO