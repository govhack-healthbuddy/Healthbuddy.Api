using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Model
{
    public class TravelTime
    {
        public string Mode { get; set; }
        public int Days { get; set; }
        public int Hours { get; set; }
        public int Minutes { get; set; }
        public int Seconds { get; set; }

        public string TransitDepartureTime { get; set; }

        public string TransitDepartureStop { get; set; }

        public string TransitArrivalTime { get; set; }

        public string TransitArrivalStop { get; set; }

        public string TransitRoute { get; set; }

        public string TransitRouteDescription { get; set; }
    }
}
