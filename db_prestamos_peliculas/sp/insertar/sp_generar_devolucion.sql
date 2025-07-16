

GO 
CREATE OR ALTER PROCEDURE sp_Generar_Devolucion
@COD_PREST CHAR(7),
@F_DEVOLUCION DATE,
@F_PRESTAMO DATE,
@NRO_EJEMPLAR INT,
@COD_PELICULA INT
AS 
BEGIN 
    BEGIN TRANSACTION 
    BEGIN TRY 
        IF NOT EXISTS (SELECT * FROM Prestamo WHERE CodPrestamo = @COD_PREST AND FechaDevolucion IS NULL)
            RAISERROR('El prestamo ya fue devuelto', 11, 1)
        IF dbo.f_Validar_Fecha(@F_DEVOLUCION) = 0
            RAISERROR('La fecha de devolución es inválida', 11, 1)
        IF dbo.f_Validar_Fecha(@F_PRESTAMO) = 0
            RAISERROR('La fecha de prestamo es inválida', 11, 1)
        IF DATEDIFF(DAY, @F_DEVOLUCION, GETDATE()) < 0
             RAISERROR('La fecha de devolución no puede ser menor que la fecha del prestamo ', 11, 1)
        IF NOT EXISTS (SELECT 1 FROM Prestamo WHERE CodPrestamo = @COD_PREST)
            RAISERROR('EL código del prestamo no existe', 11, 1)
        IF NOT EXISTS (SELECT 1 FROM Pelicula WHERE CodPelicula = @COD_PELICULA)
            RAISERROR('EL código de película no existe', 11, 1)
        IF NOT EXISTS (SELECT 1 FROM Prestamo WHERE CodPelicula = @COD_PELICULA AND CodPrestamo = @COD_PREST AND FechaPrestamo = @F_PRESTAMO)
            RAISERROR('La película no coincide con el prestamo', 11, 1)
        IF NOT EXISTS (SELECT * FROM Ejemplar WHERE CodPelicula = @COD_PELICULA AND NroEjemplar = @NRO_EJEMPLAR)
            RAISERROR('EL ejemplar no existe', 11, 1)

        UPDATE Prestamo SET FechaDevolucion = @F_DEVOLUCION WHERE CodPrestamo = @COD_PREST
        UPDATE Ejemplar SET Estado = 1 WHERE NroEjemplar = @NRO_EJEMPLAR AND CodPelicula = @COD_PELICULA
        COMMIT TRANSACTION
    END TRY 
    BEGIN CATCH 
        DECLARE @MJE NVARCHAR(4000), 
                @SEVERIDAD INT,
                @ESTADO INT 
        SELECT 
            @MJE = ERROR_MESSAGE(),
            @SEVERIDAD = ERROR_SEVERITY(),
            @ESTADO = ERROR_STATE()
        RAISERROR(@MJE, @SEVERIDAD, @ESTADO)
        ROLLBACK TRANSACTION
    END CATCH
END
GO