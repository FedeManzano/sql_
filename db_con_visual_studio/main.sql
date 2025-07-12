CREATE DATABASE db_con_visual_studio
USE db_con_visual_studio

GO
CREATE TABLE Usuario
(
    Tipo_Doc CHAR(3) NOT NULL,
    Nro_Doc CHAR(8) NOT NULL,
    Correo VARCHAR(100) NOT NULL UNIQUE,
    Nombre VARCHAR(100) NOT NULL,
    FNacimiento DATE NOT NULL,
    PRIMARY KEY(Tipo_Doc, Nro_Doc),
    
    CHECK
    (
        Tipo_Doc = 'LC' OR Tipo_Doc = 'DNI'
    ),

    CHECK 
    (
        dbo.f_Validar_Dni(Nro_Doc) = 1
    ),

    CHECK 
    (
        dbo.f_Validar_Correo_Electronico(Correo) = 1
    ),

    CHECK 
    (
        dbo.f_Validar_Fecha(FNacimiento) = 1
    )
);
GO

EXEC sp_Insertar_Usuario 'DNI', '322222222','fedej@gmail.com', 'Federico', '1987-01-03' 

SELECT * FROM Usuario


DECLARE @CAD VARCHAR(MAX) = ' El articulo 1200 - Procesador intel I7 Generación 10 -   fue provisto el dia de    la fecha:   2025-03-01     '

EXEC sp_Format_Tittle @CADENA = @CAD OUTPUT

PRINT(@CAD)

DECLARE @NOMBRES VARCHAR(50) = '    fedeRico    ARIEL  '

EXEC sp_Format_Tittle @CADENA = @NOMBRES OUTPUT

PRINT(@NOMBRES)