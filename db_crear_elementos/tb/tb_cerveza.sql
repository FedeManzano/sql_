
CREATE TABLE Cerveza 
(
    NombreCerveza VARCHAR(25) PRIMARY KEY,
    CHECK
    (
        NombreCerveza NOT LIKE '%[^a-zA-Z]%'
    )
)


INSERT INTO Cerveza(NombreCerveza)
VALUES 
('STELLA'),
('QUILMES'),
('BRAMA'),
('ISENBECK'),
('SNAIDER'),
('IMPERIAL')

SELECT * FROM Cerveza


