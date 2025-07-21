-- USE db_paquetes_turisticos

GO 
CREATE TABLE Paquete
(
    CodPaquete TINYINT PRIMARY KEY,
    Costo FLOAT NOT NULL,
    CodOperador SMALLINT NOT NULL,
    CodDestino TINYINT NOT NULL,

    CONSTRAINT FK_Operador FOREIGN KEY(CodOperador) 
    REFERENCES Operador(CodOperador) ON DELETE CASCADE,

    CONSTRAINT FK_Destino FOREIGN KEY(CodDestino) 
    REFERENCES Destino(CodDestino) ON DELETE CASCADE,

    CHECK 
    (
        CodPaquete > 0 AND CodPaquete <= 256
    ),
     CHECK 
    (
        Costo > 0
    )
);
GO
