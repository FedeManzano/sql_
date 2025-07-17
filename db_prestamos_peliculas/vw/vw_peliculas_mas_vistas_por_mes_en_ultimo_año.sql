GO
CREATE OR ALTER VIEW vw_Peluculas_Mas_Vistas_De_Cada_Mes_Del_Ultimo_Año
AS 
    SELECT 
        CASE 
            WHEN MES = 1 THEN 'Enero'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 2 THEN 'Febrero'     +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 3 THEN 'Marzo'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 4 THEN 'Abril'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 5 THEN 'Mayo'        +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 6 THEN 'Junio'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 7 THEN 'Julio'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 8 THEN 'Agosto'      +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 9 THEN 'Septiembre'  +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 10 THEN 'Octubre'    +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 11 THEN 'Noviembre'  +       '/' + dbo.f_Ultimo_Año()
            ELSE 'Diciembre'                +       '/' + dbo.f_Ultimo_Año()
        END AS MES_DESC,
        pre.CodPelicula, 
        COUNT(pre.CodPrestamo) MAS_VECES_VISTA
    FROM vw_Max_Cantidad_Vistas_por_Mes mcvpm 
    INNER JOIN Prestamo pre 
    ON MONTH(pre.FechaPrestamo) = mcvpm.MES
    GROUP BY MES,CodPelicula, MAX_PEL
    HAVING mcvpm.MAX_PEL = COUNT(pre.CodPrestamo) 
GO
