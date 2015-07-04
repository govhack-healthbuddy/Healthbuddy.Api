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
    public class FacilityController : ApiController
    {
        private GovhackModelEntities db = new GovhackModelEntities();

        /// <summary>
        /// Old API
        /// </summary>
        /// <param name="latitude">User's latitude</param>
        /// <param name="longitude">User's longitude</param>
        /// <param name="gender">Patient's gender</param>
        /// <param name="isChild">Whether patient is a child</param>
        /// <param name="hospital">Whether user desires hospital (or GP)</param>
        /// <returns>Search result</returns>
        [HttpGet]
        public FacilitySearchResult Get(string latitude, string longitude, string gender, bool isChild, bool hospital)
        {
            return this.Get(latitude, longitude, gender, isChild, hospital ? FacilityType.Hospital : FacilityType.GP);
        }

        /// <summary>
        /// New API
        /// </summary>
        /// <param name="latitude">User's latitude</param>
        /// <param name="longitude">User's longitude</param>
        /// <param name="gender">Patient's gender</param>
        /// <param name="isChild">Whether patient is a child</param>
        /// <param name="type">Desired facility type</param>
        /// <returns>Search result</returns>
        [HttpGet]
        public FacilitySearchResult Get(string latitude, string longitude, string gender, bool isChild, FacilityType type)
        {
            FacilitySearchResult result = new FacilitySearchResult();

            result.Origin = new Location { Latitude = latitude, Longitude = longitude };

            // Get the suburb and postcode for the origin location
            var google = new HealthBuddy.Api.Directions.DirectionsService();
            google.Lookup(result.Origin);

            if (type == FacilityType.Hospital)
            {
                // Use GovHack data sets - my hospitals contact list, length of stay data, etc.
                double lat = double.Parse(result.Origin.Latitude);
                double lng = double.Parse(result.Origin.Longitude);

                var hospitals = db.myhospitals_contact_data.OrderBy(a => (a.Latitude - lat) * (a.Latitude - lat)
                + (a.Longitude - lng) * (a.Longitude - lng)).Take(5).ToList();

                var ids = hospitals.Select(a => a.Id).ToArray();
                var codes = hospitals.Select(a => a.HospitalCode).ToArray();
                var lengthsOfStay = db.emergencydept4hourlengthofstaymetadata.Where(a => ids.Contains(a.MyHospitalsId.Value)).OrderBy(a => a.ID).ToList();
                var emergencyStats = db.ED001_HospitalStatus.Where(a => codes.Contains(a.HospitalCode)).OrderBy(a => a.Id).ToList();

                result.Facilities.AddRange(hospitals.Select(hosp => new Facility
                    {
                        Name = hosp.Hospital_name,
                        LessThan4HrsPct = GetLengthOfStay(hosp, lengthsOfStay),
                        EmergencyDepartmentStatus = GetEDStatus(hosp, emergencyStats),
                        Location = GetLocation(hosp),
                    }));
            }
            else
            {
                // Use NHSD lookup.
                var nhsd = new HealthBuddy.Api.Nhsd.NhsdService();
                result.Facilities.AddRange(nhsd.Search(result.Origin, type));
            }

            // Get the travel times by driving and transit to each facility.
            foreach (var facility in result.Facilities)
            {
                facility.TravelTimes = google.GetTravelTimes(result.Origin, facility.Location);
            }
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
