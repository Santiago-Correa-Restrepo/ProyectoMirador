using Microsoft.AspNetCore.Mvc.Rendering;

namespace UltimaPrueba.Models.ViewModels
{
    public class ServicioVM
    {
        public Servicio oServicio { get; set; }
        public List<SelectListItem> oListaTipoServicio { get; set; }
    }
}
