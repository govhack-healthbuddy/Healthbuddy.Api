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

        // GET: api/Main/Origin
        [HttpGet]
        public FacilitySearchResult Get(string latitude, string longitude, string gender, bool isChild, bool hospital)
        {
            FacilitySearchResult result = new FacilitySearchResult();

            result.Origin = new Location { Latitude = latitude, Longitude = longitude };

            // Get the suburb and postcode for the origin location
            var google = new HealthBuddy.Api.Directions.DirectionsService();
            google.Lookup(result.Origin);

            if (!hospital)
            {
                var nhsd = new HealthBuddy.Api.Nhsd.NhsdService();
                result.Facilities.AddRange(nhsd.Search(result.Origin));
            }

            if (hospital)
            {
                double lat = double.Parse(result.Origin.Latitude);
                double lng = double.Parse(result.Origin.Longitude);

                var hospitals = db.myhospitals_contact_data.OrderBy(a => (a.Latitude - lat) * (a.Latitude - lat)
                + (a.Longitude - lng) * (a.Longitude - lng)).Take(5).ToList();

                var ids = hospitals.Select(a => a.Id).ToArray();
                var lengthsOfStay = db.emergencydept4hourlengthofstaymetadata.Where(a => ids.Contains(a.MyHospitalsId.Value)).OrderBy(a => a.ID).ToList();


                result.Facilities.AddRange(hospitals.Select(a => new Facility
                    {
                        Name = a.Hospital_name,
                        LessThan4HrsPct = GetLengthOfStay(a, lengthsOfStay),
                        Location = new Location
                        {
                            Address = a.Street_address,
                            Suburb = a.Suburb,
                            Postcode = a.Postcode,
                            Latitude = a.Latitude.ToString(),
                            Longitude = a.Longitude.ToString()
                        },
                    }));
            }

            // Get the travel times by driving and transit to each facility.
            foreach (var facility in result.Facilities)
            {
                facility.TravelTimes = google.GetTravelTimes(result.Origin, facility.Location);
            }
            return result;
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
