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

                result.Facilities.AddRange(hospitals.Select(a => new Facility
                    {
                        Name = a.Hospital_name,
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
