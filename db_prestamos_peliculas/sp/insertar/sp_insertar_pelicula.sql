
GO
CREATE OR ALTER PROCEDURE sp_Insertar_Pelicula
@TITULO VARCHAR(100),
@DURACION SMALLINT,
@AÑO SMALLINT,
@GENERO_NOMBRE VARCHAR(100)
AS 
BEGIN 
    IF  @TITULO IS NULL
        RETURN 0
     IF  @DURACION IS NULL OR 
         @DURACION < 0
        RETURN 0
    IF  @AÑO IS NULL OR 
         @AÑO < 1900 OR @AÑO > 9999
        RETURN 0
    IF NOT EXISTS (SELECT * FROM Genero WHERE NombreGenero = @GENERO_NOMBRE)
        RETURN 0
   
    DECLARE @COD_PEL INT = (SELECT COUNT(1) FROM Pelicula) + 1
    DECLARE @NRO_GENERO INT = (SELECT IdGenero FROM Genero WHERE NombreGenero = @GENERO_NOMBRE)
    
    EXEC sp_Format_Tittle @CADENA = @TITULO OUTPUT
    
    INSERT INTO Pelicula(CodPelicula, Titulo, Duracion, AñoLanzamiento, IdGenero)
    VALUES 
    (@COD_PEL, @TITULO, @DURACION, @AÑO, @NRO_GENERO)
END
GO