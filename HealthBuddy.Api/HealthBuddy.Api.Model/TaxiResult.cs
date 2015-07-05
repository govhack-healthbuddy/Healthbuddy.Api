using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Model
{
    public class TaxiResult
    {
        public List<TaxiService> TaxiServices { get; set; }

        public TaxiResult()
        {
            this.TaxiServices = new List<TaxiService>();
        }
    }
}
