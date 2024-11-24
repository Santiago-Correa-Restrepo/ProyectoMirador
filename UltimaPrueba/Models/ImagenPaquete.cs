using System;
using System.Collections.Generic;

namespace UltimaPrueba.Models;

public partial class ImagenPaquete
{
    public int? IdImagenPaque { get; set; }

    public int? IdImagen { get; set; }

    public int? IdPaquete { get; set; }

    public virtual Imagene? oImagen { get; set; }

    public virtual Paquete? oPaquete { get; set; }
}
