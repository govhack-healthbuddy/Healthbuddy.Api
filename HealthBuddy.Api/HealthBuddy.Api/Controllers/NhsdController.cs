using HealthBuddy.Api.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace HealthBuddy.Api.Controllers
{
    public class NhsdController : ApiController
    {
        // GET: api/Main/Origin
        public object Get(string suburb, string postcode)
        {
            var svc = new HealthBuddy.Api.Nhsd.NhsdService();
            var result = svc.Search(new Location { Suburb = suburb, Postcode = postcode }, FacilityType.GP);
            return result;
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
