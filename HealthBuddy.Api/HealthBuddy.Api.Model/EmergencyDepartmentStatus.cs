using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Model
{
    public class EmergencyDepartmentStatus
    {
        /// <summary>
        /// Number of people expected to arrive via ambulance or HealthBuddy.
        /// </summary>
        public int ExpectedArrivals { get; set; }

        /// <summary>
        /// Number of people waiting for treatment.
        /// </summary>
        public int Waiting { get; set; }

        /// <summary>
        /// Number of people whose treatment has commenced.
        /// </summary>
        public int CommencedTreatment { get; set; }

        /// <summary>
        /// Number of patients who can fit in the emergency department.
        /// </summary>
        public int Capacity { get; set; }

        /// <summary>
        /// Average waiting time in minutes, excluding high-priority cases.
        /// </summary>
        public double AvgWaitTimeMinsExclHigh { get; set; }
    }
}
