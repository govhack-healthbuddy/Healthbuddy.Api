using HealthBuddy.Api.Model;
using HealthBuddy.Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace HealthBuddy.Api.Controllers
{
    public class TaxiController : ApiController
    {
        private GovhackModelEntities db = new GovhackModelEntities();

        [HttpGet]
        public TaxiResult Get()
        {
            TaxiResult result = new TaxiResult();

            var services = db.SaCommunityServiceDirectories.Where(a => a.Organization_Name.Contains("Taxi")).ToList();

            result.TaxiServices.AddRange(services.Select(hosp => new TaxiService
                {
                    Name = hosp.Organization_Name,
                    Phone = string.IsNullOrEmpty(hosp.Phone__1) ? hosp.Mobile__1 : hosp.Phone__1,
                    Services = hosp.Services,
                }));
            return result;
        }

        private static Location GetLocation(myhospitals_contact_data hospital)
        {
            return new Location
            {
                Address = hospital.Street_address,
                Suburb = hospital.Suburb,
                Postcode = hospital.Postcode,
                Latitude = hospital.Latitude.ToString(),
                Longitude = hospital.Longitude.ToString()
            };
        }

        /// <summary>
        /// Gets the last LengthOfStay entry for the hospital. The last entry is the most recent quarter for which data is available.
        /// </summary>
        /// <param name="hospital"></param>
        /// <param name="lengthsOfStay"></param>
        /// <returns></returns>
        private double? GetLengthOfStay(myhospitals_contact_data hospital, List<emergencydept4hourlengthofstaymetadata> lengthsOfStay)
        {
            var los = lengthsOfStay.LastOrDefault(a => a.MyHospitalsId == hospital.Id);
            if (los != null && los.LessThan4HrsPct.HasValue)
            {
                return (double)los.LessThan4HrsPct.Value;
            }
            return null;
        }

        private EmergencyDepartmentStatus GetEDStatus(myhospitals_contact_data hospital, List<ED001_HospitalStatus> emergencyStats)
        {
            var status = emergencyStats.LastOrDefault(a => a.HospitalCode == hospital.HospitalCode);
            if (status != null)
            {
                return new EmergencyDepartmentStatus
                {
                    AvgWaitTimeMinsExclHigh = (double)status.AvgWaitTimeMinsExclHigh,
                    Capacity = (int)status.Capacity,
                    CommencedTreatment = (int)status.EdCommenced,
                    ExpectedArrivals = (int)status.ExpectedArrivals,
                    Waiting = (int)status.EdWaiting
                };
            }
            return null;
        }


        private string FormatPostcode(int? nullable)
        {
            string formatted = null;
            if (nullable.HasValue)
            {
                formatted = string.Format("{0:0000}", nullable.Value);
            }
            return formatted;
        }

        // POST: api/Main
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Main/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Main/5
        public void Delete(int id)
        {
        }
    }
}
