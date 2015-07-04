using GoogleMapsApi.Entities.Directions.Request;
using HealthBuddy.Api.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Directions
{
    public class DirectionsService
    {
        const string apiKey = "AIzaSyDIwRxZ2MUNnakY3_YQmW0XGua0_HncBt0";
        const string URL = "https://maps.googleapis.com/maps/api/directions/json?";

        static void Main(string[] args)
        {
            DirectionsService ds = new DirectionsService();
            var result = ds.GetTravelTime("sydney, australia", "melbourne, australia");
            foreach (var entry in result)
            {
                Console.WriteLine("{0}: {1}", entry.Mode, entry.Minutes);
            }
            Console.ReadLine();
        }

        public List<Travel> GetTravelTime(string origin, string destination)
        {
            var list = new List<Travel>();
            foreach (TravelMode mode in Enum.GetValues(typeof(TravelMode)))
            {
                var time = this.GetTravelTime(origin, destination, mode);
                if (time.HasValue)
                {
                    list.Add(
                        new Travel
                        {
                            Mode = mode.ToString(),
                            Days = time.Value.Days,
                            Hours = time.Value.Hours,
                            Minutes = time.Value.Minutes,
                            Seconds = time.Value.Seconds
                        });
                }
            }
            return list;
        }

        public TimeSpan? GetTravelTime(string origin, string destination, TravelMode mode)
        {
            var request = new DirectionsRequest()
            {
                ApiKey = apiKey,
                Origin = origin,
                Destination = destination,
                TravelMode = mode,
                DepartureTime = DateTime.Now,
            };

            var response = GoogleMapsApi.GoogleMaps.Directions.Query(request);

            var route = response.Routes.FirstOrDefault();
            if (route != null)
            {
                var leg = route.Legs.FirstOrDefault();
                if (leg != null)
                {
                    return leg.Duration.Value;
                }
            }
            return null;
        }




        static object GetDirections2(string origin, string destination)
        {
            string url = URL;
            url += "&origin=" + origin;
            url += "&destination=" + destination;
            url += "&key=" + apiKey;
            url += "&region=au";
            var req = HttpWebRequest.Create(url);
            var response = req.GetResponse();
            StreamReader sr = new StreamReader(response.GetResponseStream());
            return JsonConvert.DeserializeObject(sr.ReadToEnd());

        }
    }
}
