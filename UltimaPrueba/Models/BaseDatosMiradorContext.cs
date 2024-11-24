using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace UltimaPrueba.Models;

public partial class BaseDatosMiradorContext : DbContext
{
    public BaseDatosMiradorContext()
    {
    }

    public BaseDatosMiradorContext(DbContextOptions<BaseDatosMiradorContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Abono> Abonos { get; set; }

    public virtual DbSet<Cliente> Clientes { get; set; }

    public virtual DbSet<DetalleReservaPaquete> DetalleReservaPaquetes { get; set; }

    public virtual DbSet<DetalleReservaServicio> DetalleReservaServicios { get; set; }

    public virtual DbSet<EstadosReserva> EstadosReservas { get; set; }

    public virtual DbSet<HabitacionMueble> HabitacionMuebles { get; set; }

    public virtual DbSet<Habitacione> Habitaciones { get; set; }

    public virtual DbSet<ImagenAbono> ImagenAbonos { get; set; }

    public virtual DbSet<ImagenHabitacion> ImagenHabitacions { get; set; }

    public virtual DbSet<ImagenPaquete> ImagenPaquetes { get; set; }

    public virtual DbSet<ImagenServicio> ImagenServicios { get; set; }

    public virtual DbSet<Imagene> Imagenes { get; set; }

    public virtual DbSet<MetodoPago> MetodoPagos { get; set; }

    public virtual DbSet<Mueble> Muebles { get; set; }

    public virtual DbSet<Paquete> Paquetes { get; set; }

    public virtual DbSet<PaqueteServicio> PaqueteServicios { get; set; }

    public virtual DbSet<Permiso> Permisos { get; set; }

    public virtual DbSet<PermisosRole> PermisosRoles { get; set; }

    public virtual DbSet<Reserva> Reservas { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Servicio> Servicios { get; set; }

    public virtual DbSet<TipoDocumento> TipoDocumentos { get; set; }

    public virtual DbSet<TipoHabitacione> TipoHabitaciones { get; set; }

    public virtual DbSet<TipoServicio> TipoServicios { get; set; }

    public virtual DbSet<Usuario> Usuarios { get; set; }

//    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
//        => optionsBuilder.UseSqlServer("Server=SANTIAGO\\SQLEXPRESS;Initial Catalog=BaseDatos_Mirador;integrated security=True; TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Abono>(entity =>
        {
            entity.HasKey(e => e.IdAbono).HasName("PK__Abono__A4693DA7172A63C0");

            entity.ToTable("Abono");

            entity.Property(e => e.Iva).HasColumnName("IVA");

            entity.HasOne(d => d.oReserva).WithMany(p => p.Abonos)
                .HasForeignKey(d => d.IdReserva)
                .HasConstraintName("FK__Abono__IdReserva__17036CC0");
        });

        modelBuilder.Entity<Cliente>(entity =>
        {
            entity.HasKey(e => e.NroDocumento).HasName("PK__Clientes__CC62C91CB23D9C53");

            entity.Property(e => e.NroDocumento).ValueGeneratedNever();
            entity.Property(e => e.Apellidos)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Celular)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Contrasena)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Correo)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Estado).HasDefaultValue(true);
            entity.Property(e => e.Nombres)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.Clientes)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("FK__Clientes__IdRol__02084FDA");

            entity.HasOne(d => d.oTipoDocumento).WithMany(p => p.Clientes)
                .HasForeignKey(d => d.IdTipoDocumento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Clientes__IdTipo__02FC7413");
        });

        modelBuilder.Entity<DetalleReservaPaquete>(entity =>
        {
            entity.HasKey(e => e.DetalleReservaPaquete1).HasName("PK__DetalleR__2E8BFF25718C4101");

            entity.ToTable("DetalleReservaPaquete");

            entity.Property(e => e.DetalleReservaPaquete1).HasColumnName("DetalleReservaPaquete");

            entity.HasOne(d => d.oPaquete).WithMany(p => p.DetalleReservaPaquetes)
                .HasForeignKey(d => d.IdPaquete)
                .HasConstraintName("FK__DetalleRe__IdPaq__1332DBDC");

            entity.HasOne(d => d.oReserva).WithMany(p => p.DetalleReservaPaquetes)
                .HasForeignKey(d => d.IdReserva)
                .HasConstraintName("FK__DetalleRe__IdRes__14270015");
        });

        modelBuilder.Entity<DetalleReservaServicio>(entity =>
        {
            entity.HasKey(e => e.IdDetalleReservaServicio).HasName("PK__DetalleR__D3D91A5A7019E755");

            entity.ToTable("DetalleReservaServicio");

            entity.HasOne(d => d.oReserva).WithMany(p => p.DetalleReservaServicios)
                .HasForeignKey(d => d.IdReserva)
                .HasConstraintName("FK__DetalleRe__IdRes__10566F31");

            entity.HasOne(d => d.oServicio).WithMany(p => p.DetalleReservaServicios)
                .HasForeignKey(d => d.IdServicio)
                .HasConstraintName("FK__DetalleRe__IdSer__0F624AF8");
        });

        modelBuilder.Entity<EstadosReserva>(entity =>
        {
            entity.HasKey(e => e.IdEstadoReserva).HasName("PK__EstadosR__3E654CA8D69979E1");

            entity.ToTable("EstadosReserva");

            entity.Property(e => e.NombreEstadoReserva)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        modelBuilder.Entity<HabitacionMueble>(entity =>
        {
            entity.HasKey(e => e.IdHabitacionMueble).HasName("PK__Habitaci__402E049DCCF025B6");

            entity.ToTable("HabitacionMueble");

            entity.HasOne(d => d.IdHabitacionNavigation).WithMany(p => p.HabitacionMuebles)
                .HasForeignKey(d => d.IdHabitacion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Habitacio__IdHab__628FA481");

            entity.HasOne(d => d.IdMuebleNavigation).WithMany(p => p.HabitacionMuebles)
                .HasForeignKey(d => d.IdMueble)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Habitacio__IdMue__6383C8BA");
        });

        modelBuilder.Entity<Habitacione>(entity =>
        {
            entity.HasKey(e => e.IdHabitacion).HasName("PK__Habitaci__8BBBF901C59E0A76");

            entity.Property(e => e.Descripcion)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Estado).HasDefaultValue(true);
            entity.Property(e => e.FechaRegistro)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Precio).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.oTipoHabitacion).WithMany(p => p.Habitaciones)
                .HasForeignKey(d => d.IdTipoHabitacion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Habitacio__IdTip__5BE2A6F2");
        });

        modelBuilder.Entity<ImagenAbono>(entity =>
        {
            entity.HasKey(e => e.IdImagenAbono).HasName("PK__ImagenAb__A40FAE53603D7B74");

            entity.ToTable("ImagenAbono");

            entity.HasOne(d => d.oAbono).WithMany(p => p.ImagenAbonos)
                .HasForeignKey(d => d.IdAbono)
                .HasConstraintName("FK__ImagenAbo__IdAbo__1AD3FDA4");

            entity.HasOne(d => d.oImagen).WithMany(p => p.ImagenAbonos)
                .HasForeignKey(d => d.IdImagen)
                .HasConstraintName("FK__ImagenAbo__IdIma__19DFD96B");
        });

        modelBuilder.Entity<ImagenHabitacion>(entity =>
        {
            entity.HasKey(e => e.IdImagenHabi).HasName("PK__ImagenHa__5B5FF6AD7AC2E9F2");

            entity.ToTable("ImagenHabitacion");

            entity.HasOne(d => d.IdHabitacionNavigation).WithMany(p => p.ImagenHabitacions)
                .HasForeignKey(d => d.IdHabitacion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ImagenHab__IdHab__6754599E");

            entity.HasOne(d => d.IdImagenNavigation).WithMany(p => p.ImagenHabitacions)
                .HasForeignKey(d => d.IdImagen)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ImagenHab__IdIma__66603565");
        });

        modelBuilder.Entity<ImagenPaquete>(entity =>
        {
            entity.HasKey(e => e.IdImagenPaque).HasName("PK__ImagenPa__AD53DF94CFBF02E7");

            entity.ToTable("ImagenPaquete");

            entity.HasOne(d => d.oImagen).WithMany(p => p.ImagenPaquetes)
                .HasForeignKey(d => d.IdImagen)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ImagenPaq__IdIma__778AC167");

            entity.HasOne(d => d.oPaquete).WithMany(p => p.ImagenPaquetes)
                .HasForeignKey(d => d.IdPaquete)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ImagenPaq__IdPaq__787EE5A0");
        });

        modelBuilder.Entity<ImagenServicio>(entity =>
        {
            entity.HasKey(e => e.IdImagenServi).HasName("PK__ImagenSe__3C03784C7C9C7D28");

            entity.ToTable("ImagenServicio");

            entity.HasOne(d => d.IdImagenNavigation).WithMany(p => p.ImagenServicios)
                .HasForeignKey(d => d.IdImagen)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ImagenSer__IdIma__6FE99F9F");

            entity.HasOne(d => d.IdServicioNavigation).WithMany(p => p.ImagenServicios)
                .HasForeignKey(d => d.IdServicio)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ImagenSer__IdSer__70DDC3D8");
        });

        modelBuilder.Entity<Imagene>(entity =>
        {
            entity.HasKey(e => e.IdImagen).HasName("PK__Imagenes__B42D8F2A106CA6E1");
        });

        modelBuilder.Entity<MetodoPago>(entity =>
        {
            entity.HasKey(e => e.IdMetodoPago).HasName("PK__MetodoPa__6F49A9BE0498D322");

            entity.ToTable("MetodoPago");

            entity.Property(e => e.NomMetodoPago)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Mueble>(entity =>
        {
            entity.HasKey(e => e.IdMueble).HasName("PK__Muebles__829D15E8C4CBDCDD");

            entity.Property(e => e.Estado).HasDefaultValue(true);
            entity.Property(e => e.FechaRegistro)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Valor).HasColumnType("decimal(10, 2)");
        });

        modelBuilder.Entity<Paquete>(entity =>
        {
            entity.HasKey(e => e.IdPaquete).HasName("PK__Paquetes__DE278F8BF90B6F44");

            entity.Property(e => e.Descripcion)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Estado).HasDefaultValue(true);
            entity.Property(e => e.NomPaquete)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Precio).HasColumnType("decimal(18, 0)");

            entity.HasOne(d => d.oHabitacion).WithMany(p => p.Paquetes)
                .HasForeignKey(d => d.IdHabitacion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Paquetes__IdHabi__74AE54BC");
        });

        modelBuilder.Entity<PaqueteServicio>(entity =>
        {
            entity.HasKey(e => e.IdPaqueteServicio).HasName("PK__PaqueteS__DE5C2BC273F14B84");

            entity.ToTable("PaqueteServicio");

            entity.Property(e => e.Precio).HasColumnType("decimal(18, 0)");

            entity.HasOne(d => d.oPaquete).WithMany(p => p.PaqueteServicios)
                .HasForeignKey(d => d.IdPaquete)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__PaqueteSe__IdPaq__7B5B524B");

            entity.HasOne(d => d.oServicio).WithMany(p => p.PaqueteServicios)
                .HasForeignKey(d => d.IdServicio)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__PaqueteSe__IdSer__7C4F7684");
        });

        modelBuilder.Entity<Permiso>(entity =>
        {
            entity.HasKey(e => e.IdPermiso).HasName("PK__Permisos__0D626EC86AC10851");

            entity.Property(e => e.NomPermiso)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<PermisosRole>(entity =>
        {
            entity.HasKey(e => e.IdPermisosRoles).HasName("PK__Permisos__8C257ED95E9462A8");

            entity.HasOne(d => d.IdPermisoNavigation).WithMany(p => p.PermisosRoles)
                .HasForeignKey(d => d.IdPermiso)
                .HasConstraintName("FK__PermisosR__IdPer__4E88ABD4");

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.PermisosRoles)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("FK__PermisosR__IdRol__4D94879B");
        });

        modelBuilder.Entity<Reserva>(entity =>
        {
            entity.HasKey(e => e.IdReserva).HasName("PK__Reservas__0E49C69DE92AD394");

            entity.Property(e => e.Iva).HasColumnName("IVA");

            entity.HasOne(d => d.oEstadoReserva).WithMany(p => p.Reservas)
                .HasForeignKey(d => d.IdEstadoReserva)
                .HasConstraintName("FK__Reservas__IdEsta__0B91BA14");

            entity.HasOne(d => d.oMetodoPago).WithMany(p => p.Reservas)
                .HasForeignKey(d => d.MetodoPago)
                .HasConstraintName("FK__Reservas__Metodo__0C85DE4D");

            entity.HasOne(d => d.oCliente).WithMany(p => p.Reservas)
                .HasForeignKey(d => d.NroDocumentoCliente)
                .HasConstraintName("FK__Reservas__NroDoc__09A971A2");

            entity.HasOne(d => d.oUsuario).WithMany(p => p.Reservas)
                .HasForeignKey(d => d.NroDocumentoUsuario)
                .HasConstraintName("FK__Reservas__NroDoc__0A9D95DB");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.IdRol).HasName("PK__Roles__2A49584CFA83D6E8");

            entity.Property(e => e.NomRol)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Servicio>(entity =>
        {
            entity.HasKey(e => e.IdServicio).HasName("PK__Servicio__2DCCF9A241102B3B");

            entity.Property(e => e.Descripcion)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Estado).HasDefaultValue(true);
            entity.Property(e => e.NomServicio)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Precio).HasColumnType("decimal(18, 0)");

            entity.HasOne(d => d.oTipoServicio).WithMany(p => p.Servicios)
                .HasForeignKey(d => d.IdTipoServicio)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Servicios__IdTip__6D0D32F4");
        });

        modelBuilder.Entity<TipoDocumento>(entity =>
        {
            entity.HasKey(e => e.IdTipoDocumento).HasName("PK__TipoDocu__3AB3332F2FF955D4");

            entity.ToTable("TipoDocumento");

            entity.Property(e => e.NomTipoDcumento)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoHabitacione>(entity =>
        {
            entity.HasKey(e => e.IdTipoHabitacion).HasName("PK__TipoHabi__AB75E87CA0F2348D");

            entity.Property(e => e.Estado).HasDefaultValue(true);
            entity.Property(e => e.NomTipoHabitacion)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoServicio>(entity =>
        {
            entity.HasKey(e => e.IdTipoServicio).HasName("PK__TipoServ__E29B3EA7136B1ACD");

            entity.Property(e => e.NombreTipoServicio)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasKey(e => e.NroDocumento).HasName("PK__Usuarios__CC62C91C3687743F");

            entity.Property(e => e.NroDocumento).ValueGeneratedNever();
            entity.Property(e => e.Apellidos)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Celular)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Contrasena)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Correo)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Estado).HasDefaultValue(true);
            entity.Property(e => e.Nombres)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("FK__Usuarios__IdRol__5441852A");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
