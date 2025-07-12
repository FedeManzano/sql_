GO
CREATE TABLE Persona
(
    Nro_Dni CHAR(8) PRIMARY KEY,
    NombrePersona VARCHAR(20) NOT NULL,
    CHECK 
    (
        LEN(Nro_Dni) >= 7 AND 
        LEN(Nro_Dni) <= 8 AND 
        Nro_Dni NOT LIKE '%[^0-9]%'
    ),
    CHECK 
    (
        NombrePersona NOT LIKE '%[^a-zA-Z]%'
    )
)
GO

INSERT INTO Persona(Nro_Dni, NombrePersona)
VALUES 
(dbo.f_Random_Numbers(8), 'LUCAS'),
(dbo.f_Random_Numbers(8), 'MARCELO'),
(dbo.f_Random_Numbers(8), 'ESTEBAN'),
(dbo.f_Random_Numbers(8), 'ALFREDO'),
(dbo.f_Random_Numbers(8), 'MARCOS'),
(dbo.f_Random_Numbers(8), 'FEDERICO')

SELECT * FROM Persona