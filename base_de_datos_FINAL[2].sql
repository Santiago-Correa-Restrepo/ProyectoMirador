
create database BD_Glamping_final;

GO
USE [BD_Glamping_final]
GO
/****** Object:  Table [dbo].[Abono]    Script Date: 18/11/2024 8:16:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abono](
	[IdAbono] [int] IDENTITY(1,1) NOT NULL,
	[IdReserva] [int] ,
	[FechaAbono] [datetime],
	[ValorDeuda] [float] ,
	[Porcentaje] [float] ,
	[Pendiente] [float] ,
	[SubTotal] [float] ,
	[IVA] [float] ,
	[CantAbono] [float] ,
	[Estado] [bit] ,
PRIMARY KEY CLUSTERED 
(
	[IdAbono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[NroDocumento] [int] NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Celular] [varchar](10) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasena] [varchar](200) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdRol] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleReservaPaquete]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReservaPaquete](
	[DetalleReservaPaquete] [int] IDENTITY(1,1) NOT NULL,
	[IdPaquete] [int],
	[IdReserva] [int] ,
	[Cantidad] [int] ,
	[Precio] [float] ,
PRIMARY KEY CLUSTERED 
(
	[DetalleReservaPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleReservaServicio]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReservaServicio](
	[IdDetalleReservaServicio] [int] IDENTITY(1,1) NOT NULL,
	[IdServicio] [int] ,
	[IdReserva] [int] ,
	[Cantidad] [int] ,
	[Precio] [float] ,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleReservaServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosReserva]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosReserva](
	[IdEstadoReserva] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstadoReserva] [varchar](15),
PRIMARY KEY CLUSTERED 
(
	[IdEstadoReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitaciones]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitaciones](
	[IdHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdTipoHabitacion] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Cantidad] [int] NULL,
	[FechaRegistro] [date] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitacionMueble]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitacionMueble](
	[IdHabitacionMueble] [int] IDENTITY(1,1) NOT NULL,
	[IdHabitacion] [int] NOT NULL,
	[IdMueble] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHabitacionMueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagenAbono]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenAbono](
	[IdImagenAbono] [int] IDENTITY(1,1) NOT NULL,
	[IdImagen] [int] ,
	[IdAbono] [int] ,
PRIMARY KEY CLUSTERED 
(
	[IdImagenAbono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagenes]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
	[IdImagen] [int] IDENTITY(1,1) NOT NULL,
	[UrlImagen] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagenHabitacion]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenHabitacion](
	[IdImagenHabi] [int] IDENTITY(1,1) NOT NULL,
	[IdImagen] [int] NOT NULL,
	[IdHabitacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImagenHabi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagenPaquete]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenPaquete](
	[IdImagenPaque] [int] IDENTITY(1,1) NOT NULL,
	[IdImagen] [int] NOT NULL,
	[IdPaquete] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImagenPaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagenServicio]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenServicio](
	[IdImagenServi] [int] IDENTITY(1,1) NOT NULL,
	[IdImagen] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImagenServi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[IdMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[NomMetodoPago] [varchar](20) ,
PRIMARY KEY CLUSTERED 
(
	[IdMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muebles]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muebles](
	[IdMueble] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[FechaRegistro] [date] NOT NULL,
	[Valor] [decimal](10, 2) NULL,
	[Estado] [bit] NOT NULL,
	[Imagen] [varbinary](max) NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paquetes]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquetes](
	[IdPaquete] [int] IDENTITY(1,1) NOT NULL,
	[NomPaquete] [varchar](50)  NULL,
	[Precio] [decimal](18, 0)  NULL,
	[IdHabitacion] [int]  NULL,
	[Estado] [bit]  NULL,
	[Descripcion] [varchar](200)  NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaqueteServicio]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaqueteServicio](
	[IdPaqueteServicio] [int] IDENTITY(1,1) NOT NULL,
	[IdPaquete] [int]  NULL,
	[IdServicio] [int]  NULL,
	[Precio] [decimal](18, 0)  NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaqueteServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[IdPermiso] [int] IDENTITY(1,1) NOT NULL,
	[NomPermiso] [varchar](50) NULL,
	[PermisosSeleccionados] [nvarchar](255) NOT NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermisosRoles]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisosRoles](
	[IdPermisosRoles] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdPermiso] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPermisosRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[NroDocumentoCliente] [int],
	[NroDocumentoUsuario] [int] ,
	[FechaReserva] [datetime] ,
	[FechaInicio] [datetime] ,
	[FechaFinalizacion] [datetime] ,
	[SubTotal] [float] ,
	[Descuento] [float] ,
	[IVA] [float] ,
	[MontoTotal] [float] ,
	[MetodoPago] [int] ,
	[NroPersonas] [int] ,
	[IdEstadoReserva] [int] ,
PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[NomRol] [varchar](20) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[IdServicio] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoServicio] [int] NOT NULL,
	[NomServicio] [varchar](50) NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[IdTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[NomTipoDcumento] [varchar](50) ,
PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoHabitaciones]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoHabitaciones](
	[IdTipoHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[NomTipoHabitacion] [varchar](20) NULL,
	[NumeroPersonas] [int] NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicios]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicios](
	[IdTipoServicio] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoServicio] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/11/2024 8:16:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[NroDocumento] [int] NOT NULL,
	[Tipo_Documento] [varchar](30) NULL,
	[IdTipoDocumento] [int] NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Celular] [varchar](10) NULL,
	[Correo] [varchar](100) NULL,
	[Contrasena] [varchar](200) NULL,
	[Estado] [bit] NOT NULL,
	[IdRol] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abono] ADD  DEFAULT (getdate()) FOR [FechaAbono]
GO
ALTER TABLE [dbo].[Abono] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Habitaciones] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Habitaciones] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Muebles] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Muebles] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Paquetes] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Permisos] ADD  DEFAULT ('Sin permiso') FOR [PermisosSeleccionados]
GO
ALTER TABLE [dbo].[Permisos] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Reservas] ADD  DEFAULT (getdate()) FOR [FechaReserva]
GO
ALTER TABLE [dbo].[Servicios] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[TipoHabitaciones] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Abono]  WITH CHECK ADD FOREIGN KEY([IdReserva])
REFERENCES [dbo].[Reservas] ([IdReserva])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([IdTipoDocumento])
GO
ALTER TABLE [dbo].[DetalleReservaPaquete]  WITH CHECK ADD FOREIGN KEY([IdPaquete])
REFERENCES [dbo].[Paquetes] ([IdPaquete])
GO
ALTER TABLE [dbo].[DetalleReservaPaquete]  WITH CHECK ADD FOREIGN KEY([IdReserva])
REFERENCES [dbo].[Reservas] ([IdReserva])
GO
ALTER TABLE [dbo].[DetalleReservaServicio]  WITH CHECK ADD FOREIGN KEY([IdReserva])
REFERENCES [dbo].[Reservas] ([IdReserva])
GO
ALTER TABLE [dbo].[DetalleReservaServicio]  WITH CHECK ADD FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
GO
ALTER TABLE [dbo].[Habitaciones]  WITH CHECK ADD FOREIGN KEY([IdTipoHabitacion])
REFERENCES [dbo].[TipoHabitaciones] ([IdTipoHabitacion])
GO
ALTER TABLE [dbo].[HabitacionMueble]  WITH CHECK ADD FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[Habitaciones] ([IdHabitacion])
GO
ALTER TABLE [dbo].[HabitacionMueble]  WITH CHECK ADD FOREIGN KEY([IdMueble])
REFERENCES [dbo].[Muebles] ([IdMueble])
GO
ALTER TABLE [dbo].[ImagenAbono]  WITH CHECK ADD FOREIGN KEY([IdAbono])
REFERENCES [dbo].[Abono] ([IdAbono])
GO
ALTER TABLE [dbo].[ImagenAbono]  WITH CHECK ADD FOREIGN KEY([IdImagen])
REFERENCES [dbo].[Imagenes] ([IdImagen])
GO
ALTER TABLE [dbo].[ImagenHabitacion]  WITH CHECK ADD FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[Habitaciones] ([IdHabitacion])
GO
ALTER TABLE [dbo].[ImagenHabitacion]  WITH CHECK ADD FOREIGN KEY([IdImagen])
REFERENCES [dbo].[Imagenes] ([IdImagen])
GO
ALTER TABLE [dbo].[ImagenPaquete]  WITH CHECK ADD FOREIGN KEY([IdImagen])
REFERENCES [dbo].[Imagenes] ([IdImagen])
GO
ALTER TABLE [dbo].[ImagenPaquete]  WITH CHECK ADD FOREIGN KEY([IdPaquete])
REFERENCES [dbo].[Paquetes] ([IdPaquete])
GO
ALTER TABLE [dbo].[ImagenServicio]  WITH CHECK ADD FOREIGN KEY([IdImagen])
REFERENCES [dbo].[Imagenes] ([IdImagen])
GO
ALTER TABLE [dbo].[ImagenServicio]  WITH CHECK ADD FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
GO
ALTER TABLE [dbo].[Paquetes]  WITH CHECK ADD FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[Habitaciones] ([IdHabitacion])
GO
ALTER TABLE [dbo].[PaqueteServicio]  WITH CHECK ADD FOREIGN KEY([IdPaquete])
REFERENCES [dbo].[Paquetes] ([IdPaquete])
GO
ALTER TABLE [dbo].[PaqueteServicio]  WITH CHECK ADD FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
GO
ALTER TABLE [dbo].[PermisosRoles]  WITH CHECK ADD FOREIGN KEY([IdPermiso])
REFERENCES [dbo].[Permisos] ([IdPermiso])
GO
ALTER TABLE [dbo].[PermisosRoles]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([IdEstadoReserva])
REFERENCES [dbo].[EstadosReserva] ([IdEstadoReserva])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([MetodoPago])
REFERENCES [dbo].[MetodoPago] ([IdMetodoPago])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([NroDocumentoCliente])
REFERENCES [dbo].[Clientes] ([NroDocumento])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([NroDocumentoUsuario])
REFERENCES [dbo].[Usuarios] ([NroDocumento])
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD FOREIGN KEY([IdTipoServicio])
REFERENCES [dbo].[TipoServicios] ([IdTipoServicio])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([IdRol])
GO
