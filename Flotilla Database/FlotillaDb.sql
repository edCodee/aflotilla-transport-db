USE [master]
GO
/****** Object:  Database [FleetCarsDB]    Script Date: 7/5/2025 10:59:13 ******/
CREATE DATABASE [FleetCarsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FleetCarsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FleetCarsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FleetCarsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FleetCarsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FleetCarsDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FleetCarsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FleetCarsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FleetCarsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FleetCarsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FleetCarsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FleetCarsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FleetCarsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FleetCarsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FleetCarsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FleetCarsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FleetCarsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FleetCarsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FleetCarsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FleetCarsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FleetCarsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FleetCarsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FleetCarsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FleetCarsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FleetCarsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FleetCarsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FleetCarsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FleetCarsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FleetCarsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FleetCarsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FleetCarsDB] SET  MULTI_USER 
GO
ALTER DATABASE [FleetCarsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FleetCarsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FleetCarsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FleetCarsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FleetCarsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FleetCarsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FleetCarsDB', N'ON'
GO
ALTER DATABASE [FleetCarsDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FleetCarsDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FleetCarsDB]
GO
/****** Object:  Table [dbo].[vehicle]    Script Date: 7/5/2025 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle](
	[vehicle_id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_licensePlate] [nvarchar](10) NOT NULL,
	[vehicle_brand] [nvarchar](50) NOT NULL,
	[vehicle_model] [nvarchar](50) NOT NULL,
	[vehicle_year] [smallint] NULL,
	[vehicle_fuelType] [nvarchar](20) NULL,
	[vehicle_tankCapacity] [decimal](5, 2) NOT NULL,
	[vehicle_status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[vehicle_licensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driver]    Script Date: 7/5/2025 10:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driver](
	[driver_id] [int] IDENTITY(1,1) NOT NULL,
	[driver_firstName] [nvarchar](20) NOT NULL,
	[driver_lastName] [nvarchar](20) NOT NULL,
	[driver_license] [nvarchar](20) NOT NULL,
	[driver_licenseCategory] [nvarchar](20) NOT NULL,
	[driver_licenseExpiration] [date] NOT NULL,
	[driver_phone] [nvarchar](10) NULL,
	[driver_status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[driver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assignmentVehicle]    Script Date: 7/5/2025 10:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignmentVehicle](
	[assignmentVehicle_id] [int] IDENTITY(1,1) NOT NULL,
	[assignmentVehicle_vehicleId] [int] NOT NULL,
	[assignmentVehicle_driverId] [int] NOT NULL,
	[assignmentVehicle_AssignmentDate] [datetime] NULL,
	[assignmentVehicle_ReleaseDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[assignmentVehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_VehiclesWithDrivers]    Script Date: 7/5/2025 10:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_VehiclesWithDrivers] AS
SELECT v.vehicle_licensePlate, d.driver_firstName, d.driver_lastName
FROM assignmentVehicle av
JOIN vehicle v ON av.assignmentVehicle_vehicleId = v.vehicle_id
JOIN driver d ON av.assignmentVehicle_driverId = d.driver_id;
GO
/****** Object:  Table [dbo].[document]    Script Date: 7/5/2025 10:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[document](
	[document_id] [int] IDENTITY(1,1) NOT NULL,
	[document_vehicleId] [int] NOT NULL,
	[document_type] [nvarchar](50) NOT NULL,
	[document_expirationDate] [date] NOT NULL,
	[document_status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[document_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fuelConsumption]    Script Date: 7/5/2025 10:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fuelConsumption](
	[consumption_id] [int] IDENTITY(1,1) NOT NULL,
	[consumption_vehicleId] [int] NOT NULL,
	[consumption_date] [date] NULL,
	[consumption_liters] [decimal](5, 2) NOT NULL,
	[consumption_cost] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[consumption_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maintenance]    Script Date: 7/5/2025 10:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maintenance](
	[maintenance_id] [int] IDENTITY(1,1) NOT NULL,
	[maintenance_vehicleId] [int] NOT NULL,
	[maintenance_type] [nvarchar](50) NOT NULL,
	[maintenance_date] [date] NULL,
	[maintenance_cost] [decimal](10, 2) NOT NULL,
	[maintenance_notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[maintenance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[route_]    Script Date: 7/5/2025 10:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[route_](
	[route_id] [int] IDENTITY(1,1) NOT NULL,
	[route_origin] [nvarchar](100) NOT NULL,
	[route_destination] [nvarchar](100) NOT NULL,
	[route_distance] [decimal](6, 2) NOT NULL,
	[route_estimatedTime] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[route_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[routeAssignment]    Script Date: 7/5/2025 10:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[routeAssignment](
	[routeAssignment_id] [int] IDENTITY(1,1) NOT NULL,
	[routeAssignment_vehicleId] [int] NOT NULL,
	[routeAssignment_routeId] [int] NOT NULL,
	[routeAssignment_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[routeAssignment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[assignmentVehicle] ADD  DEFAULT (getdate()) FOR [assignmentVehicle_AssignmentDate]
GO
ALTER TABLE [dbo].[document] ADD  DEFAULT ('Vigente') FOR [document_status]
GO
ALTER TABLE [dbo].[driver] ADD  DEFAULT ('Activo') FOR [driver_status]
GO
ALTER TABLE [dbo].[fuelConsumption] ADD  DEFAULT (getdate()) FOR [consumption_date]
GO
ALTER TABLE [dbo].[maintenance] ADD  DEFAULT (getdate()) FOR [maintenance_date]
GO
ALTER TABLE [dbo].[routeAssignment] ADD  DEFAULT (getdate()) FOR [routeAssignment_date]
GO
ALTER TABLE [dbo].[vehicle] ADD  DEFAULT ('Disponible') FOR [vehicle_status]
GO
ALTER TABLE [dbo].[assignmentVehicle]  WITH CHECK ADD FOREIGN KEY([assignmentVehicle_vehicleId])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO
ALTER TABLE [dbo].[assignmentVehicle]  WITH CHECK ADD FOREIGN KEY([assignmentVehicle_driverId])
REFERENCES [dbo].[driver] ([driver_id])
GO
ALTER TABLE [dbo].[document]  WITH CHECK ADD FOREIGN KEY([document_vehicleId])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO
ALTER TABLE [dbo].[fuelConsumption]  WITH CHECK ADD FOREIGN KEY([consumption_vehicleId])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO
ALTER TABLE [dbo].[maintenance]  WITH CHECK ADD FOREIGN KEY([maintenance_vehicleId])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO
ALTER TABLE [dbo].[routeAssignment]  WITH CHECK ADD FOREIGN KEY([routeAssignment_vehicleId])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO
ALTER TABLE [dbo].[routeAssignment]  WITH CHECK ADD FOREIGN KEY([routeAssignment_routeId])
REFERENCES [dbo].[route_] ([route_id])
GO
ALTER TABLE [dbo].[document]  WITH CHECK ADD CHECK  (([document_type]='Verificación' OR [document_type]='Licencia' OR [document_type]='Seguro'))
GO
ALTER TABLE [dbo].[document]  WITH CHECK ADD CHECK  (([document_status]='Pendiente' OR [document_status]='Expirado' OR [document_status]='Vigente'))
GO
ALTER TABLE [dbo].[driver]  WITH CHECK ADD CHECK  (([driver_status]='Retirado' OR [driver_status]='Suspendido' OR [driver_status]='Activo'))
GO
ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD CHECK  (([vehicle_year]>=(1900) AND [vehicle_year]<=(datepart(year,getdate())+(5))))
GO
ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD CHECK  (([vehicle_fuelType]='Híbrido' OR [vehicle_fuelType]='Eléctrico' OR [vehicle_fuelType]='Diésel' OR [vehicle_fuelType]='GLP' OR [vehicle_fuelType]='Gasolina'))
GO
ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD CHECK  (([vehicle_status]='Ocupado' OR [vehicle_status]='Mantenimiento' OR [vehicle_status]='Disponible'))
GO
USE [master]
GO
ALTER DATABASE [FleetCarsDB] SET  READ_WRITE 
GO
