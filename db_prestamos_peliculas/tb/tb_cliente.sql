GO
CREATE TABLE Cliente 
(
    CodSocio CHAR(6) PRIMARY KEY,
    NombreSocio VARCHAR(100) NOT NULL,
    ApellidoSocio VARCHAR(100) NOT NULL,
    Telefono VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Estado BIT DEFAULT 1,
    CHECK 
    (
        LEN(CodSocio) = 5       AND 
        CodSocio LIKE '[A-Z]%'  AND
        CodSocio LIKE '%-%'     AND 
        CodSocio LIKE '%[0-9][0-9][0-9]'
    ),

    CHECK 
    (
        NombreSocio NOT LIKE '%[^a-zA-Z ]%'
    ),
    CHECK 
    (
        ApellidoSocio NOT LIKE '%[^a-zA-Z ]%'
    ),
    CHECK 
    (
        dbo.f_Validar_Correo_Electronico(Email) = 1
    ) 
);
GO
