

GO
CREATE OR ALTER VIEW vw_Max_Cantidad_Vistas_por_Mes
AS 
    SELECT cvppm.MES MES, MAX(cvppm.CANT_PEL) MAX_PEL
    FROM vw_Cantidad_Vistas_Peliculas_Por_Mes cvppm
    GROUP BY cvppm.MES
GO