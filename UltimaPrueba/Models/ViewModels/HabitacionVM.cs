using Microsoft.AspNetCore.Mvc.Rendering;

namespace UltimaPrueba.Models.ViewModels
{
    public class HabitacionVM
    {
        public Habitacione oHabitacion { get; set; }
        public List<SelectListItem> oListaTipoHabitaciones { get; set; }
    }
}
