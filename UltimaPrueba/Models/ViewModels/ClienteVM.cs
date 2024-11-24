using Microsoft.AspNetCore.Mvc.Rendering;

namespace UltimaPrueba.Models.ViewModels
{
    public class ClienteVM
    {
        public Cliente oCliente { get; set; }
        public List<SelectListItem> oListaTipoDocumento { get; set; }
    }
}
