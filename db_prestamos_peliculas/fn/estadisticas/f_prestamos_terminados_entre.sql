
GO
CREATE OR ALTER FUNCTION f_Prestamos_Terminados_Entre_F(@F_INICIO VARCHAR(20), @F_FIN VARCHAR(20))
RETURNS VARCHAR (MAX)
AS 
BEGIN 
     DECLARE @CONS VARCHAR(MAX) = 
     '  SELECT pre.CodPrestamo AS CODIGO_PRESTAMOS_ENTRE_' + FORMAT( CAST(@F_INICIO AS DATE), 'dd_MM_yyyy', 'es_ES') +'_Y_' + FORMAT(CAST(@F_FIN AS DATE), 'dd_MM_yyyy', 'es_ES') + ' 
        FROM Prestamo pre 
        WHERE pre.FechaPrestamo >= ' + '''' + @F_INICIO + '''' +' AND 
        pre.FechaPrestamo <= ' + '''' + @F_FIN + ''''+ ' AND 
        pre.FechaDevolucion IS NOT NULL 
     '
 RETURN @CONS
END
   
    