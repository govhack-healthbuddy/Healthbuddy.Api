using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Model
{
    public class FacilitySearchResult
    {
        public List<Facility> Facilities { get; set; }
        public Location Origin { get; set; }

        public FacilitySearchResult()
        {
            this.Facilities = new List<Facility>();
        }
    }
}
