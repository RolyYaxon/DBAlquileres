USE [master]
GO
/****** Object:  Database [SistemaAlquileres]    Script Date: 17/10/2024 17:31:47 ******/
CREATE DATABASE [SistemaAlquileres]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaAlquileres', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SistemaAlquileres.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaAlquileres_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SistemaAlquileres_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SistemaAlquileres] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaAlquileres].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaAlquileres] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SistemaAlquileres] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaAlquileres] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaAlquileres] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemaAlquileres] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaAlquileres] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistemaAlquileres] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaAlquileres] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaAlquileres] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaAlquileres] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaAlquileres] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaAlquileres] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaAlquileres] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SistemaAlquileres] SET QUERY_STORE = OFF
GO
USE [SistemaAlquileres]
GO
/****** Object:  Table [dbo].[Inquilinos]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inquilinos](
	[ID_Inquilino] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Completo] [nvarchar](255) NULL,
	[Informacion_Contacto] [nvarchar](255) NULL,
	[Documentos] [nvarchar](max) NULL,
	[Fecha_Registro] [date] NULL,
	[Estado_Inquilino] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Inquilino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contratos]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contratos](
	[ID_Contrato] [int] IDENTITY(1,1) NOT NULL,
	[ID_Propiedad] [int] NULL,
	[ID_Inquilino] [int] NULL,
	[Fecha_Inicio] [date] NULL,
	[Fecha_Finalizacion] [date] NULL,
	[Monto_Alquiler] [decimal](10, 2) NULL,
	[Deposito] [decimal](10, 2) NULL,
	[Condiciones] [nvarchar](max) NULL,
	[Estado_Contrato] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[ID_Pago] [int] IDENTITY(1,1) NOT NULL,
	[ID_Contrato] [int] NULL,
	[Monto_Pago] [decimal](10, 2) NULL,
	[Fecha_Pago] [date] NULL,
	[ID_Metodo] [int] NULL,
	[Estado_Pago] [nvarchar](50) NULL,
	[Intereses_Mora] [decimal](10, 2) NULL,
	[Referencia_Transaccion] [nvarchar](255) NULL,
	[Notas] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[PagosPendientes]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PagosPendientes] AS
SELECT p.ID_Pago, p.Monto_Pago, c.ID_Inquilino, i.Nombre_Completo, p.Estado_Pago
FROM Pagos p
INNER JOIN Contratos c ON p.ID_Contrato = c.ID_Contrato
INNER JOIN Inquilinos i ON c.ID_Inquilino = i.ID_Inquilino
WHERE p.Estado_Pago = 'Pendiente';
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[ID_Administrador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Completo] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Direccion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Administrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados_Propiedad]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados_Propiedad](
	[ID_Estado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metodos_Pago]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metodos_Pago](
	[ID_Metodo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Metodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificaciones]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificaciones](
	[ID_Notificacion] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Notificacion] [int] NULL,
	[Fecha_Envio] [date] NULL,
	[ID_Destinatario_Admin] [int] NULL,
	[ID_Destinatario_Inquilino] [int] NULL,
	[Contenido] [nvarchar](max) NULL,
	[Estado_Notificacion] [nvarchar](50) NULL,
	[Prioridad] [nvarchar](50) NULL,
	[Estado_Lectura] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Notificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedades]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedades](
	[ID_Propiedad] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Propiedad] [int] NULL,
	[Numero_Habitaciones] [int] NULL,
	[Numero_Banos] [int] NULL,
	[Area] [decimal](10, 2) NULL,
	[Precio_Alquiler] [decimal](10, 2) NULL,
	[Deposito_Requerido] [decimal](10, 2) NULL,
	[Estado_Propiedad] [int] NULL,
	[Ubicacion] [nvarchar](255) NULL,
	[Coordenadas_GPS] [nvarchar](255) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Fecha_Registro] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Propiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Notificacion]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Notificacion](
	[ID_Tipo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Propiedad]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Propiedad](
	[ID_Tipo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Completo] [nvarchar](100) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Contrasena] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](15) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Rol] [nvarchar](50) NOT NULL,
	[Codigo_Administracion] [nvarchar](50) NULL,
	[Direccion_Propiedad] [nvarchar](255) NULL,
	[Fecha_Registro] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administradores] ON 

INSERT [dbo].[Administradores] ([ID_Administrador], [Nombre_Completo], [Email], [Telefono], [Direccion]) VALUES (1, N'Ana Ramírez', N'ana.ramirez@example.com', N'555-1234', N'Calle 1, Ciudad')
INSERT [dbo].[Administradores] ([ID_Administrador], [Nombre_Completo], [Email], [Telefono], [Direccion]) VALUES (2, N'Luis Morales', N'luis.morales@example.com', N'555-5678', N'Calle 2, Ciudad')
INSERT [dbo].[Administradores] ([ID_Administrador], [Nombre_Completo], [Email], [Telefono], [Direccion]) VALUES (3, N'Ana Ramírez', N'ana.ramirez@example.com', N'555-1234', N'Calle 1, Ciudad')
INSERT [dbo].[Administradores] ([ID_Administrador], [Nombre_Completo], [Email], [Telefono], [Direccion]) VALUES (4, N'Luis Morales', N'luis.morales@example.com', N'555-5678', N'Calle 2, Ciudad')
INSERT [dbo].[Administradores] ([ID_Administrador], [Nombre_Completo], [Email], [Telefono], [Direccion]) VALUES (5, N'Rolando', N'Rolando@gmail.com', N'1234', N'123')
SET IDENTITY_INSERT [dbo].[Administradores] OFF
GO
SET IDENTITY_INSERT [dbo].[Contratos] ON 

INSERT [dbo].[Contratos] ([ID_Contrato], [ID_Propiedad], [ID_Inquilino], [Fecha_Inicio], [Fecha_Finalizacion], [Monto_Alquiler], [Deposito], [Condiciones], [Estado_Contrato]) VALUES (1, 1, 1, CAST(N'2024-01-01' AS Date), CAST(N'2025-01-01' AS Date), CAST(850.00 AS Decimal(10, 2)), CAST(850.00 AS Decimal(10, 2)), N'Contrato a un año. Pagos mensuales.', N'Finalizado')
INSERT [dbo].[Contratos] ([ID_Contrato], [ID_Propiedad], [ID_Inquilino], [Fecha_Inicio], [Fecha_Finalizacion], [Monto_Alquiler], [Deposito], [Condiciones], [Estado_Contrato]) VALUES (2, 2, 2, CAST(N'2024-02-15' AS Date), CAST(N'2025-02-15' AS Date), CAST(1500.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), N'Contrato a un año. Pagos mensuales.', N'Activo')
INSERT [dbo].[Contratos] ([ID_Contrato], [ID_Propiedad], [ID_Inquilino], [Fecha_Inicio], [Fecha_Finalizacion], [Monto_Alquiler], [Deposito], [Condiciones], [Estado_Contrato]) VALUES (3, 1, 1, CAST(N'2024-09-28' AS Date), CAST(N'2024-09-28' AS Date), CAST(1550.00 AS Decimal(10, 2)), CAST(1550.00 AS Decimal(10, 2)), N'Nnuevo', N'Activo')
SET IDENTITY_INSERT [dbo].[Contratos] OFF
GO
SET IDENTITY_INSERT [dbo].[Estados_Propiedad] ON 

INSERT [dbo].[Estados_Propiedad] ([ID_Estado], [Descripcion]) VALUES (1, N'Disponible')
INSERT [dbo].[Estados_Propiedad] ([ID_Estado], [Descripcion]) VALUES (2, N'Alquilado')
INSERT [dbo].[Estados_Propiedad] ([ID_Estado], [Descripcion]) VALUES (3, N'Mantenimiento')
INSERT [dbo].[Estados_Propiedad] ([ID_Estado], [Descripcion]) VALUES (4, N'Reservado')
SET IDENTITY_INSERT [dbo].[Estados_Propiedad] OFF
GO
SET IDENTITY_INSERT [dbo].[Inquilinos] ON 

INSERT [dbo].[Inquilinos] ([ID_Inquilino], [Nombre_Completo], [Informacion_Contacto], [Documentos], [Fecha_Registro], [Estado_Inquilino]) VALUES (1, N'Juan Pérez', N'juan.perez@example.com', N'DPI: 1234567890101', CAST(N'2024-09-26' AS Date), N'Activo')
INSERT [dbo].[Inquilinos] ([ID_Inquilino], [Nombre_Completo], [Informacion_Contacto], [Documentos], [Fecha_Registro], [Estado_Inquilino]) VALUES (2, N'María López', N'maria.lopez@example.com', N'DPI: 9876543210101', CAST(N'2024-09-26' AS Date), N'Activo')
INSERT [dbo].[Inquilinos] ([ID_Inquilino], [Nombre_Completo], [Informacion_Contacto], [Documentos], [Fecha_Registro], [Estado_Inquilino]) VALUES (3, N'Carlos Sánchez', N'carlos.sanchez@example.com', N'DPI: 4561237890101', CAST(N'2024-09-26' AS Date), N'Activo')
INSERT [dbo].[Inquilinos] ([ID_Inquilino], [Nombre_Completo], [Informacion_Contacto], [Documentos], [Fecha_Registro], [Estado_Inquilino]) VALUES (4, N'string', N'user@example.com', N'string', CAST(N'2024-09-28' AS Date), N'string')
INSERT [dbo].[Inquilinos] ([ID_Inquilino], [Nombre_Completo], [Informacion_Contacto], [Documentos], [Fecha_Registro], [Estado_Inquilino]) VALUES (5, N'Carlos Sánchez', N'carlos.sanchez1@example.com', N'DPI: 4561237890101', CAST(N'2024-09-26' AS Date), N'Activo')
SET IDENTITY_INSERT [dbo].[Inquilinos] OFF
GO
SET IDENTITY_INSERT [dbo].[Metodos_Pago] ON 

INSERT [dbo].[Metodos_Pago] ([ID_Metodo], [Descripcion]) VALUES (1, N'Tarjeta de crédito')
INSERT [dbo].[Metodos_Pago] ([ID_Metodo], [Descripcion]) VALUES (2, N'Transferencia bancaria')
INSERT [dbo].[Metodos_Pago] ([ID_Metodo], [Descripcion]) VALUES (3, N'Efectivo')
INSERT [dbo].[Metodos_Pago] ([ID_Metodo], [Descripcion]) VALUES (4, N'PayPal')
SET IDENTITY_INSERT [dbo].[Metodos_Pago] OFF
GO
SET IDENTITY_INSERT [dbo].[Notificaciones] ON 

INSERT [dbo].[Notificaciones] ([ID_Notificacion], [Tipo_Notificacion], [Fecha_Envio], [ID_Destinatario_Admin], [ID_Destinatario_Inquilino], [Contenido], [Estado_Notificacion], [Prioridad], [Estado_Lectura]) VALUES (1, 1, CAST(N'2024-09-26' AS Date), 1, 1, N'Tienes un pago pendiente de 850.00 para el mes de marzo.', N'Enviada', N'Alta', N'No leído')
INSERT [dbo].[Notificaciones] ([ID_Notificacion], [Tipo_Notificacion], [Fecha_Envio], [ID_Destinatario_Admin], [ID_Destinatario_Inquilino], [Contenido], [Estado_Notificacion], [Prioridad], [Estado_Lectura]) VALUES (2, 2, CAST(N'2024-09-26' AS Date), 2, 2, N'Nuevo contrato registrado para la propiedad en Zona 15.', N'Enviada', N'Alta', N'Leído')
SET IDENTITY_INSERT [dbo].[Notificaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 

INSERT [dbo].[Pagos] ([ID_Pago], [ID_Contrato], [Monto_Pago], [Fecha_Pago], [ID_Metodo], [Estado_Pago], [Intereses_Mora], [Referencia_Transaccion], [Notas]) VALUES (1, 1, CAST(850.00 AS Decimal(10, 2)), CAST(N'2024-02-01' AS Date), 1, N'Pagado', CAST(0.00 AS Decimal(10, 2)), N'TX123456', N'Pago correspondiente a febrero.')
INSERT [dbo].[Pagos] ([ID_Pago], [ID_Contrato], [Monto_Pago], [Fecha_Pago], [ID_Metodo], [Estado_Pago], [Intereses_Mora], [Referencia_Transaccion], [Notas]) VALUES (2, 2, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2024-02-15' AS Date), 2, N'Pendiente', CAST(0.00 AS Decimal(10, 2)), NULL, N'Pago pendiente correspondiente a febrero.')
INSERT [dbo].[Pagos] ([ID_Pago], [ID_Contrato], [Monto_Pago], [Fecha_Pago], [ID_Metodo], [Estado_Pago], [Intereses_Mora], [Referencia_Transaccion], [Notas]) VALUES (3, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2024-09-28' AS Date), 1, N'Activo', CAST(0.00 AS Decimal(10, 2)), N'TF1', N'string')
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Propiedades] ON 

INSERT [dbo].[Propiedades] ([ID_Propiedad], [Tipo_Propiedad], [Numero_Habitaciones], [Numero_Banos], [Area], [Precio_Alquiler], [Deposito_Requerido], [Estado_Propiedad], [Ubicacion], [Coordenadas_GPS], [Descripcion], [Fecha_Registro]) VALUES (1, 1, 3, 2, CAST(120.50 AS Decimal(10, 2)), CAST(850.00 AS Decimal(10, 2)), CAST(850.00 AS Decimal(10, 2)), 1, N'Zona 10, Ciudad de Guatemala', N'14.6349,-90.5069', N'Apartamento de lujo con balcón', CAST(N'2024-09-26' AS Date))
INSERT [dbo].[Propiedades] ([ID_Propiedad], [Tipo_Propiedad], [Numero_Habitaciones], [Numero_Banos], [Area], [Precio_Alquiler], [Deposito_Requerido], [Estado_Propiedad], [Ubicacion], [Coordenadas_GPS], [Descripcion], [Fecha_Registro]) VALUES (2, 2, 4, 3, CAST(200.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), 2, N'Zona 15, Ciudad de Guatemala', N'14.6078,-90.4907', N'Casa espaciosa con jardín', CAST(N'2024-09-26' AS Date))
INSERT [dbo].[Propiedades] ([ID_Propiedad], [Tipo_Propiedad], [Numero_Habitaciones], [Numero_Banos], [Area], [Precio_Alquiler], [Deposito_Requerido], [Estado_Propiedad], [Ubicacion], [Coordenadas_GPS], [Descripcion], [Fecha_Registro]) VALUES (3, 1, 5, 3, CAST(300.00 AS Decimal(10, 2)), CAST(1550.00 AS Decimal(10, 2)), CAST(1550.00 AS Decimal(10, 2)), 1, N'string', N'string', N'string', CAST(N'2024-09-27' AS Date))
SET IDENTITY_INSERT [dbo].[Propiedades] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_Notificacion] ON 

INSERT [dbo].[Tipos_Notificacion] ([ID_Tipo], [Descripcion]) VALUES (1, N'Pago pendiente')
INSERT [dbo].[Tipos_Notificacion] ([ID_Tipo], [Descripcion]) VALUES (2, N'Nuevo contrato')
INSERT [dbo].[Tipos_Notificacion] ([ID_Tipo], [Descripcion]) VALUES (3, N'Vencimiento contrato')
INSERT [dbo].[Tipos_Notificacion] ([ID_Tipo], [Descripcion]) VALUES (4, N'Mantenimiento programado')
SET IDENTITY_INSERT [dbo].[Tipos_Notificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_Propiedad] ON 

INSERT [dbo].[Tipos_Propiedad] ([ID_Tipo], [Descripcion]) VALUES (1, N'Apartamento')
INSERT [dbo].[Tipos_Propiedad] ([ID_Tipo], [Descripcion]) VALUES (2, N'Casa')
INSERT [dbo].[Tipos_Propiedad] ([ID_Tipo], [Descripcion]) VALUES (3, N'Condominio')
INSERT [dbo].[Tipos_Propiedad] ([ID_Tipo], [Descripcion]) VALUES (4, N'Oficina')
SET IDENTITY_INSERT [dbo].[Tipos_Propiedad] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (2, N'Carlos Sánchez', N'carlos.sanchez@example.com', N'tenantpass123', N'555-5678', NULL, N'Inquilino', NULL, N'Calle 10, Zona 15', CAST(N'2024-09-27' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (5, N'string', N'user@example.com', N'string', N'1234', N'string', N'Inquilino', N'string', N'string', CAST(N'2024-09-27' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (10, N'John Cena', N'use3r@example.com', N'AQAAAAIAAYagAAAAEK+YJpj/BElOxVv4VKrPxnzIm1rllrRJd3D37i6pNuqHIY9k/EoMR35+gx8W+h2POQ==', N'4512', N'string', N'Inquilino', N'string', N'string', CAST(N'2024-09-27' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (12, N'string', N'string@example.com', N'AQAAAAIAAYagAAAAEBE+MHRm2P/WB99M82nJP4D3HA+SYDWC1np7dNwilhN4SOmvF2bgkzo4mNrdimcm9Q==', N'123', N'123', N'Inquilino', NULL, N'string', CAST(N'2024-10-04' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (13, N'Rolando', N'test1@gmail.com', N'AQAAAAIAAYagAAAAELXfQhyTioltD7qcF5Qr/vza+GxtGeLauFjdJHzyiXPiSM5ECdxrZj6LJpo0Ky/gog==', N'32127948', NULL, N'Inquilino', NULL, N'12 calle', CAST(N'2024-10-04' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (14, N'Rolando', N'test2@gmail.com', N'AQAAAAIAAYagAAAAEM1x2l6nRDPOrGIrDqopH7LLqRUfErrC68C8AGW7vn/n5n/AzKRpXfBoy8XEO2GTEA==', N'1234', NULL, N'Administrador', N'1234', NULL, CAST(N'2024-10-04' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (17, N'Rolando', N'wwefanesp1@gmail.com', N'AQAAAAIAAYagAAAAEIYsKGYxIJcp3JGaTFo3J9YJnOviMSK6G99YCBda848kC8EGIpMLM8qj0PIwkLPqDQ==', N'32127948', NULL, N'Inquilino', NULL, N'12 calle ', CAST(N'2024-10-05' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (20, N'Rolando', N'rryaxonr@gmail.com', N'AQAAAAIAAYagAAAAEPFr6oTZqS1lJ1t0RDanTgOSdb0noec8Ok0s7E+wnxlTpetWnnr5Nsp9PpkyKlH0ig==', N'32127948', NULL, N'Inquilino', NULL, N'12 calle ', CAST(N'2024-10-05' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (22, N'Rolando Yaxon', N'ryaxonr@miumg.edu.gt', N'AQAAAAIAAYagAAAAEBZjZ8yH4yv4SQdrLqopEGVM+Xwxhj0E9kP1hJXjy7VwMVLFpy0/tazO7OBpY66oMA==', N'32127948', NULL, N'Inquilino', NULL, N'12 calle', CAST(N'2024-10-05' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (23, N'Rolando Yaxon', N'yaxonrafa250@gmail.com', N'AQAAAAIAAYagAAAAEGkroRGdsdAnSB3XCKmBvRrHOkWzmXj8vTSf6Z+em0MQleIF+xkpaDlavAOiVhGDbg==', N'32127948', NULL, N'Inquilino', NULL, N'12 calle', CAST(N'2024-10-12' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Completo], [Correo], [Contrasena], [Telefono], [Direccion], [Rol], [Codigo_Administracion], [Direccion_Propiedad], [Fecha_Registro]) VALUES (24, N'Daisy', N'daisyabigail01@gmail.com', N'AQAAAAIAAYagAAAAEAFbwV4ophkwK0LmV1ZuTKBcSU9IsjXT0qSa3WQZjXuaVEnxe8AYGZWoKFkt4Z1dwQ==', N'123', NULL, N'Inquilino', NULL, N'12 calle', CAST(N'2024-10-12' AS Date))
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Object:  Index [IX_Contrato_Propiedad]    Script Date: 17/10/2024 17:31:47 ******/
CREATE NONCLUSTERED INDEX [IX_Contrato_Propiedad] ON [dbo].[Contratos]
(
	[ID_Propiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notificaciones_Admin]    Script Date: 17/10/2024 17:31:47 ******/
CREATE NONCLUSTERED INDEX [IX_Notificaciones_Admin] ON [dbo].[Notificaciones]
(
	[ID_Destinatario_Admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Propiedad_Estado]    Script Date: 17/10/2024 17:31:47 ******/
CREATE NONCLUSTERED INDEX [IX_Propiedad_Estado] ON [dbo].[Propiedades]
(
	[Estado_Propiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__60695A197E0C7FE4]    Script Date: 17/10/2024 17:31:47 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [Fecha_Registro]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD FOREIGN KEY([ID_Inquilino])
REFERENCES [dbo].[Inquilinos] ([ID_Inquilino])
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD FOREIGN KEY([ID_Propiedad])
REFERENCES [dbo].[Propiedades] ([ID_Propiedad])
GO
ALTER TABLE [dbo].[Notificaciones]  WITH CHECK ADD FOREIGN KEY([ID_Destinatario_Admin])
REFERENCES [dbo].[Administradores] ([ID_Administrador])
GO
ALTER TABLE [dbo].[Notificaciones]  WITH CHECK ADD FOREIGN KEY([ID_Destinatario_Inquilino])
REFERENCES [dbo].[Inquilinos] ([ID_Inquilino])
GO
ALTER TABLE [dbo].[Notificaciones]  WITH CHECK ADD FOREIGN KEY([Tipo_Notificacion])
REFERENCES [dbo].[Tipos_Notificacion] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([ID_Contrato])
REFERENCES [dbo].[Contratos] ([ID_Contrato])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([ID_Metodo])
REFERENCES [dbo].[Metodos_Pago] ([ID_Metodo])
GO
ALTER TABLE [dbo].[Propiedades]  WITH CHECK ADD FOREIGN KEY([Estado_Propiedad])
REFERENCES [dbo].[Estados_Propiedad] ([ID_Estado])
GO
ALTER TABLE [dbo].[Propiedades]  WITH CHECK ADD FOREIGN KEY([Tipo_Propiedad])
REFERENCES [dbo].[Tipos_Propiedad] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD CHECK  (([Rol]='Inquilino' OR [Rol]='Administrador'))
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CK_Rol] CHECK  (([Rol]='Inquilino' OR [Rol]='Administrador'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CK_Rol]
GO
/****** Object:  StoredProcedure [dbo].[RegistrarInquilino]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarInquilino]
@Nombre_Completo NVARCHAR(255),
@Informacion_Contacto NVARCHAR(255),
@Documentos NVARCHAR(MAX),
@Estado_Inquilino NVARCHAR(50)
AS
BEGIN
  INSERT INTO Inquilinos (Nombre_Completo, Informacion_Contacto, Documentos, Fecha_Registro, Estado_Inquilino)
  VALUES (@Nombre_Completo, @Informacion_Contacto, @Documentos, GETDATE(), @Estado_Inquilino);
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarPago]    Script Date: 17/10/2024 17:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarPago]
@ID_Contrato INT,
@Monto_Pago DECIMAL(10,2),
@ID_Metodo INT,
@Estado_Pago NVARCHAR(50),
@Intereses_Mora DECIMAL(10,2),
@Referencia_Transaccion NVARCHAR(255),
@Notas NVARCHAR(MAX)
AS
BEGIN
  INSERT INTO Pagos (ID_Contrato, Monto_Pago, Fecha_Pago, ID_Metodo, Estado_Pago, Intereses_Mora, Referencia_Transaccion, Notas)
  VALUES (@ID_Contrato, @Monto_Pago, GETDATE(), @ID_Metodo, @Estado_Pago, @Intereses_Mora, @Referencia_Transaccion, @Notas);
END;

GO
USE [master]
GO
ALTER DATABASE [SistemaAlquileres] SET  READ_WRITE 
GO
