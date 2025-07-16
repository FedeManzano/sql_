GO
CREATE OR ALTER PROCEDURE sp_Insertar_Ejemplar
@COD_PEL INT 
AS 
BEGIN
    IF NOT EXISTS (SELECT * FROM Pelicula WHERE CodPelicula = @COD_PEL)
    BEGIN 
        PRINT('No existe la película')
        RETURN 0
    END

    DECLARE @NRO_EJE INT = (SELECT COUNT(1) FROM Ejemplar WHERE CodPelicula = @COD_PEL) + 1

    INSERT INTO Ejemplar(NroEjemplar, CodPelicula, Ubicacion)
    VALUES 
    (dbo.f_Get_Nro_Ejemplar(@COD_PEL), @COD_PEL, dbo.f_Generar_Ubicacion_ejemplar(@COD_PEL))
    RETURN 1
END
GO