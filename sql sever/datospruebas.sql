USE proyecto_alfa;
GO

/* =========================================================
   1. USUARIO
========================================================= */
SET IDENTITY_INSERT Usuario ON;
GO

INSERT INTO Usuario
(id_usuario, nombre, apellido, correo, contrasena, telefono, direccion, rol, fecha_registro, estado_usuario)
VALUES
(1, 'Kevin',   'Ruiz',    'kevin.ruiz@correo.com',   'Clave123*', '3001112233', 'Calle 10 # 20-30',  'CLIENTE', GETDATE(), 'ACTIVO'),
(2, 'Laura',   'Gomez',   'laura.gomez@correo.com',  'Clave123*', '3002223344', 'Cra 15 # 45-12',    'CLIENTE', GETDATE(), 'ACTIVO'),
(3, 'Andres',  'Perez',   'andres.perez@correo.com', 'Clave123*', '3003334455', 'Av 68 # 12-90',     'CLIENTE', GETDATE(), 'ACTIVO'),
(4, 'Maria',   'Torres',  'maria.torres@correo.com', 'Clave123*', '3004445566', 'Cl 80 # 8-15',      'ADMIN',   GETDATE(), 'ACTIVO'),
(5, 'Carlos',  'Diaz',    'carlos.diaz@correo.com',  'Clave123*', '3005556677', 'Diag 45 # 9-22',    'CLIENTE', GETDATE(), 'ACTIVO');
GO

SET IDENTITY_INSERT Usuario OFF;
GO


/* =========================================================
   2. TALLER
========================================================= */
SET IDENTITY_INSERT Taller ON;
GO

INSERT INTO Taller
(id_taller, nombre_taller, direccion, telefono, correo, horario_atencion, capacidad_diaria, estado_taller)
VALUES
(1, 'Taller Motolab Norte',   'Cra 7 # 120-45',  '6014001001', 'norte@motolab.com',   'Lunes a Sábado 8:00 - 18:00', 12, 'ACTIVO'),
(2, 'Taller Motolab Sur',     'Calle 45 # 78-10', '6014001002', 'sur@motolab.com',     'Lunes a Sábado 8:00 - 18:00', 10, 'ACTIVO'),
(3, 'Taller Motolab Centro',  'Av 19 # 32-55',    '6014001003', 'centro@motolab.com',  'Lunes a Viernes 8:00 - 17:00',  8, 'ACTIVO'),
(4, 'Taller Motolab Occidente','Cra 50 # 22-14',  '6014001004', 'occidente@motolab.com','Lunes a Sábado 9:00 - 18:00', 14, 'ACTIVO'),
(5, 'Taller Motolab Oriente', 'Calle 100 # 15-20', '6014001005', 'oriente@motolab.com', 'Lunes a Viernes 8:00 - 16:00',  9, 'ACTIVO');
GO

SET IDENTITY_INSERT Taller OFF;
GO


/* =========================================================
   3. MOTO
========================================================= */
SET IDENTITY_INSERT Moto ON;
GO

INSERT INTO Moto
(id_moto, placa, marca, modelo, cilindraje, color, anio, kilometraje, id_usuario)
VALUES
(1, 'ABC123', 'Yamaha',   'FZ 2.0',    150, 'Negro',   2021, 12000, 1),
(2, 'DEF456', 'Bajaj',    'Pulsar NS', 200, 'Rojo',    2020, 18500, 2),
(3, 'GHI789', 'Suzuki',   'GN 125',    125, 'Azul',    2019, 24000, 3),
(4, 'JKL321', 'Honda',    'CB160F',    160, 'Blanco',  2022,  8000, 4),
(5, 'MNO654', 'AKT',      'TT 200',    200, 'Gris',    2023,  5000, 5);
GO

SET IDENTITY_INSERT Moto OFF;
GO


/* =========================================================
   4. TECNICO
========================================================= */
SET IDENTITY_INSERT Tecnico ON;
GO

INSERT INTO Tecnico
(id_tecnico, nombre_tecnico, especialidad, telefono, id_taller)
VALUES
(1, 'Javier Morales',   'Mecanica general',    '3107001001', 1),
(2, 'Luis Herrera',     'Electricidad',        '3107001002', 2),
(3, 'Pedro Salazar',    'Inyeccion electronica','3107001003', 3),
(4, 'Santiago Rojas',   'Suspension y frenos', '3107001004', 4),
(5, 'Diego Navarro',    'Diagnostico completo', '3107001005', 5);
GO

SET IDENTITY_INSERT Tecnico OFF;
GO


/* =========================================================
   5. SERVICIO
========================================================= */
SET IDENTITY_INSERT Servicio ON;
GO

INSERT INTO Servicio
(id_servicio, nombre_servicio, descripcion, costo, duracion_estimada, id_taller)
VALUES
(1, 'Cambio de aceite',       'Cambio de aceite y revision basica',          75000.00, '30 minutos', 1),
(2, 'Revision de frenos',     'Inspeccion y ajuste del sistema de frenos',   90000.00, '45 minutos', 2),
(3, 'Afinacion completa',     'Limpieza, ajuste y calibracion general',     120000.00, '1 hora',     3),
(4, 'Diagnostico electrico',   'Revision del sistema electrico y bateria',   110000.00, '40 minutos', 4),
(5, 'Cambio de llantas',      'Retiro e instalacion de llantas nuevas',     180000.00, '1 hora',     5);
GO

SET IDENTITY_INSERT Servicio OFF;
GO


/* =========================================================
   6. CITA
========================================================= */
SET IDENTITY_INSERT Cita ON;
GO

INSERT INTO Cita
(id_cita, fecha, hora, estado_cita, id_usuario, id_moto, id_taller, id_servicio)
VALUES
(1, '2026-06-10', '08:00:00', 'PENDIENTE', 1, 1, 1, 1),
(2, '2026-06-11', '09:30:00', 'CONFIRMADA', 2, 2, 2, 2),
(3, '2026-06-12', '11:00:00', 'PENDIENTE', 3, 3, 3, 3),
(4, '2026-06-13', '14:00:00', 'CANCELADA', 4, 4, 4, 4),
(5, '2026-06-14', '15:30:00', 'CONFIRMADA', 5, 5, 5, 5);
GO

SET IDENTITY_INSERT Cita OFF;
GO


/* =========================================================
   7. ORDEN_TRABAJO
========================================================= */
SET IDENTITY_INSERT Orden_Trabajo ON;
GO

INSERT INTO Orden_Trabajo
(id_orden, fecha_ingreso, descripcion_falla, diagnostico, estado_orden, id_cita, id_tecnico)
VALUES
(1, '2026-06-10', 'Ruido en el motor',        'Se detecta desgaste leve en cadena y tensionador', 'ABIERTA', 1, 1),
(2, '2026-06-11', 'Freno delantero duro',      'Pastillas con desgaste y necesidad de purga',      'EN PROCESO', 2, 2),
(3, '2026-06-12', 'Apagones intermitentes',    'Fallo en conexion electrica principal',            'ABIERTA', 3, 3),
(4, '2026-06-13', 'Vibracion al frenar',       'Disco delantero ligeramente deformado',            'CERRADA', 4, 4),
(5, '2026-06-14', 'Llantas desgastadas',       'Se recomienda reemplazo por desgaste avanzado',    'EN PROCESO', 5, 5);
GO

SET IDENTITY_INSERT Orden_Trabajo OFF;
GO


/* =========================================================
   8. COTIZACION
========================================================= */
SET IDENTITY_INSERT Cotizacion ON;
GO

INSERT INTO Cotizacion
(id_cotizacion, fecha_cotizacion, total, estado_cotizacion, id_orden)
VALUES
(1, '2026-06-10',  75000.00, 'PENDIENTE', 1),
(2, '2026-06-11',  90000.00, 'APROBADA',  2),
(3, '2026-06-12', 120000.00, 'PENDIENTE', 3),
(4, '2026-06-13', 110000.00, 'RECHAZADA', 4),
(5, '2026-06-14', 180000.00, 'APROBADA',  5);
GO

SET IDENTITY_INSERT Cotizacion OFF;
GO


/* =========================================================
   9. PAGO
========================================================= */
SET IDENTITY_INSERT Pago ON;
GO

INSERT INTO Pago
(id_pago, monto, metodo_pago, fecha_pago, estado_pago, id_cotizacion)
VALUES
(1,  75000.00, 'Efectivo', '2026-06-10 09:00:00', 'PENDIENTE', 1),
(2,  90000.00, 'Tarjeta',  '2026-06-11 10:15:00', 'PAGADO',    2),
(3, 120000.00, 'Transferencia', '2026-06-12 11:45:00', 'PENDIENTE', 3),
(4, 110000.00, 'Tarjeta',  '2026-06-13 14:30:00', 'ANULADO',   4),
(5, 180000.00, 'Efectivo', '2026-06-14 16:00:00', 'PAGADO',    5);
GO

SET IDENTITY_INSERT Pago OFF;
GO