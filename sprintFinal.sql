-- Sprint Final modulo 5
-- Creación de tablas

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    correo_electronico VARCHAR(100),
    veces_utilizada INT DEFAULT 1
);

-- Tabla Operarios
CREATE TABLE Operarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    correo_electronico VARCHAR(100),
    veces_soporte INT DEFAULT 1
);

-- Tabla Soportes
CREATE TABLE Soportes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_operario INT,
    id_cliente INT,
    fecha DATE,
    evaluacion INT,
    descripcion VARCHAR(100),
    FOREIGN KEY (id_operario) REFERENCES Operarios(id),
    FOREIGN KEY (id_cliente) REFERENCES Usuarios(id)
);

-- Agregar registros a las tablas 
-- 5 usuarios
INSERT INTO Usuarios (nombre, apellido, edad, correo_electronico, veces_utilizada)
VALUES
    ('John', 'Doe', 25, 'johndoe@example.com', 3),
    ('Emma', 'Smith', 30, 'emmasmith@example.com', 2),
    ('Michael', 'Johnson', 40, 'michaeljohnson@example.com', 1),
    ('Sophia', 'Anderson', 22, 'sophiaanderson@example.com', 5),
    ('William', 'Brown', 28, 'williambrown@example.com', 2);
    
-- 5 operadores
INSERT INTO Operarios (nombre, apellido, edad, correo_electronico, veces_soporte)
VALUES
    ('Oliver', 'Taylor', 32, 'olivertaylor@example.com', 4),
    ('Ava', 'Davis', 35, 'avadavis@example.com', 2),
    ('Lucas', 'Wilson', 40, 'lucaswilson@example.com', 7),
    ('Mia', 'Jones', 27, 'miajones@example.com', 12),
    ('Ethan', 'Clark', 29, 'ethanclark@example.com', 1);
    
-- 10 operaciones de soporte
-- Agregar operaciones de soporte con datos reales
INSERT INTO Soportes (id_operario, id_cliente, fecha, evaluacion, descripcion)
VALUES
    (1, 1, '2023-01-05', 4, 'Soporte técnico para la instalación de software'),
    (2, 2, '2023-01-01', 3, 'Resolución de problemas de conexión a Internet'),
    (3, 3, '2023-03-29', 2, 'Asistencia para configuración de correo electrónico'),
    (4, 4, '2023-04-12', 5, 'Mantenimiento y actualización del sistema operativo'),
    (5, 5, '2023-04-03', 1, 'Soporte para copias de seguridad y recuperación de datos'),
    (1, 2, '2023-06-09', 5, 'Solución de errores de aplicaciones móviles'),
    (2, 3, '2023-07-17', 3, 'Atención de consultas relacionadas con la plataforma'),
    (3, 4, '2023-08-24', 4, 'Asesoramiento en el uso de herramientas de diseño gráfico'),
    (4, 5, '2023-09-29', 2, 'Resolución de problemas de hardware'),
    (5, 1, '2023-11-01', 3, 'Soporte para integración de sistemas y API');
    
-- Seleccione las 3 operaciones con mejor evaluación.
SELECT * FROM Soportes ORDER BY evaluacion DESC LIMIT 3;

-- Seleccione las 3 operaciones con menos evaluación.
SELECT * FROM Soportes ORDER BY evaluacion ASC LIMIT 3;

-- Seleccione al operario que más soportes ha realizado.
SELECT id, nombre, apellido, veces_soporte
FROM Operarios
ORDER BY veces_soporte DESC
LIMIT 1;

-- Seleccione al cliente que menos veces ha utilizado la aplicación.
SELECT id, veces_utilizada FROM Usuarios
ORDER BY veces_utilizada ASC LIMIT 1;

-- Agregue 10 años a los tres primeros usuarios registrados.
UPDATE Usuarios SET edad = edad + 10 WHERE id IN (1, 2, 3);

-- Renombre todas las columnas ‘correo electrónico’. El nuevo nombre debe ser email.
ALTER TABLE Usuarios CHANGE COLUMN correo_electronico email VARCHAR(50);
ALTER TABLE Operarios CHANGE COLUMN correo_electronico email VARCHAR(50);

-- Seleccione solo los operarios mayores de 20 años.
SELECT * FROM operarios where edad > 20;













