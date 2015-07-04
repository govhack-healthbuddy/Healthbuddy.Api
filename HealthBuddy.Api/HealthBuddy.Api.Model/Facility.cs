using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Model
{
    public class Facility
    {
        public List<TravelTime> TravelTimes { get; set; }
        public Location Location { get; set; }

        public string Name { get; set; }

        public object Description { get; set; }
    }
}
