--CREAR BASE DE DATOS
CREATE DATABASE FBD_3P_PR03;
GO

--CAMBIAR CONTEXTO
USE FBD_3P_PR03;
GO


--CREAR TABLAS
CREATE TABLE Juego
(
	IdJuego	INT	PRIMARY KEY,		
	Título	VARCHAR(100) NOT NULL,
	Descripción	VARCHAR(300),
	Clasificacion VARCHAR(5) NOT NULL,
	AñoLanzamiento DATE NOT NULL
)

CREATE TABLE Personaje
(
	IdPersonaje	INT PRIMARY KEY,
	Nombre	VARCHAR(100) NOT NULL,
	Nacionalidad VARCHAR(100)	
)

CREATE TABLE Genero
(		
	IdGenero INT PRIMARY KEY,	
	Nombre VARCHAR(50) NOT NULL
)

CREATE TABLE DetallePersonaje
(
	IdDetallePersonaje INT PRIMARY KEY,
	IdJjuego INT FOREIGN KEY REFERENCES Juego(IdJuego),
	IdPersonaje	INT FOREIGN KEY REFERENCES Personaje(IdPersonaje),
	EsPrincipal BIT DEFAULT(0)
)

CREATE TABLE DetalleGenero
(
	IdDetalleGenero	INT PRIMARY KEY,
	IdJuego INT	FOREIGN KEY REFERENCES Juego(IdJuego),
	IdGenero INT FOREIGN KEY REFERENCES Genero(IdGenero)
) 


--Insertar al menos dos registros en cada tabla
INSERT INTO Juego VALUES
(1,'FIFA', 'Juego de futbol','E', '2022/09/27'),
(2,'Subway Surfers', 'Un delincuente que es perseguido por un policia', 'E', '2012/05/24')

INSERT INTO Personaje VALUES
(1, 'Cristiano Ronaldo', 'Portugal'),
(2, 'Lionel Messi', 'Argentina'),
(3, 'Jake', 'EEUU'),
(4, 'Tricky', 'EEUU')

INSERT INTO GENERO VALUES
(1, 'DEPORTES'),
(2, 'TEEN')

INSERT INTO DetallePersonaje VALUES
(1, 1, 1, 0),
(2, 1, 2, 1),
(3, 2, 3, 1),
(4, 2, 4, 0)

INSERT INTO DetalleGenero VALUES
(1, 1, 1),
(2, 2, 2)


--Obtener todos los datos de Género (usando el comodín)
SELECT * FROM Genero


SELECT * FROM Juego
SELECT * FROM Personaje
SELECT * FROM DetallePersonaje
SELECT * FROM DetalleGenero


--Consultar Nombre y Nacionalidad del Personaje con Id igual a 2
SELECT * FROM Personaje WHERE IdPersonaje = 2 


--Consultar Título y Clasificación de los juegos lanzados después del 2015
SELECT Título, Clasificacion FROM Juego WHERE AñoLanzamiento > '2015/01/01'


--Obtener el nombre de los personajes principales del juego con id 1
SELECT 
	Juego.Título AS TituloJuego,
	Personaje.Nombre NombrePersonajePrincipal
FROM DetallePersonaje
INNER JOIN Juego ON DetallePersonaje.IdJjuego= Juego.IdJuego
INNER JOIN Personaje ON DetallePersonaje.IdPersonaje = Personaje.IdPersonaje
WHERE Juego.IdJuego = 1 AND EsPrincipal = 1


--Obtener el nombre y género de todos los juegos
SELECT 
	Juego.Título AS TituloJuego,
	Genero.Nombre Genero
FROM DetalleGenero
INNER JOIN Juego ON DetalleGenero.IdJuego= Juego.IdJuego
INNER JOIN Genero ON DetalleGenero.IdGenero = Genero.IdGenero
