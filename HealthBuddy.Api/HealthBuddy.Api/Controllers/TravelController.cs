﻿using HealthBuddy.Api.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace HealthBuddy.Api.Controllers
{
    public class TravelController : ApiController
    {
        // GET: api/Main/Origin
        public List<TravelTime> Get(string origin, string destination)
        {
            var svc = new HealthBuddy.Api.Directions.DirectionsService();
            var times = svc.GetTravelTimes(new Location { Suburb = origin }, new Location { Suburb = destination });
            return times;
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
