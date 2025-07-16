
CREATE OR ALTER PROCEDURE sp_Insertar_Prestamo
@COD_CLIENTE CHAR(6),
@COD_PELICULA INT,
@NRO_EJEMPLAR INT,
@F_PRESTAMO DATE
AS 
BEGIN 
    BEGIN TRANSACTION 
    BEGIN TRY 
        IF NOT EXISTS (SELECT * FROM Cliente WHERE CodSocio = @COD_CLIENTE AND Estado = 1)
            RAISERROR('Cliente no existe en la base de datos o está inactivo', 11, 1) 

        IF EXISTS
        (
            SELECT * FROM Prestamo
            WHERE CodSocio = @COD_CLIENTE AND FechaDevolucion IS NULL 
            AND FechaPrestamo <> @F_PRESTAMO 
        )
            RAISERROR('Cliente deudor no puede llevarse nada', 11, 1) 

        IF NOT EXISTS (SELECT * FROM Pelicula WHERE CodPelicula = @COD_PELICULA)
            RAISERROR('La película no existe en la base de datos', 11, 1) 

        IF NOT EXISTS (SELECT * FROM Ejemplar WHERE NroEjemplar = @NRO_EJEMPLAR AND CodPelicula = @COD_PELICULA)
            RAISERROR('No existe el ejemplar para la película solicitada', 11, 1) 

        IF (SELECT Estado FROM Ejemplar WHERE NroEjemplar = @NRO_EJEMPLAR AND CodPelicula = @COD_PELICULA) = 0
            RAISERROR('El ejemplar ya fué prestado no está disponible', 11, 1) 

        IF dbo.f_Validar_Fecha(@F_PRESTAMO)  = 0
            RAISERROR('La fecha de prestamo es erronea', 11, 1) 

        DECLARE @CODPRE CHAR(30) = dbo.f_Generar_Codigo_Prestamo()
 
        INSERT INTO Prestamo(CodPrestamo, CodSocio, CodPelicula, NroEjemplar, FechaPrestamo)
        VALUES 
        (@CODPRE, @COD_CLIENTE, @COD_PELICULA, @NRO_EJEMPLAR, @F_PRESTAMO)

        UPDATE Ejemplar SET Estado = 0 WHERE NroEjemplar = @NRO_EJEMPLAR AND CodPelicula = @COD_PELICULA

        COMMIT TRANSACTION
    END TRY 
    BEGIN CATCH 
        DECLARE @MJERROR NVARCHAR(4000),
                @SEVERIDAD INT,
                @ESTADO INT 
            SELECT 
                @MJERROR = ERROR_MESSAGE(),
                @SEVERIDAD = ERROR_SEVERITY(),
                @ESTADO = ERROR_STATE()
            RAISERROR(@MJERROR, @SEVERIDAD, @ESTADO)
            ROLLBACK TRANSACTION
    END CATCH
END

 
