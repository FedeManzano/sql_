
GO
CREATE OR ALTER FUNCTION f_Mes_Año_Str(@MES INT, @AÑO INT)
RETURNS VARCHAR(MAX)
AS 
BEGIN
    DECLARE @MES_AÑO_S VARCHAR(MAX) = 
    CASE 
        WHEN  @MES = 1 THEN 'ENERO' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 2 THEN 'FEBRERO' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 3 THEN 'MARZO' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 4 THEN 'ABRIL' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 5 THEN 'MAYO' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 6 THEN 'JUNIO' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 7 THEN 'JULIO' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 8 THEN 'AGOSTO' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 9 THEN 'SEPTIEMBRE' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 10 THEN 'OCTUBRE' + '/' + CAST(@AÑO AS VARCHAR(5))
        WHEN  @MES = 11 THEN 'NOVIEMBRE' + '/' + CAST(@AÑO AS VARCHAR(5))
        ELSE 'DICIEMBRE' + '/' + CAST(@AÑO AS VARCHAR(5))
    END 
    RETURN @MES_AÑO_S
END