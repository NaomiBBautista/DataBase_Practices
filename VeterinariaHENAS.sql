CREATE DATABASE VeterinariaHENAS
GO

USE VeterinariaHENAS
GO

CREATE TABLE Mascota
(
    IdMascota INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR (100) NOT NULL,
    Especie VARCHAR (50) NOT NULL,
    Raza VARCHAR (50) NOT NULL,
    Sexo BIT DEFAULT (0),
    Peso FLOAT NOT NULL,
    Tamaño VARCHAR(15) NOT NULL,
    Nacimiento DATE NOT NULL,
    Estado BIT DEFAULT (1)
)

CREATE TABLE Cliente
(
    IdCliente INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR (100) NOT NULL,
    Apellido VARCHAR (100) NOT NULL,
    Correo VARCHAR (100) UNIQUE,
    Telefono VARCHAR (15) DEFAULT (0)
)

CREATE TABLE Veterinario
(
    IdVeterinario INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR (100) NOT NULL,
    Apellido VARCHAR (100) NOT NULL,
    Correo VARCHAR (100) UNIQUE,
    Telefono VARCHAR (15) DEFAULT (0)
)

CREATE TABLE Servicio
(
    IdServicio INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR (100) NOT NULL,
    Precio FLOAT NOT NULL
)

CREATE TABLE DetalleCliente
(
    IdDetalleCliente INT PRIMARY KEY IDENTITY (1,1),
    IdCliente INT FOREIGN KEY REFERENCES Cliente(IdCliente),
    IdMascota INT FOREIGN KEY REFERENCES Mascota(IdMascota),
    Frecuente BIT DEFAULT (0)
)

CREATE TABLE DetalleServicio
(
    IdDetalleServicio INT PRIMARY KEY IDENTITY (1,1),
    IdMascota INT FOREIGN KEY REFERENCES Mascota(IdMascota),
    IdServicio INT FOREIGN KEY REFERENCES Servicio(IdServicio),
    Tiempo FLOAT DEFAULT (0),
    Fecha DATE NOT NULL,
    Seguimiento BIT DEFAULT (0)
)

CREATE TABLE DetalleVeterinario
(
    IdDetalleVeterinario INT PRIMARY KEY IDENTITY (1,1),
    IdServicio INT FOREIGN KEY REFERENCES Servicio(IdServicio),
    IdVeterinario INT FOREIGN KEY REFERENCES Veterinario(IdVeterinario),
    Dificultad BIT NOT NULL
)

INSERT INTO Mascota VALUES
('Kanan', 'Perro', 'Husky', 0, 25, 'Grande', '2020-11-17', 1),
('Koda', 'Perro', 'Labrador', 0, 16.8, 'Mediano', '2020-05-14', 1),
('Kait', 'Gato', 'Bombay', 1, 5.4, 'Mediano', '2018-10-08', 1),
('Cuatro', 'Perro', 'Cruza', 0, 4.7, 'Pequeño', '2021-01-25', 0),
('Lia', 'Perro', 'Yorky', 1, 2.3, 'Pequeño', '2022-04-14', 1),
('Cooper', 'Perro', 'Yorky', 0, 2.5, 'Pequeño', '2022-02-05', 1),
('Naruto', 'Pez', 'Betta', 0, 0.054, 'Pequeño', '2019-08-10', 0),
('Benito', 'Pez', 'Betta', 0, 0.067, 'Grande', '2008-02-14', 0),
('Fuper', 'Chinchilla', 'Lanigera', 0, 2.4, 'Grande', '2010-12-25', 0),
('Masha', 'Perico', 'Eclecto', 1, 0.4, 'Mediano', '2015-06-17', 0)

INSERT INTO Cliente VALUES
('Naomi', 'Bautista', 'montes@correo.com', '479-747-0645'),
('Samuel', 'Conde', 'hoodedandres@correo.com', '477-403-2174'),
('Hector', 'Fuentes', 'mrfuper@correo.com', '477-223-3313'),
('Andres', 'Messi', 'andresmessi@correo.com', '477-394-8602'),
('Eduardo', 'Escamilla', 'loloquera@correo.com', '477-395-2391')

INSERT INTO Veterinario VALUES
('Luis', 'Cuellar', 'lcuellar@correo.com', '477-423-5466'),
('Federico', 'Peluche', 'fpeluche@correo.com', '477-123-4567'),
('Rayo', 'McQueen', 'rmcqueen@correo.com', '477-765-4321'),
('Barry', 'Allen', 'theflash@correo.com', '477-911-6969')

INSERT INTO Servicio VALUES
('Baño', 180),
('Cremacion', 460),
('Corte', 200),
('Inseminar', 500),
('Esterilizacion', 325),
('Vacunacion',  80),
('Hospedaje', 100),
('Cirujia', 1500)

INSERT INTO DetalleCliente VALUES 
(3,1,1), (2,2,1), (5,3,0), (1,4,0), (4,5,1),
(4,6,1), (4,7,1), (3,8,1), (3,9,1), (1,10,0)

INSERT INTO DetalleServicio VALUES
(1, 3, 1, '2022-11-28', 1),
(2, 1, 1.4, '2022-11-29', 0),
(3, 8, 6, '2022-12-04', 1),
(4, 2, 4, '2021-01-29', 0),
(5, 5, 3, '2022-12-05', 1),
(6, 7, 24, '2022-12-25', 1),
(7, 2, 2, '2020-01-11', 0),
(8, 2, 2, '2008-06-23', 0),
(9, 2, 4, '2011-03-26', 0),
(10, 2, 4, '2015-06-18', 0)

INSERT INTO DetalleVeterinario VALUES
(1, 3, 1), (2, 1, 0), (3, 4, 1), (4, 2, 1),
(5, 1, 1), (6, 2, 0), (7, 3, 0), (8, 4, 0)

SELECT * FROM Mascota
SELECT * FROM Cliente
SELECT * FROM Veterinario 
SELECT * FROM Servicio
SELECT * FROM DetalleCliente
SELECT * FROM DetalleServicio

--ACTUALIZAR REGISTROS DE TABLAS
--actualizar peso de koda
UPDATE Mascota SET
    Peso = 17.2
WHERE IdMascota = 2

--petatear a Lia
UPDATE Mascota SET
    Estado = 0
WHERE Nombre = 'Lia'

--actualizar teléfono de cliente
UPDATE Cliente SET
    Telefono = 479-747-0646
WHERE correo = 'montea@correo.com'

--actualizar precio de servicio
UPDATE Servicio SET
    Precio = 200
WHERE Nombre = 'Baño'

--cremar a Lia
UPDATE DetalleServicio SET
    IdServicio = 2
WHERE IdMascota = 5


--BAJAS LÓGICAS
UPDATE DetalleCliente SET
    Frecuente = 0
WHERE IdMascota = 5

UPDATE DetalleServicio SET
    Seguimiento = 0
WHERE IdServicio = 2

UPDATE DetalleServicio SET
    Seguimiento = 0
WHERE IdMascota = 1

--BAJA DEFINITIVA
DELETE FROM DetalleServicio WHERE Seguimiento = 0
DELETE FROM DetalleServicio WHERE Fecha < '2020-01-01'

--CONSULTAS
SELECT
    Cliente.Nombre + ' ' + Cliente.Apellido AS Cliente,
    Mascota.Nombre AS Mascota,
    Mascota.Estado AS 'Vivo?'
FROM DetalleCliente
INNER JOIN Cliente ON DetalleCliente.IdCliente = Cliente.IdCliente
INNER JOIN Mascota ON DetalleCliente.IdMascota = Mascota.IdMascota

SELECT
    Mascota.Nombre AS Mascota,
    Servicio.Nombre AS Servicio,
    Servicio.Precio
FROM DetalleServicio
INNER JOIN Mascota ON DetalleServicio.IdMascota = Mascota.IdMascota
INNER JOIN Servicio ON DetalleServicio.IdServicio = Servicio.IdServicio

SELECT
    Mascota.Nombre AS 'Mascota Muerta',
    Mascota.Nacimiento AS Nacimiento
FROM Mascota
WHERE Estado = 0

SELECT Nombre, Apellido FROM Cliente
UNION
SELECT Nombre, Apellido FROM Veterinario

SELECT DISTINCT Tamaño FROM Mascota

SELECT DISTINCT Especie FROM Mascota

SELECT
    Cliente.Nombre AS Cliente,
    Mascota.Nombre AS Mascota,
    Mascota.Especie 
FROM DetalleCLiente
INNER JOIN Cliente ON DetalleCliente.IdCliente = Cliente.IdCliente
INNER JOIN Mascota ON DetalleCliente.IdMascota = Mascota.IdMascota
WHERE NOT Cliente.Nombre = 'Naomi' AND NOT Mascota.Estado = 0

SELECT Nombre, Peso FROM Mascota
ORDER BY Peso DESC

SELECT
    Veterinario.Nombre AS Veterinario,
    Veterinario.Telefono,
    Servicio.Nombre AS Servicio
FROM DetalleVeterinario
INNER JOIN Veterinario ON DetalleVeterinario.IdVeterinario = Veterinario.IdVeterinario
INNER JOIN Servicio ON DetalleVeterinario.IdServicio = Servicio.IdServicio
WHERE Dificultad = 1

SELECT Telefono FROM Veterinario
WHERE Apellido = 'Cuellar'

SELECT DISTINCT
    Cliente.Nombre + ' ' + Cliente.Apellido AS Cliente,
    Cliente.Telefono
FROM DetalleCLiente
INNER JOIN Cliente ON DetalleCliente.IdCliente = Cliente.IdCliente
WHERE Frecuente = 1
