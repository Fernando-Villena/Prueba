USE [master]
GO
/****** Object:  Database [Concesionario]    Script Date: 21/02/2024 11:33:53 a. m. ******/
CREATE DATABASE [Concesionario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Concesionario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Concesionario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Concesionario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Concesionario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Concesionario] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Concesionario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Concesionario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Concesionario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Concesionario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Concesionario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Concesionario] SET ARITHABORT OFF 
GO
ALTER DATABASE [Concesionario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Concesionario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Concesionario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Concesionario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Concesionario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Concesionario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Concesionario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Concesionario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Concesionario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Concesionario] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Concesionario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Concesionario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Concesionario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Concesionario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Concesionario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Concesionario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Concesionario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Concesionario] SET RECOVERY FULL 
GO
ALTER DATABASE [Concesionario] SET  MULTI_USER 
GO
ALTER DATABASE [Concesionario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Concesionario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Concesionario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Concesionario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Concesionario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Concesionario] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Concesionario', N'ON'
GO
ALTER DATABASE [Concesionario] SET QUERY_STORE = ON
GO
ALTER DATABASE [Concesionario] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Concesionario]
GO
/****** Object:  Table [dbo].[MarcaAuto]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcaAuto](
	[MarcaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MarcaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModeloAuto]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModeloAuto](
	[ModeloID] [int] IDENTITY(1,1) NOT NULL,
	[MarcaID] [int] NULL,
	[Nombre] [nvarchar](100) NULL,
	[Precio] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ModeloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[SolicitudID] [int] IDENTITY(1,1) NOT NULL,
	[VendedorID] [int] NULL,
	[ModeloID] [int] NULL,
	[Fecha] [datetime] NULL,
	[Monto] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SolicitudID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[VendedorID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[VendedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MarcaAuto] ON 

INSERT [dbo].[MarcaAuto] ([MarcaID], [Nombre]) VALUES (1, N'Toyota')
INSERT [dbo].[MarcaAuto] ([MarcaID], [Nombre]) VALUES (2, N'Ford')
INSERT [dbo].[MarcaAuto] ([MarcaID], [Nombre]) VALUES (3, N'Chevrolet')
INSERT [dbo].[MarcaAuto] ([MarcaID], [Nombre]) VALUES (4, N'Nissan')
INSERT [dbo].[MarcaAuto] ([MarcaID], [Nombre]) VALUES (5, N'BMW')
INSERT [dbo].[MarcaAuto] ([MarcaID], [Nombre]) VALUES (6, N'Honda')
SET IDENTITY_INSERT [dbo].[MarcaAuto] OFF
GO
SET IDENTITY_INSERT [dbo].[ModeloAuto] ON 

INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (1, 1, N'Corolla', CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (2, 2, N'Fiesta', CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (3, 3, N'Camaro', CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (4, 4, N'Sentra', CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (5, 5, N'Serie 3', CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (6, 6, N'Civic', CAST(22000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (7, 1, N'Yaris', CAST(16000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (8, 2, N'Mustang', CAST(28000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (9, 3, N'Spark', CAST(13000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (10, 4, N'Sentra', CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (11, 5, N'Serie 3', CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (12, 6, N'Civic', CAST(22000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (13, 1, N'Yaris', CAST(16000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (14, 2, N'Mustang', CAST(28000.00 AS Decimal(18, 2)))
INSERT [dbo].[ModeloAuto] ([ModeloID], [MarcaID], [Nombre], [Precio]) VALUES (15, 3, N'Spark', CAST(13000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ModeloAuto] OFF
GO
SET IDENTITY_INSERT [dbo].[Solicitudes] ON 

INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (1, 1, 1, CAST(N'2024-02-21T10:59:47.350' AS DateTime), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (2, 2, 2, CAST(N'2024-02-21T10:59:47.350' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (3, 1, 3, CAST(N'2024-01-21T10:59:47.350' AS DateTime), CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (4, 1, 4, CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (5, 2, 5, CAST(N'2023-02-20T00:00:00.000' AS DateTime), CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (6, 3, 6, CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(22000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (7, 4, 1, CAST(N'2023-04-25T00:00:00.000' AS DateTime), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (8, 1, 2, CAST(N'2023-05-30T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (9, 2, 3, CAST(N'2023-06-15T00:00:00.000' AS DateTime), CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (10, 3, 7, CAST(N'2023-07-22T00:00:00.000' AS DateTime), CAST(16000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (11, 4, 8, CAST(N'2023-08-19T00:00:00.000' AS DateTime), CAST(28000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (12, 1, 9, CAST(N'2023-09-05T00:00:00.000' AS DateTime), CAST(13000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (13, 2, 4, CAST(N'2023-10-11T00:00:00.000' AS DateTime), CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (14, 3, 5, CAST(N'2023-11-13T00:00:00.000' AS DateTime), CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (15, 4, 6, CAST(N'2023-12-21T00:00:00.000' AS DateTime), CAST(22000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (20, 1, 11, CAST(N'2023-08-01T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (21, 2, 11, CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (22, 3, 11, CAST(N'2023-08-12T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (23, 4, 11, CAST(N'2023-08-20T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (24, 5, 11, CAST(N'2023-08-25T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (43, 1, 2, CAST(N'2023-08-02T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (44, 2, 2, CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (45, 3, 2, CAST(N'2023-08-13T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (46, 4, 2, CAST(N'2023-08-21T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (47, 5, 2, CAST(N'2023-08-26T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (48, 5, 2, CAST(N'2023-09-02T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (49, 5, 2, CAST(N'2023-09-12T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (50, 5, 2, CAST(N'2023-09-22T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (51, 1, 2, CAST(N'2023-10-04T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (52, 2, 2, CAST(N'2023-10-15T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (53, 3, 2, CAST(N'2023-10-23T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (54, 5, 11, CAST(N'2024-02-25T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (55, 2, 11, CAST(N'2024-02-25T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (56, 2, 11, CAST(N'2024-02-23T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (57, 2, 11, CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (58, 1, 11, CAST(N'2024-02-25T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (59, 1, 11, CAST(N'2024-02-23T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (60, 1, 11, CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (61, 5, 11, CAST(N'2024-02-25T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (62, 5, 11, CAST(N'2024-02-23T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (63, 5, 11, CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (64, 2, 11, CAST(N'2024-02-25T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (65, 2, 11, CAST(N'2024-02-23T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[Solicitudes] ([SolicitudID], [VendedorID], [ModeloID], [Fecha], [Monto]) VALUES (66, 5, 11, CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(23000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Solicitudes] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendedor] ON 

INSERT [dbo].[Vendedor] ([VendedorID], [Nombre], [Email]) VALUES (1, N'Juan Pérez', N'juan.perez@example.com')
INSERT [dbo].[Vendedor] ([VendedorID], [Nombre], [Email]) VALUES (2, N'Ana Gómez', N'ana.gomez@example.com')
INSERT [dbo].[Vendedor] ([VendedorID], [Nombre], [Email]) VALUES (3, N'Luis Morales', N'luis.morales@example.com')
INSERT [dbo].[Vendedor] ([VendedorID], [Nombre], [Email]) VALUES (4, N'Carmen Ruiz', N'carmen.ruiz@example.com')
INSERT [dbo].[Vendedor] ([VendedorID], [Nombre], [Email]) VALUES (5, N'Roberto Carlos', N'roberto.carlos@example.com')
SET IDENTITY_INSERT [dbo].[Vendedor] OFF
GO
ALTER TABLE [dbo].[ModeloAuto]  WITH CHECK ADD FOREIGN KEY([MarcaID])
REFERENCES [dbo].[MarcaAuto] ([MarcaID])
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD FOREIGN KEY([ModeloID])
REFERENCES [dbo].[ModeloAuto] ([ModeloID])
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD FOREIGN KEY([VendedorID])
REFERENCES [dbo].[Vendedor] ([VendedorID])
GO
/****** Object:  StoredProcedure [dbo].[ModelosSinSolicitudes]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModelosSinSolicitudes] AS
BEGIN
    SELECT mo.ModeloID, mo.Nombre
    FROM ModeloAuto mo
    LEFT JOIN Solicitudes s ON mo.ModeloID = s.ModeloID
    WHERE s.SolicitudID IS NULL;
END
GO
/****** Object:  StoredProcedure [dbo].[SolicitudesMesActual]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SolicitudesMesActual] AS
BEGIN
    SELECT *
    FROM Solicitudes
    WHERE MONTH(Fecha) = MONTH(GETDATE()) AND YEAR(Fecha) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[TresMarcasMasSolicitadas]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TresMarcasMasSolicitadas] AS
BEGIN
    SELECT TOP 3 ma.Nombre, COUNT(*) AS CantidadSolicitudes
    FROM Solicitudes s
    JOIN ModeloAuto mo ON s.ModeloID = mo.ModeloID
    JOIN MarcaAuto ma ON mo.MarcaID = ma.MarcaID
    GROUP BY ma.Nombre
    ORDER BY CantidadSolicitudes DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[TresMesesMasVentas]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TresMesesMasVentas] AS
BEGIN
    SELECT TOP 3 FORMAT(Fecha, 'MMMM yyyy') AS Mes, SUM(Monto) AS TotalVentas
    FROM Solicitudes
    GROUP BY FORMAT(Fecha, 'MMMM yyyy')
    ORDER BY TotalVentas DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[VendedorMenosSolicitudesUltimos30Dias]    Script Date: 21/02/2024 11:33:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VendedorMenosSolicitudesUltimos30Dias] AS
BEGIN
    SELECT TOP 1 v.VendedorID, v.Nombre, COUNT(*) AS CantidadSolicitudes
    FROM Vendedor v
    JOIN Solicitudes s ON v.VendedorID = s.VendedorID
    WHERE s.Fecha >= DATEADD(DAY, -30, GETDATE())
    GROUP BY v.VendedorID, v.Nombre
    ORDER BY CantidadSolicitudes ASC;
END
GO
USE [master]
GO
ALTER DATABASE [Concesionario] SET  READ_WRITE 
GO
