﻿using System;
using System.Collections.Generic;

namespace UltimaPrueba.Models;

public partial class Habitacione
{
    public int IdHabitacion { get; set; }

    public string Nombre { get; set; } = null!;

    public int IdTipoHabitacion { get; set; }

    public string? Descripcion { get; set; }

    public int? Cantidad { get; set; }

    public DateTime FechaRegistro { get; set; }

    public decimal Precio { get; set; }

    public bool Estado { get; set; }

    public virtual ICollection<HabitacionMueble> HabitacionMuebles { get; set; } = new List<HabitacionMueble>();

    public virtual TipoHabitacione? oTipoHabitacion { get; set; }

    public virtual ICollection<ImagenHabitacion> ImagenHabitacions { get; set; } = new List<ImagenHabitacion>();

    public virtual ICollection<Paquete> Paquetes { get; set; } = new List<Paquete>();
}
