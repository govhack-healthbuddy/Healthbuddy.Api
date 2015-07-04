using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Model
{
    public class Location
    {
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Suburb { get; set; }
        public string Postcode { get; set; }
    }
}
