```sql
/*==========================================================
  PROYECTO ALFA
  Script de creación de base de datos y tablas
  Motor: SQL Server
==========================================================*/

-- ========================================================
-- 1. CREAR BASE DE DATOS
-- ========================================================
CREATE DATABASE proyecto_alfa;
GO

USE proyecto_alfa;
GO


-- ========================================================
-- 2. TABLA USUARIO
-- ========================================================
CREATE TABLE Usuario (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(100),
    rol VARCHAR(20) DEFAULT 'CLIENTE',
    fecha_registro DATETIME DEFAULT GETDATE(),
    estado_usuario VARCHAR(20) DEFAULT 'ACTIVO'
);
GO


-- ========================================================
-- 3. TABLA MOTO
-- ========================================================
CREATE TABLE Moto (
    id_moto INT IDENTITY(1,1) PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindraje INT,
    color VARCHAR(30),
    anio INT,
    kilometraje INT,

    id_usuario INT NOT NULL,

    CONSTRAINT FK_Moto_Usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario)
);
GO


-- ========================================================
-- 4. TABLA TALLER
-- ========================================================
CREATE TABLE Taller (
    id_taller INT IDENTITY(1,1) PRIMARY KEY,
    nombre_taller VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    horario_atencion VARCHAR(100),
    capacidad_diaria INT,
    estado_taller VARCHAR(20) DEFAULT 'ACTIVO'
);
GO


-- ========================================================
-- 5. TABLA TECNICO
-- ========================================================
CREATE TABLE Tecnico (
    id_tecnico INT IDENTITY(1,1) PRIMARY KEY,
    nombre_tecnico VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(20),

    id_taller INT NOT NULL,

    CONSTRAINT FK_Tecnico_Taller
        FOREIGN KEY (id_taller)
        REFERENCES Taller(id_taller)
);
GO


-- ========================================================
-- 6. TABLA SERVICIO
-- ========================================================
CREATE TABLE Servicio (
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    descripcion VARCHAR(MAX),
    costo DECIMAL(10,2),
    duracion_estimada VARCHAR(50),

    id_taller INT NOT NULL,

    CONSTRAINT FK_Servicio_Taller
        FOREIGN KEY (id_taller)
        REFERENCES Taller(id_taller)
);
GO


-- ========================================================
-- 7. TABLA CITA
-- ========================================================
CREATE TABLE Cita (
    id_cita INT IDENTITY(1,1) PRIMARY KEY,

    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado_cita VARCHAR(20) DEFAULT 'PENDIENTE',

    id_usuario INT NOT NULL,
    id_moto INT NOT NULL,
    id_taller INT NOT NULL,
    id_servicio INT NOT NULL,

    CONSTRAINT FK_Cita_Usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario),

    CONSTRAINT FK_Cita_Moto
        FOREIGN KEY (id_moto)
        REFERENCES Moto(id_moto),

    CONSTRAINT FK_Cita_Taller
        FOREIGN KEY (id_taller)
        REFERENCES Taller(id_taller),

    CONSTRAINT FK_Cita_Servicio
        FOREIGN KEY (id_servicio)
        REFERENCES Servicio(id_servicio)
);
GO


-- ========================================================
-- 8. TABLA ORDEN_TRABAJO
-- ========================================================
CREATE TABLE Orden_Trabajo (
    id_orden INT IDENTITY(1,1) PRIMARY KEY,

    fecha_ingreso DATE,
    descripcion_falla VARCHAR(MAX),
    diagnostico VARCHAR(MAX),
    estado_orden VARCHAR(20) DEFAULT 'ABIERTA',

    id_cita INT NOT NULL,
    id_tecnico INT NOT NULL,

    CONSTRAINT FK_Orden_Cita
        FOREIGN KEY (id_cita)
        REFERENCES Cita(id_cita),

    CONSTRAINT FK_Orden_Tecnico
        FOREIGN KEY (id_tecnico)
        REFERENCES Tecnico(id_tecnico)
);
GO


-- ========================================================
-- 9. TABLA COTIZACION
-- ========================================================
CREATE TABLE Cotizacion (
    id_cotizacion INT IDENTITY(1,1) PRIMARY KEY,

    fecha_cotizacion DATE,
    total DECIMAL(10,2),
    estado_cotizacion VARCHAR(20) DEFAULT 'PENDIENTE',

    id_orden INT NOT NULL,

    CONSTRAINT FK_Cotizacion_Orden
        FOREIGN KEY (id_orden)
        REFERENCES Orden_Trabajo(id_orden)
);
GO


-- ========================================================
-- 10. TABLA PAGO
-- ========================================================
CREATE TABLE Pago (
    id_pago INT IDENTITY(1,1) PRIMARY KEY,

    monto DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(20),
    fecha_pago DATETIME DEFAULT GETDATE(),
    estado_pago VARCHAR(20) DEFAULT 'PENDIENTE',

    id_cotizacion INT NOT NULL,

    CONSTRAINT FK_Pago_Cotizacion
        FOREIGN KEY (id_cotizacion)
        REFERENCES Cotizacion(id_cotizacion)
);
GO


/*==========================================================
  ORDEN DE INSERCIÓN DE DATOS
==========================================================

1. Usuario
2. Taller
3. Moto
4. Tecnico
5. Servicio
6. Cita
7. Orden_Trabajo
8. Cotizacion
9. Pago

==========================================================*/
``