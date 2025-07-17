
GO
CREATE OR ALTER FUNCTION f_Qluilaron_Ambas_Peliculas (@TITULO_PEL1 VARCHAR(MAX), @TITULO_PEL2 VARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS 
BEGIN 
  
    DECLARE @C1 INT = 1
    DECLARE @C2 INT = 2
    DECLARE @CONSULTA NVARCHAR(MAX) = 
    'SELECT pre.CodSocio AS C_SOC_'+ CAST(@C1 AS VARCHAR(5)) +'_Y_' +  CAST(@C2 AS VARCHAR(5))  + ' 
        FROM Prestamo AS Pre 
        WHERE pre.CodPelicula IN 
        (
            SELECT pel.CodPelicula
            FROM Pelicula AS pel 
            WHERE pel.Titulo = '+''''+ @TITULO_PEL1 + '''' +'
        )
        INTERSECT 
        SELECT pre.CodSocio AS COD_'+ CAST(@C1 AS VARCHAR(5)) +'_Y_' +  CAST(@C2 AS VARCHAR(5))  + '   
        FROM Prestamo AS Pre 
        WHERE pre.CodPelicula IN 
        (
            SELECT pel.CodPelicula
            FROM Pelicula AS pel 
            WHERE pel.Titulo = '+ '''' + @TITULO_PEL2 + '''' +'
        )'

    RETURN @CONSULTA
END 

