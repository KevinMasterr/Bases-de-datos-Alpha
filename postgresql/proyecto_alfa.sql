USE [master]
GO
/****** Objeto: Database [proyecto_alfa] Fecha de script: 6/9/2026 2:17:29 PM ******/
CREATE DATABASE [proyecto_alfa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyecto_alfa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\proyecto_alfa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyecto_alfa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\proyecto_alfa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [proyecto_alfa] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto_alfa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto_alfa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto_alfa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto_alfa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto_alfa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto_alfa] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto_alfa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [proyecto_alfa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto_alfa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto_alfa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto_alfa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto_alfa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto_alfa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto_alfa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto_alfa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto_alfa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [proyecto_alfa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto_alfa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto_alfa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto_alfa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto_alfa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto_alfa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto_alfa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto_alfa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [proyecto_alfa] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto_alfa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto_alfa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto_alfa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto_alfa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto_alfa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyecto_alfa] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [proyecto_alfa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [proyecto_alfa] SET QUERY_STORE = ON
GO
ALTER DATABASE [proyecto_alfa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [proyecto_alfa]
GO
/****** Objeto: Table [dbo].[Cita] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[id_cita] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[estado_cita] [varchar](20) NULL,
	[id_usuario] [int] NOT NULL,
	[id_moto] [int] NOT NULL,
	[id_taller] [int] NOT NULL,
	[id_servicio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Cotizacion] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cotizacion](
	[id_cotizacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_cotizacion] [date] NULL,
	[total] [decimal](10, 2) NULL,
	[estado_cotizacion] [varchar](20) NULL,
	[id_orden] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Moto] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moto](
	[id_moto] [int] IDENTITY(1,1) NOT NULL,
	[placa] [varchar](10) NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[cilindraje] [int] NULL,
	[color] [varchar](30) NULL,
	[anio] [int] NULL,
	[kilometraje] [int] NULL,
	[id_usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_moto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Orden_Trabajo] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden_Trabajo](
	[id_orden] [int] IDENTITY(1,1) NOT NULL,
	[fecha_ingreso] [date] NULL,
	[descripcion_falla] [varchar](max) NULL,
	[diagnostico] [varchar](max) NULL,
	[estado_orden] [varchar](20) NULL,
	[id_cita] [int] NOT NULL,
	[id_tecnico] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Pago] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](10, 2) NOT NULL,
	[metodo_pago] [varchar](20) NULL,
	[fecha_pago] [datetime] NULL,
	[estado_pago] [varchar](20) NULL,
	[id_cotizacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Servicio] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre_servicio] [varchar](100) NOT NULL,
	[descripcion] [varchar](max) NULL,
	[costo] [decimal](10, 2) NULL,
	[duracion_estimada] [varchar](50) NULL,
	[id_taller] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Taller] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taller](
	[id_taller] [int] IDENTITY(1,1) NOT NULL,
	[nombre_taller] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[correo] [varchar](100) NULL,
	[horario_atencion] [varchar](100) NULL,
	[capacidad_diaria] [int] NULL,
	[estado_taller] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_taller] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Tecnico] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnico](
	[id_tecnico] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tecnico] [varchar](100) NOT NULL,
	[especialidad] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[id_taller] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tecnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Usuario] Fecha de script: 6/9/2026 2:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[contrasena] [varchar](255) NOT NULL,
	[telefono] [varchar](20) NULL,
	[direccion] [varchar](100) NULL,
	[rol] [varchar](20) NULL,
	[fecha_registro] [datetime] NULL,
	[estado_usuario] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cita] ADD  DEFAULT ('PENDIENTE') FOR [estado_cita]
GO
ALTER TABLE [dbo].[Cotizacion] ADD  DEFAULT ('PENDIENTE') FOR [estado_cotizacion]
GO
ALTER TABLE [dbo].[Orden_Trabajo] ADD  DEFAULT ('ABIERTA') FOR [estado_orden]
GO
ALTER TABLE [dbo].[Pago] ADD  DEFAULT (getdate()) FOR [fecha_pago]
GO
ALTER TABLE [dbo].[Pago] ADD  DEFAULT ('PENDIENTE') FOR [estado_pago]
GO
ALTER TABLE [dbo].[Taller] ADD  DEFAULT ('ACTIVO') FOR [estado_taller]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('CLIENTE') FOR [rol]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('ACTIVO') FOR [estado_usuario]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Moto] FOREIGN KEY([id_moto])
REFERENCES [dbo].[Moto] ([id_moto])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Moto]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Servicio] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[Servicio] ([id_servicio])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Servicio]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Taller] FOREIGN KEY([id_taller])
REFERENCES [dbo].[Taller] ([id_taller])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Taller]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Usuario]
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_Orden] FOREIGN KEY([id_orden])
REFERENCES [dbo].[Orden_Trabajo] ([id_orden])
GO
ALTER TABLE [dbo].[Cotizacion] CHECK CONSTRAINT [FK_Cotizacion_Orden]
GO
ALTER TABLE [dbo].[Moto]  WITH CHECK ADD  CONSTRAINT [FK_Moto_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Moto] CHECK CONSTRAINT [FK_Moto_Usuario]
GO
ALTER TABLE [dbo].[Orden_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Cita] FOREIGN KEY([id_cita])
REFERENCES [dbo].[Cita] ([id_cita])
GO
ALTER TABLE [dbo].[Orden_Trabajo] CHECK CONSTRAINT [FK_Orden_Cita]
GO
ALTER TABLE [dbo].[Orden_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Tecnico] FOREIGN KEY([id_tecnico])
REFERENCES [dbo].[Tecnico] ([id_tecnico])
GO
ALTER TABLE [dbo].[Orden_Trabajo] CHECK CONSTRAINT [FK_Orden_Tecnico]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Cotizacion] FOREIGN KEY([id_cotizacion])
REFERENCES [dbo].[Cotizacion] ([id_cotizacion])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Cotizacion]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Taller] FOREIGN KEY([id_taller])
REFERENCES [dbo].[Taller] ([id_taller])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Taller]
GO
ALTER TABLE [dbo].[Tecnico]  WITH CHECK ADD  CONSTRAINT [FK_Tecnico_Taller] FOREIGN KEY([id_taller])
REFERENCES [dbo].[Taller] ([id_taller])
GO
ALTER TABLE [dbo].[Tecnico] CHECK CONSTRAINT [FK_Tecnico_Taller]
GO
USE [master]
GO
ALTER DATABASE [proyecto_alfa] SET  READ_WRITE 
GO
