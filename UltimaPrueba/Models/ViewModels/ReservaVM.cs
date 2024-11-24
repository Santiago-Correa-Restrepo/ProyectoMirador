using Microsoft.AspNetCore.Mvc.Rendering;

namespace UltimaPrueba.Models.ViewModels
{
    public class ReservaVM
    {
        public Reserva oReserva { get; set; }
        public List<SelectListItem> oListaEstados { get; set; }
        public List<SelectListItem> oListaMetodoPagos { get; set; }
    }
}
